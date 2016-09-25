

function Get-CapitalWordGroupsWithWordsMinimum4Chars {
    <# 
      .SYNOPSIS 
      Counts all words within a wordgroup from a textfile
      .DESCRIPTION 
      Reads a textfile and analyses the words within, groups them to their common base word and counts all words per group within the textfile
      .EXAMPLE 
      Get-CapitalWordGroupsWithWordsMinimum4Chars -File .\sometext.txt 
      .PARAMETER File 
      Path to a text file (UTF-8 encoded) as a string
      #>
    [CmdletBinding()]
        param( 
            [parameter(Mandatory=$true,ValueFromPipeline=$true, Position=0)]
            [ValidateScript({  if(Test-Path $_) { $true } else { throw "$_ is no file or doesn't exist" }})]
            [string]$File
    )

    BEGIN {
       #Exclude non-noun words directly until no online dictionary is used to analyse words
       [string[]] $excludes = "Dies", "Ein", "Eine", "Auch", "Diese", "Denn", "Wenn", "Über"
    }
    
    PROCESS {
                $File | % {
                    $currentfile = $_
                    [string[]]$allwords = gc $currentfile -Encoding UTF8 | % {
                        #filter out every word that does not start with a capital letter and continues with a minimum of 3 small letters
                        #thats needed until an online dictionary is used to analyse words to get only the nouns
                        $regex = ([regex]'[A-ZÄÖÜ]{1,1}[a-züöäß]{3,30}')
                        ($regex.Matches($_))| % { $_.Value }
                    }

                    [string[]] $filteredWords = $allwords | ? { $_ -notin $excludes }
                    [string[]] $uniqueWords = $filteredWords | sort -Unique

                    [Microsoft.PowerShell.Commands.GroupInfo[]] $uniqueWordsGroups = ($uniqueWords | group { $_[0] })
                    #$uniqueWordsGroups = $uniqueWordsGroups[$uniqueWordsGroups.Count -1]

                    $uniqueWordsGroups | % {
                        $i = 0
                        
                        $uniqueWords = $_.Group
                        $letter = $_.Name

                        # from all unique words find words in other words (e.g. Menschen, Menschheit and Menschlichkeit all contains Mensch)
                        # and group them in $groupwords
                        $groupWords = $uniqueWords |  % {
                            $i++
                            $aword = $_
                            $percentage = ( (100 / $uniqueWords.Count) * $i )
                            Write-Progress -Activity "Collecting words beginning with '$letter' for $currentfile" -Status "Checking $aword" -PercentComplete $percentage
                            [string[]]$possiblySameWords = @($uniqueWords | ? { $_[0] -ceq $aword[0] } |
                            ? { $_[1] -ceq $aword[1] } | ? { $_[2] -ceq $aword[2] } | ? { $_[3] -ceq $aword[3] } | 
                            ? { $_ -like "$aword*" })
                            New-Object psobject -Property @{ CommonWord=$aword
                                                             SimilarWords=$possiblySameWords 
                                                           }
                            
                        }
                        
                        # filter out words that are already in other Wordgroups
                        $groupWords | ? { $_.CommonWord -notin ($groupWords | ? CommonWord -NE $_.CommonWord).SimilarWords } 
                    } |
                         % { 
                                # count each occurance of a word in a wordgroup within the all words of the text ($filteredWords)
                                $current = $_;
                                $others = $current.SimilarWords; 
                                $count = ($filteredWords | ? { $_ -in $others }).Count;
                                Write-Progress -Activity "Counting words for $($current.CommonWord)"
                                Add-Member -InputObject $current @{TotalCount=$count};
                                $current
                           }

                    Write-Progress -Activity "Finished." -Completed -PercentComplete 100
                }
    }
}

$top = 3

if($args.Count -gt 0){
    $args |  %  { 
                    "`r`nTop $top - grouped capital letter words with minimum 4 chars of file '$_'";
                    $wordGroupsCount = (Get-CapitalWordGroupsWithWordsMinimum4Chars "$_");
                    $wordGroupsCount | sort TotalCount -Descending | select -First $top | ft CommonWord, SimilarWords, TotalCount
                    ""
                }
} else {
    "please provide one ore more paths to UTF-8 encoded textfiles to analyse"
    "e.g. C:\thisscript.ps1 .\file1.txt .\file2.txt .\file3.txt"
}
