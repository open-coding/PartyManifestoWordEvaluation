# PartyManifestoWordEvaluation
A simple word evaluation for a textfile (used to analyse german party manifestos).
Eine einfache Wörter Auswertung für Textdateien (benutzt um Grundsatzprogramme deutscher Parteien zu analysieren)


## Idee
Die Idee hinter dem Skript und der Auswertung ist, dass wahrscheinlich ein Autor eines Textes für ihn als wichtig erachtete Aspekte häufiger beschreibt und somit auch bestimmte Wörter häufiger verwendet.


## Beschreibung
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

	
## Quellen
Die Grundsatzprogramme der einzelnen Parteien stammen aus folgenden Quellen:
 * [AfD - https://www.alternativefuer.de/wp-content/uploads/sites/7/2016/05/2016-06-27_afd-grundsatzprogramm_web-version.pdf](https://www.alternativefuer.de/wp-content/uploads/sites/7/2016/05/2016-06-27_afd-grundsatzprogramm_web-version.pdf)
 * [Bündnis90/Die Grünen - https://www.gruene.de/fileadmin/user_upload/Dokumente/Grundsatzprogramm/2002_-_Grundsatzprogramm.pdf](https://www.gruene.de/fileadmin/user_upload/Dokumente/Grundsatzprogramm/2002_-_Grundsatzprogramm.pdf)
 * [CDU - https://www.cdu.de/system/tdf/media/dokumente/071203-beschluss-grundsatzprogramm-6-navigierbar_1.pdf?file=1&type=field_collection_item&id=1918](https://www.cdu.de/system/tdf/media/dokumente/071203-beschluss-grundsatzprogramm-6-navigierbar_1.pdf?file=1&type=field_collection_item&id=1918)
 * [Die Linke - https://www.die-linke.de/fileadmin/download/dokumente/programm_der_partei_die_linke_erfurt2011.doc](https://www.die-linke.de/fileadmin/download/dokumente/programm_der_partei_die_linke_erfurt2011.doc)
 * [FDP - https://www.fdp.de/sites/default/files/uploads/2016/01/28/karlsruherfreiheitsthesen.pdf](https://www.fdp.de/sites/default/files/uploads/2016/01/28/karlsruherfreiheitsthesen.pdf)
 * [NPD - https://npd.de/Parteiprogramm_NPD.pdf](https://npd.de/Parteiprogramm_NPD.pdf)
 * [SPD - https://www.spd.de/fileadmin/Dokumente/Beschluesse/Grundsatzprogramme/hamburger_programm.pdf](https://www.spd.de/fileadmin/Dokumente/Beschluesse/Grundsatzprogramme/hamburger_programm.pdf)

Abrufdatum: 23.09.2016-25.09.2016

Sie wurden ohne Inhalts- oder Stichwortverzeichnisse in UTF-8 basierte Textdateien konvertiert. Diese wurden als Analysegrundlage genommen.

## Ergebnis
### Zusammenfassung
![image](https://github.com/open-coding/PartyManifestoWordEvaluation/blob/master/results/result_top3_pretty.png)

### PowerShell - Skriptausgaben
![image](https://github.com/open-coding/PartyManifestoWordEvaluation/blob/master/results/result_top3_PowerShell_output.png)
![image](https://github.com/open-coding/PartyManifestoWordEvaluation/blob/master/results/result_top3_PowerShell_output_2.png)


## Aussicht
Derzeit arbeitet das Skript noch auf Basis von regulären Ausdrücken und einer Ausschlussliste. 
Das ursprüngliche Ziel war es Substantive innerhalb eines Textes inkl. Wortstamm zu identifizieren und diese zu zählen. Es bedarf jedoch eines Online-Wörterbuchs um einzelne Wörter zu prüfen. 
In Zukunft könnte man das Skript an solch ein Online-Wörterbuch anbinden. 


## Copyright Notice
THE *.TXT, *.PDF OR *.DOC files in this repository are not under MIT LICENSE !!
They are the property of their respective owners (the party they belong to)
