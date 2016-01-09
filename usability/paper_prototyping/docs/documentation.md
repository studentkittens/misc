---
documentclass: scrreprt
classoption: toc=listof,index=totoc 
include-headers:
    - \usepackage{url} 
    - \usepackage[ngerman]{babel}
    - \usepackage{csquotes}
    - \usepackage[babel, german=quotes]{csquotes}
fontsize: 11pt
sections: yes
toc: yes
lof: yes
lot: no
date: \today
---

\newpage
\pagenumbering{arabic} 
\setcounter{page}{1}



# Einleitung

Kreativität spielt bei sämtlichen Entwicklungsprozessen eine große Rolle.
Ob bei der Entwicklung eines neuen Fahrzeug-Modells, Mobiltelefons oder einer
Benutzeroberfläche für eine Software -- überall werden Ideen skizziert und
Prototypen erstellt.

Das Erstellen von Prototypen ist eine sehr alte Methode, um sich ein erstes Bild
von einer Sache zu machen. In *Effective Prototyping for Software Makers*
werden historische Persönlichkeiten genannt, die bereits Prototypen ihrer
Erfindungen und Entdeckungen erstellten [@softwareproto]. Im späten 15.
Jahrhundert erstellte Leonardo da Vinci detaillierte Entwürfe seiner Ideen
(Abbildung {@fig:davinci}).
Viele dieser auf Papier gezeichneten Prototypen, konnten erst hunderte Jahre
später technisch umgesetzt werden. Mit Thomas Alva Edison wird ein weiterer
Erfinder genannt, der ausgiebig Prototypen nutzte, um neue Ideen zu erforschen.
Anders als da Vinci nutzte Edison die Prototypen nicht nur als Quelle für
Innovationen, sondern auch um die Voraussetzungen für die Herstellung
mitzuteilen. Dazu zählte, welche Teile benötigt wurden, welche Formen hergestellt
werden mussten und wie hoch die Herstellungskosten sind.

Auch wenn es heutzutage zahlreiche digitale Alternativen gibt, um einen Prototyp
herzustellen, hat der Prototyp aus Papier vorallem in frühen Entwicklungsphasen
gewisse Vorteile zu bieten. In der Studienarbeit werden diese Vorteile ebenso
wie die Grenzen, an die das Paper Prototyping stößt, betrachtet. Nachdem ein
allgemeiner Überblick zu Paper Prototyping gegeben wurde, folgt die Betrachtung
von Usability-Tests anhand von Paper Prototyping. Sowohl die Testvorbereitung,
als auch die Durchführung eines Tests wird erläutert. Ein eigens erstellter
Prototyp aus Papier dient als Beispiel für den Test. Anschließend werden
Anwendungsbeispiele vorgestellt. Ein Fazit schließt die Studienarbeit ab.

![Flügel für Flugapparate, Zeichnung von Leonardo da Vinci. [@vincipic]
](docs/pics/davinci.png){#fig:davinci}




# Paper Prototyping

Bevor näher auf die Umsetzung von Usability-Test anhand von Paper Prototyping
eingegangen wird, soll der Begriff *Prototyp* eingeführt und das Paper
Prototyping an sich vorgestellt werden.


## Der Begriff *Prototyp*

Der Begriff *Prototyp* ist weitläufig bekannt und wird sowohl bei der
Herstellung von reellen Produkten als auch in der Entwicklung von Software
verwendet. Die Herkunft des Begriffs ist zurückzuführen auf das griechische
*protos* (der Erste) und *typos* (das Urbild, Vorbild) [@proto]. Demnach ist es
das erste Bild oder das erste Muster eines geplanten Produkts.

Die Erstellung eines Prototypen hat verschiedene Gründe. Zum Einen können damit
Fehler erkannt und behoben werden. Zum Anderen ist es eine gute Möglichkeit, die
Kommunikation im Team zu fördern. Das Produkt liegt zum ersten Mal bildlich oder
physisch vor und das komplette Team hat eine einheitliche Grundlage für
Diskussionen.
Prototypen werden außerdem für Tests verwendet. Es wird beispielsweise die
Funktionalität getestet (Funktions-Test) oder die Gebrauchstauglichkeit für den Benutzer
untersucht (Usability-Test).


## Prototyp aus Papier

Bei Paper Prototyping handelt es sich um einen Prototypen, der mit einfachsten
Mitteln erstellt werden kann. Wie offensichtlich aus dem Begriff *Paper Prototyping*
hervorgeht, ist das verwendete Medium Papier. Zusammen mit Stiften, Schere
und Klebstoff besitzt man bereits das notwendige Material, um einen Prototypen aus
Papier erstellen zu können. Der Kreativität sind dabei keine Grenzen gesetzt.

Paper Prototyping wird seit langem angewendet. In der Literatur werden die
1980er Jahre als Entstehungszeitpunkt des heutigen Paper Prototyping genannt [@snyder].



## Low-Fidelity vs. High-Fidelity Prototyp

In der Literatur wird der Papier-Prototyp als sogenannter Low-Fidelity
Prototyp bezeichnet. Dem gegenüber steht der High-Fidelity Prototyp.
Grundsätzlich geht es um die Frage, wie ähnlich der Prototyp dem Endprodukt ist.
Abbildung
{@fig:lowtohigh} zeigt die Entwicklung vom Low-Fidelity zum High-Fidelity
Prototypen. 
Die Unterscheidung, ob es sich um einen Low- oder High-Fidelity Prototypen
handelt, ausschließlich danach zu treffen, ob ein Papier oder ein digitaler
Prototyp vorliegt, wäre nicht präzise genug.
Um zu einer differenzierten Entscheidung zu kommen, um welche Art von Prototyp
es sich handelt, gibt es sogenannte Fidelity Dimensionen. In der Literatur gibt
es leichte Abwandlungen [@dimensionen1]. Im Grunde sind es die folgenden Dimensionen:

**Visuell**

Hier stellt sich die Frage, wie ähnlich der Prototyp dem Endprodukt im
Aussehen ist. Ein Low-Fidelity Prototyp könnte ein mit Hand gezeichneter
Entwurf sein. Hingegen entspricht das Aussehen des High-Fidelity Prototyps
weitestgehend dem Endprodukt.

**Funktionell**

Die Funktionalität wird hinsichtlicht deren Breite und Tiefe betrachtet.
Die Breite der Funktionalität sagt aus, wieviele Funktionalitäten im Prototyp
umgesetzt sind. Ein Low-Fidelity Prototyp beschränkt sich auf die vorest
wichtigsten Funktionen. Im High-Fidelity Prototyp sind auch unwesentlichere
Funktionen umgesetzt. Die Tiefe der Funktionalität sagt aus, wie umfangreich die
einzelne Funktionalität umgesetzt ist. Ein Low-Fidelity Prototyp würde
beispielsweise nicht die ganze Funktionalität zur Verfügung stellen, Teile davon
wären eventuell feste Vorgaben. Der High-Fidelity Prototyp erlaubt es, die
komplette Funktonalität zu benutzen, als wäre es das Endprodukt.

**Inhalt**

Der Inhalt wird danach beurteilt, ob es dem tatsächlich geplanten Inhalt oder
einem *Dummy-Inhalt* entspricht. Ein Low-Fidelity Prototyp verwendet häufig
für Bilder einen Platzhalter oder als Text einen *Dummy-Text*. Der High-Fidelity
Prototyp hat bereits Bilder und Text, die dem im Endprodukt enthaltenen Inhalten
gleichkommt.


**Interaktion**

Ein Low-Fidelity Prototyp lässt eher wenig Interaktion zu. Der Benutzer erhält
wenig Feedback bezüglich seiner Aktionen. Im High-Fidelity Prototyp sind bereits
sämtliche Interaktionsmöglichkeiten, die der Benutzer hat, vorhanden.
Es werden beispielsweise Formulareingaben validiert, Rückmeldungen zu Aktionen
gegeben oder Schaltflächen animiert. 

![Vom Low-Fidelity Prototypen zum High-Fidelity
Prototypen. [@fromlow] ](docs/pics/lowtohigh.jpg){#fig:lowtohigh}




## Was für Paper Prototyping spricht

Ohne bereits speziell auf die Vorteile von Paper Prototyping für Usability-Tests
einzugehen, hat ein Prototyp aus Papier folgende Vorteile
[@smash_vorteile][@geek_vorteile]:

**Zeitersparnis**
Das Grundelement Papier ermöglicht eine rasche Erstellung eines Prototypen.
Auch Überarbeitungen sind schnell umgesetzt.

**Kostengünstig**
Ein Prototyp aus Papier ist im Vergleich zu digitalen Werkzeugen schnell
erstellt und bindet daher weniger Zeitressourcen, was zu Kostenersparnis führt.
Außerdem sind die Kosten für das benötigte Material verschwindend gering.

**Freies Denken**

Digitale Entwicklungswerkzeuge liefern häufig vorgefertige Schemen und Muster
mit, was den Entwerfenden in seiner Kreativität und Denkweise beeinflussen kann.
Paper Prototyping lässt völlig freies Denken zu.

**Arbeiten und Kommunikation im Team**

Ein Papier Prototyp erleichtert es, dass verschiedene Disziplinen gemeinsam am
Prototyp arbeiten können. Der Designer und der Softwareingenieur können beide in
einem frühen Entwicklungsstadium gemeinsam an Problemstellungen arbeiten.

**Offenheit für Änderungen**

In *The psychological experience of prototyping* [@psycho] zeigt eine 2012
durchgeführte Studie, dass anhand eines Low-Fidelity Prototypen erkannte
Fehler eher als Lernmöglichkeit und Fortschritt angesehen werden, als eine Last,
die zusätzliche Arbeit und Änderungen bedeutet.

## Grenzen des Paper Prototyping

Interaktionen lassen sich mit Paper Prototyping nur eingeschränkt darstellen.
Es ist beispielsweise nicht möglich, Elemente Gesten gesteuert zu vergrößern und
zu verkleinern.

Das Wechseln der Blätter benötigt Zeit und kann die tatsächliche Geschwindigkeit
der Software nicht simulieren. Demnach sind auch keine Performance-Tests
möglich.

Für Marketingzwecke und Präsentationen
empfiehlt es sich zu einem späteren Entwicklungszeitpunkt auf einen
High-Fidelity Prototypen umzusteigen.

# Paper Prototyping und Usability-Tests

## Die Begriffe *Usability* und *Usability-Test*

Der Begriff *Usability* (Deutsch: *Gebrauchstauglichkeit*)  ist in der DIN EN ISO 9241-11:1999 wie folgt definiert:
,,Das Ausmaß in dem ein Produkt durch bestimmte Benutzer in einem bestimmten
Nutzungskontext genutzt werden kann, um bestimmte Ziele effektiv, effizient und
zufriedenstellend zu erreichen"[@din].

Bei einem *Usability-Test* wird die Gebrauchstauglichkeit eines Produkts, beispielsweise
einer Software, auf mögliche Fehler und Schwachstellen untersucht.

## Welche Phase eignet sich zum Testen

In der Literatur wird allseits empfohlen, Usability-Tests so früh wie möglich
durchzuführen. Im Artikel *Paper Prototyping: Getting User Data Before You Code*
schreibt Jakob Nielsen, dass die größten Verbesserungen für die Usability durch
frühzeitiges Sammeln von Daten erzielt werden [@phase].


## Gründe für Usability-Tests anhand Paper Prototyping  

Neben den allgemeinen Vorteilen von Paper Prototyping, die in Abschnitt 2.4
beschrieben sind, werden im Folgenden weitere Gründe genannt, die speziell für
die Durchführung von Usability-Tests anhand von Paper Prototyping sprechen.

Ein Papier Prototyp für Usability-Tests zu verwenden empfiehlt sich besonders
dann, wenn es um die Klärung von grundsätzlichen Fragen geht, wie z.B.
"Funktioniert das Konzept grundsätzlich?" oder "Hat der Benutzer das jeweilige
Ergebnis erwartet?".

Auch für bestimmte Zielgruppen, die mit einem Medium nocht nicht vertraut sind,
eignet sich das Paper Prototyping. So kann eher ausgeschlossen werden, dass
Schwierigkeiten in der Bedienbarkeit am Medium liegen. Bei einem Test mit einer älteren Person, die
bisher noch kein Tablet bedient hat, wäre sonst nicht eindeutig erkennbar, ob Bedienfehler
am fehlenden Umgang mit dem Medium oder der zu testenden Software liegen.

Ein weiteres mögliches Szenario ist die Entwicklung von etwas vollkommen
Neuartigem, wofür es noch keine vorgefertigten Design-Elemente gibt. Der Test
mit einem Papier Prototypen ist in diesem Fall schnell und das Risiko, viel
Arbeit in einen Prototypen gesteckt zu haben, sollte das Konzept nicht
funktionieren, entfällt.



## Der Test

Im Folgenden wird die Vorbereitung und der Ablauf eines Usability-Tests gezeigt.
Die einzelnen Schritte werden anhand eines selbst erstellten Papier
Prototypen erläutert. Abbildung {@fig:proto1} zeigt den Papier Prototypen. Es
handelt sich um einen simplen Webshop, der Artikel für die ganze Familie
anbietet.

![Papier Prototyp eines Webshops für die ganze Familie. Rechts ist die Ansicht
des Outfit-Generators innerhalb der Kategorie *Women* zu sehen. Die
Papierstreifen links dienen als Scrollbars für die Auswahlmöglichkeiten,
sobald ein Thema (Shirts, Shorts, Shoes) gewählt wurde.](docs/pics/proto1.png){#fig:proto1}


### Testvorbereitung

Wie bei allen Usability-Tests, muss auch der Test anhand eines Papier Prototypen
vorbereitet werden. Dazu gehören die folgenden Schritte [@plan] [@snyder S.100]:

**Testperson auswählen**

Es müssen Testpersonen gefunden werden, die dem Nutzerprofil der Software
entsprechen. *Webshop:* Mögliche Testpersonen sind hier Mutter oder Vater der
Familie. 

**Ziel des Tests festlegen**

Es muss festgelegt werden, was der Test zum Ziel hat. Das kann eine ganz
allgemeine Frage sein, beispielsweise ob der Test-Nutzer von Punkt x nach Punkt y navigieren
kann. Ebenso kann es sich um eine spezifische Fragestellung handeln. *Webshop:*
Kann die Testperson erfolgreich ein Outfit bestehend aus Oberteil und Hose
zusammenstellen.


**Welche Bereiche der Software sollen getestet werden**

Es ist festzulegen, welche Bereiche getestet werden. Soll beispielsweise die Navigation
getestet werden, oder bestimmte Funktionalitäten innerhalb einer Ansicht.
*Webshop:* Innerhalb der Kategorie *Women* sollen die Funktionalitäten bezüglich
der Auswahl verschiedener Kleidungsstücke getestet werden.

**Testmethode festlegen**

Hier ist zu bestimmen, wie der Test durchgeführt wird. Es ist möglich, dem
Test-Nutzer Aufgaben zu stellen, die von ihm erledigt werden müssen. Zusätzlich
kann noch festgelegt werden, wie sich der Test-Nutzer dabei verhalten soll.
Bei der Methode *Thinking Aloud* teilt der Test-Nutzer mit, was er bei der
Ausführung der Aufgaben denkt. Ebenso ist es möglich, dass der Test-Nutzer
keine Äußerungen von sich geben soll. *Webshop:* Die Testperson bekommt Aufgaben
gestellt und soll diese mit der Methode *Thinking Aloud* ausführen.


**Liste mit Aufgaben erstellen**

Die Aufgaben, die der Test-Nutzer ausführen soll, müssen vorher festgelegt
werden. *Webshop:* Mögliche Aufgaben sind beispielsweise die Zusammenstellung
eines Outfits, anschließende Bestellung und nachträgliche Änderungen an der
Bestellung.


**Ablauf festlegen**

Der gesamgte Ablauf des Tests muss festgelegt werden. Im folgenden Abschnitt ist
der Ablauf eines Usability-Tests dargestellt. *Webshop:* Es wird exakt
festgelegt, welche Ansichten des Webshops benötigt werden und welche Details die
Testperson erfahren soll. Weitere Details sind im nächsten Abschnitt beschrieben.


*Mögliches Ergebnis der Testvorbereitung für den Webshop:*

+ Testperson: Mutter zwischen 25 und 35 Jahren
+ Ziel: Navigation innerhalb der Kategorie *Women* soll getestet werden und
  welche Schwierigkeiten bei der Zusammenstellung eines Outfits auftreten
+ Bereiche: Kategorie *Women*
+ Testmethode: Aufgaben und Thinking Aloud
+ Aufgaben: Oberteil und Hose auswählen


### Testablauf

Abbildung {@fig:ablauf} zeigt beispielhaft die Testsituation eines
Usability-Tests anhand eines Low-Fidelity Prototypen, wie es das Paper
Prototyping ist. 

![Durchführung eines Usability-Tests anhand eines Low-Fidelity
Prototypen. [@ablauf] ](docs/pics/ablauf.jpg){#fig:ablauf}



**Testperson erhält Einführung**

Der Testperson werden Informationen zum bevorstehenden Test gegeben. Wie
umfangreich diese Informationen sind, hängt vom jeweiligen Testszenario ab.
*Webshop:* Testperson erhält Informationen, um welche Art von Webshop es sich
handelt und welche Aktionen möglich sind.

**Aufgabe wird erklärt**

Die zu erledigende Aufgabe wird erläutert. *Webshop:* Die Testperson erhält die
Aufgabe, ein Outfit bestehend aus einem Oberteil und einer Hose
zusammenzustellen.

**Moderator führt durch den Test**

Der Moderator gibt Hilfestellung und begleitet die Testperson durch den Test.


**Weitere Person übernimmt die Aufgabe des Computers**

Aufgaben, die in der tatsächlichen Software vom Computer ausgeführt werden,
übernimmt eine Person. Sie reagiert auf Aktionen der Testperson und verändert
dementsprechend den Papier Prototypen. *Webshop:* Erfordert die Aktion der
Testperson eine neue Ansicht oder Veränderungen der vorhandenen Elemente,
werden Papier-Elemente ausgetauscht. Wählt die Testperson beispielsweise eine Hose aus,
wird der Ansicht ein Papier-Dummy von einer Hose hinzugefügt.

**Beobachter macht Notizen**

Die Beobachtungen, die während des Usability-Tests gemacht werden, müssen
festgehalten werden, um sie später auswerten zu können.





# Anwendungsbeispiele

## Videospiele

Um einen Usability-Test für Videospiele durchzuführen, wird häufig ein Prototyp aus Papier
genutzt. Vorallem in einem sehr frühen Stadium der Entwicklung. Abbildung
{@fig:game} zeigt einen Papier Prototypen eines Videospiels.

![Papier Prototyp eines Videospiels. [@game] ](docs/pics/game.jpg) {#fig:game}

Eigentlich ist die Animation und Interaktion mit
einem Prototypen aus Papier eher schwierig umzusetzen. Bei Videospielen zeigt
sich, dass mit viel Kreativität doch einiges möglich ist. Ein gelungenes
Beispiel dafür ist der Papier Prototyp des Spiels *Runsii* [@ransii]. Es wurden
beispielsweise Fortschrittsbalken, Scrollbars und das Spiel selbst animiert
dargestellt.

\newpage

## Projekt GACT

GACT ist eine App für Smartphone und Smartwatch. Die App ermöglicht Gruppen,
gemeinsame Aktivitäten zu planen. Andere Gruppenmitglieder können sich darüber informieren,
wer an einer bestimmten Aktivität teilnimmt [@gact].

Abbildung {@fig:gact} zeigt Papier Prototypen für eine Smartwatch und ein Smartphone.
Interessant zu sehen ist hier, wie einfach es mit Papier ist, einen Prototypen für zwei
verschiedene Geräte zu erstellen. In Abbildung {@fig:gact2} sind die einzelnen
Ansichten des Papier Prototypen, die für das Smartphone erstellt wurden, zu
sehen. 

![Papier Prototypen des Projekts GACT. [@gact] ](docs/pics/gact.jpg) {#fig:gact}

![GACT Anwendung als Papier Prototyp für das Smartphone. [@gact] ](docs/pics/gact2.png)
{#fig:gact2}




## Miiverse für Wii U

Nintendo beauftragte ein externes Unternehmen, für die Spielekonsole Wii U eine
Anwendung zu entwickeln. Dabei handelt es sich um Miiverse, ein Netzwerk, um mit
anderen Spielern in Kontakt zu treten. Zu diesem Zeitpunkt war der Gamepad der
Wii U noch nicht fertiggestellt bzw. stand dem externen Unternehmen nicht zur
Verfügung. Um bei einer Präsentation für Nintendo trotzdem den Eindruck zu
vermitteln, wie das Design der Software zusammen mit dem Gamepad wirkt, wurde
ein Prototyp aus Papier erstellt, der in Abbildung {@fig:wii} zu sehen ist
[@wii].

![Papier Prototyp von Miiverse. [@wii] ](docs/pics/wii.jpg) {#fig:wii}

# Fazit

Das Paper Prototyping und die Durchführung von Usability-Tests anhand von
Paper Prototyping haben einige Stärken aufgezeigt. Nicht jede Situation
und Entwicklungsphase eignet sich für den Prototypen aus Papier. Doch
nicht immer muss sofort, vorallem in frühen Entwicklungsphasen, ein digitaler
Prototyp erstellt werden. Es lohnt sich,
das Paper Prototyping als möglichen Prototypen in Betracht zu ziehen.

Eine noch offene, interessante Frage wäre, wie weit verbreitet Paper Prototyping
in der Praxis eingesetzt wird. Dazu konnten leider keine eindeutigen
Statistiken oder Aussagen gefunden werden.

# Literaturverzeichnis
