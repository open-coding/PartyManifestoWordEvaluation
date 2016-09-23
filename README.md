# PartyManifestoWordEvaluation
A simple word evaluation for a textfile (used to analyse german party manifestos)

## Idee
Die Idee hinter dem Skript und der Auswertung ist, dass wahrscheinlich ein Autor eines Textes für ihn als wichtig erachtete Aspekte häufiger beschreibt und somit auch bestimmte Wörter häufiger verwendet.

## Beschreibung
Eine einfache Wörter Auswertung für Textdateien (benutzt um Grundsatzprogramme deutscher Parteien zu analysieren)
Das PowerShell-Skript identifiziert alle Wörter mit Großbuchstaben und nachfolgend mindestens 3 Buchstaben. 
Diese werden in Wortgruppen aufgeteilt, indem geschaut wird, welches Wort in anderen enthalten ist. 
Beispielsweise ist in den Wörtern 'Menschen', 'Menschheit' and 'Menschlichkeit' überall das Wort 'Mensch' enthalten, sodass daraus eine Wortgruppe gebildet wird.

Anschließend wird der Text nach den Wörtern durchsucht und alle Vorkommnisse aller Wörter einer Wortgruppe gezählt.
Die Top 3 der häufigsten Wörter wird ausgegeben.

## Benutzung
Das Skript kann in der PowerShell aufgerufen werden und als Parameter können die Dateien angegeben werden, welche untersucht werden sollen:

   .\WordEvaluation.ps1 .\somefile.txt .\anotherfile.txt

bzw.

    .\WordEvaluation.ps1 .\AFD__2016-06-27_afd-grundsatzprogramm_web-version.txt '.\Bündnis 90_Die Grünen__2002_-_Grundsatzprogramm.txt' .\CDU__Grundsatzprogramm_03.12.07_Hannover.txt '.\Die Linke__programm_der_partei_die_linke_erfurt2011.txt' .\SPD__hamburger_programm.txt

## Aussicht
Derzeit arbeitet das Skript noch auf Basis von regulären Ausdrücken und einer Ausschlussliste. 
Das ursprüngliche Ziel war es Substantive innerhalb eines Textes inkl. Worstamm zu identifizieren und diese zu zählen. Es bedarf jedoch eines Online-Wörterbuchs um einzelne Wörter zu prüfen. 
In Zukunft könnte man das Skript an solch ein Online-Wörterbuch anbinden. 

* THE *.TXT, *.PDF OR *.DOC files in this repository are not under MIT LICENSE ! *
* They are the property of their respective owners (the party they belong to) *