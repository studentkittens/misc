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
date: \today

---

\pagenumbering{arabic} 
\setcounter{page}{1}

# Vorwort

Diese Studienarbeit gibt eine Einführung in den GNOME Desktop und den dort
gängigen Usability Richtlinien. Die Richtlinien sollen an Beispielen aus dem
GNOME Desktop beleuchtet werden und die dahinter liegenden Ideen und Konzepte
dargestellt werden. Der zweite, größere Teil der Arbeit besteht darin eine vom
Autor geschriebene Anwendung auf diese Richtlinien hin zu überprüfen und die
dahinterliegenden Design--Entscheidungen aus Sicht eines Anwendungsentwickler
kritisch zu validieren.

Viele Bilder wurden direkt der Onlinepräsenz der *GNOME Human Interface
Guidelines* entnommen. Für diese, wurde aus Gründen der Übersichtlichkeit, auf
einen separaten Quellenlink verzichtet und die Quelle wurde nur mit 
``»Quelle: HIG«`` gekennzeichnet. Bilder ohne Quellenangabe stammen vom Autor selbst.

# Einleitung 

## Historisches zu GNOME

GNOME ist eine auf unixoiden Betriebssystemen weit verbreitete Desktopumgebung.
Aufgrund der Natur von Open--Source--Software haben sich über die letzten
15 Jahre mehrere größere Desktop--Oberflächen herausgebildet, GNOME ist neben
KDE eine der bekanntesten, funktionsreichsten und auch ältesten (erstes
offizielles Release im Jahr 1999). Aktuell ist der Desktop in der Version
``3.18`` verfügbar und wird von vielen Linux--Distributionen wie Fedora[^FEDORA] als
Standard--Desktop ausgeliefert. Direkt nach der Installation sieht der Desktop
meist ähnlich wie in Abbildung {@fig:gnome-screen} aus. Eine Erklärung der
Desktopfunktionsweise ist nicht Teil dieser Arbeit, zu diesem Thema gibt es
allerdings ausreichend Dokumentation[^YT].

[^YT]: Siehe dazu beispielsweise: \url{https://www.youtube.com/watch?v=xu0VSKvfNEI}
[^FEDORA]: Bekannte Linux Distribution für technich versierte Anwender:
\url{https://en.wikipedia.org/wiki/Fedora_Project}

Der gesamte Desktop samt allen Anwendungen ist dabei freie Software und unter
der ``GPL``[{@gpl}] lizenziert (beziehungsweise in Fall von Bibliotheken als ``LGPL``).
Technisch basieren dabei weite Teile des Desktops auf der Oberflächenbibliothek
``GTK+`` und der Utility--Bibliothek ``GLib``. Ursprünglich kommt ``GTK+``
dabei aus dem *GNU Image Manipulation Program* (kurz *GIMP*), was noch immer
eine der bekanntesten Anwendungen des GNOME--Desktops ist.

![Default Desktop mit offenen Einstellungen (Quelle: \url{https://gnome.org})](docs/pics/gnome-screen.png) {#fig:gnome-screen}

Finanziert wird das Projekt durch Spenden und der GNOME Foundation[^FOUND], einer
nicht--kommerziellen Vereinigung der Hauptentwickler und einiger Firmen wie
*RedHat*[^RHA], die die Entwicklung sponsern.

[^FOUND]: Mehr Informationen unter: \url{https://www.gnome.org/foundation/}

## Fokus von GNOME

Das Design eines gesamten Desktops ist verhältnismäßig schwierig.
Erschwert wird dies noch durch die Ziele auf die sich GNOME fokussiert
hat. Wikipedia[@wiki_gnome] listet lose die folgenden Ziele:

Der Desktop muss…

- …konsistent gestaltet und visuell ansprechend sein.
- …behindertengerecht nutzbar sein.
- …auch auf mobilen Touchdevices mit begrenzten Ressourcen funktionieren.
- …komplett internationalisiert sein, das heißt in möglichst vielen Sprachen vorliegen.
- …effizient sowohl für Gelegenheitsnutzer[^GEL], als auch für
  erfahrene Nutzer[^ERF] nutzbar sein.

Die oben stehenden Ziele werden durch die Arbeit vieler
Freiwilliger[@german2003gnome] relativ
strikt für ca. 100 Kernanwendungen im GNOME Desktop umgesetzt. Daneben gibt es
noch eine Vielzahl weiterer Anwendungen für speziellere Zwecke, welche diese
Ziele mehr oder weniger umsetzen. Dabei ist zu betonen, dass die meisten 
GNOME--Programme --- anders als bei beispielsweise KDE --- auch ohne des Rest des
GNOME--Desktops lauffähig sind.

Das komplette Projekt als ganzes hat zudem noch weitere Ziele:

- Halbjährliche Releases mit Support von den Entwicklern.
- In den Desktop integriertes und lokalisiertes Handbuch.
- Entfernung von störenden und ablenkenden Design Entscheidungen.

Besonders der letzte Punkt ist oft Quelle von Kritik gegenüber dem
GNOME--Desktop, da darunter auch des Öfteren für versierte Nutzer essentielle
Konfigurationseinstellungen fallen. Das Ziel hier ist es einerseits eine klare,
minimale Oberfläche zu haben und andererseits dadurch auch für
Gelegenheitsnutzern die Bedienung einfacher zu gestalten. Statt auf Kompromisse
einzugehen, entfernen die GNOME--Macher hier gemäß der Unix--Philosophie 
(*Do (just) one thing and do it well* [@raymond2003basics])
alle Features, die nicht direkt dem Zweck der Anwendung dienen. Die meisten
Einstellungen sind allerdings für versierte Anwender über die Kommandozeile
erreichbar.

[^RHA]: Mehr Informationen unter: \url{https://www.redhat.com/de}
[^GEL]: In diesem Fall überwiegend Maus und Touch--zentrierte Bedienung.
[^ERF]: In diesem Fall überwiegend Tastatur--zentrierte Bedienung.

# GNOME Human Interface Guidelines

Die GNOME Human Interface Guidelines versuchen die oben genannten Probleme durch
ein einheitliches Set von Richtlinien zu lösen, welches jede Kernanwendung des
GNOME--Desktops vollständig erfüllen muss. Anwendungen rund um den Desktop (und
auch externe Anwendungen) haben keine so strikten Anforderungen, eine zumindest
teilweise Einhaltung ist aber wünschenswert.

Die Human Interface Guidelines[{@hig}] sind in fünf Hauptkapitel gegliedert, die
im Folgenden vorgestellt werden. Der Guide ist online als HTML abrufbar
[^``HIG``]. Oft wird der Guide als *der* *``HIG``* abgekürzt, weswegen im
Folgenden hauptsächlich die Abkürzung zu lesen ist.

[^``HIG``]: siehe \url{https://developer.gnome.org/hig/stable/}

## Prinzipien (*Design principles*)

Die *Prinzipien* des ``HIG`` definieren allgemeine Grundgedanken.
Diese sind nicht konkreter Natur, sondern geben nur eine allgemeine Sammlung von
Regeln und Tipps ab. Dies wird an einigen Beispielen aus dem ``HIG`` deutlich:

### *Anticipate errors*

Es wird empfohlen Fehler vom Nutzer zu erwarten und diese nach Möglichkeit
abzufangen. Als konkrete Maßnahme kommt für dieses *Prinzip* eine *Undo*
Funktionalität in Frage, um den Nutzer die Möglichkeit zu geben auch destruktive
(wie das Löschen von Items aus einer Liste) Operationen rückgängig zu machen.

### *Prioritize content*

Wichtigen Fensterinhalten sollte aller zur Verfügung stehender Platz gegeben
werden. Lediglich wichtige und in zu einem bestimmten Zeitpunkt relevante
Steuerelemente sollten noch parallel zu sehen sein. Dies führt indirekt zu meist
sehr übersichtlich gestalteten Oberflächen.

### *Avoid interruptions*

Anwendungen die dem ``HIG`` folgen sollten möglichst Nutzer nicht durch ablenkende
Abfragen der Art *»Sind sie sicher?«* ablenken. Dies trifft insbesondere auf
modale Popup--Dialoge zu, die eine Benutzung des eigentlichen Programms
unmöglich machen solange sie aktiv sind. 

Stattdessen wird empfohlen die Anwendung allgemein so zu gestalten, dass
der Nutzer von den Aktionen der Anwendung nicht überrascht ist, was eine zusätzliche
Abfrage unnötig macht.

## Muster (*Patterns*)

Bei den sogenannten *Mustern* wird es bereits konkreter. An dieser Stelle gibt
der Guide dem Entwickler eine Auswahl oft genutzter Kombination von
Designelementen an die Hand. Es wird dabei zwischen vorgeschriebenen Mustern und 
situationsabhängig empfehlenswerten Mustern entschieden.

Ein vorgeschriebenes Muster ist beispielsweise die *Headerbar* (siehe Abbildung
{@fig:headerbar}). Diese bietet Platz für viele generische *Elemente*, wie dem
*Suchmodus*, dem *Ansichtenswitcher* und dem *Menübutton*.

![Das *Headerbar* Muster (Quelle: ``HIG``)](docs/pics/headerbar.png) {#fig:headerbar}

Bei vielen Anwendungen hingegen ist die *Actionbar* eine gute, aber optionale,
Möglichkeit eine Liste von Aktionen für eine Auswahl anzuzeigen. Dabei taucht
nach der Auswahl von Text, Listenelementen oder Ähnlichem am unteren Rand eine
Bar mit unterschiedlichen Schaltflächen auf, die jeweils einer Aktion zugeordnet
sind. Einzelne dieser Aktionen können dabei \textcolor{blue}{blau}
(die empfohlene Aktion) oder \textcolor{red}{rot} (gefährliche, destruktive Operation)
hervorgehoben sein. Dazu mehr im nächsten Kapitel.

![Das *Actionbar* Muster (Quelle: ``HIG``)](docs/pics/actionbar.png)

Im ``HIG``[^PATT] findet sich eine weitaus größere Auswahl an weiteren Mustern.
Zu jedem Muster wird ein Beispielszenario und der empfohlene Einsatzzweck
erläutert.

[^PATT]: siehe \url{https://developer.gnome.org/hig/stable/patterns.html.de}

## Elemente (*Elements*)

Für Anwendungsentwickler am interessantesten sind die konkreten *Elemente* die
der ``HIG`` anbietet. Dabei handelt es sich um individuelle, atomare Widgets
oder Widgetgruppen, die ein gemeinsames Ziel erfüllen. Meist handelt es sich
dabei um alltägliche Bedienelemente wie Menüs, Fortschrittsanzeigen und
spezialisierte Schaltflächen. Von den *Patterns* unterscheiden sie sich dabei
dadurch, dass sie weniger allgemein sind und meist direkt einem Widget aus der 
``GTK+``--Bibliothek entsprechen.

![Willkürliche Auswahl verschiedener Elemente (Quelle: ``HIG``)](docs/pics/elements.png) {#fig:elements}

Ein häufig genutztes *Element* ist beispielsweise der *Suggested Action Button*.
Dabei handelt es sich um eine normale Schaltfläche, die aber
\textcolor{blue}{blau} hinterlegt ist. Er wird per Konvention für alle
Aktionen eingesetzt, von denen man erwartet, dass der Nutzer sie am ehesten
ausführen wird. Beispielsweise wäre eine ``Einstellungs``--Schaltfläche nicht
\textcolor{blue}{blau} hinterlegt, ein ``Installieren`` oder
``Weiter``--Knopf hingegen schon.

Im ``HIG``[^ELEM] findet sich eine noch weitaus größere Auswahl konkreter
Elemente.

[^ELEM]: siehe \url{https://developer.gnome.org/hig/stable/ui-elements.html.de}

## Anleitungen (*Guidelines*)

Die *Guidelines* sind wieder etwas weniger konkret. Statt ausschließlich das
Aussehen der Anwendung zu beschreiben wird hier beschrieben wie die Anwendung
sich verhalten soll oder auf den Nutzer wirken soll. 
Darunter fallen auch Tipps für gute Anwendungs--Namen und Icons.

Beispielsweise finden sich dort auch Tipps zu folgenden Themen:

### Beispiel: *Typografie*

Um visuell angenehme Anwendungen zu entwickeln sollte großen Wert auf das
Schriftbild gelegt werden. Beispielsweise sollten Schlüssel--Wert Paare wie in
Abbildung {@fig:align} der Lesbarkeit halber mittig zentriert werden.

![**Oben:** Falsche Ausrichtung; **Unten:** Korrekt zentriert. (Quelle: ``HIG``)](docs/pics/align.png) {#fig:align}

Auch Kleinigkeiten sollten dabei beachtet werden. So sollte eine
Bildschirmauflösung mit dem korrekten Unicode--Zeichen (``U+d7, multiplication
sign``) angezeigt werden, statt mit einem einfachen ``»x«``: 1024×768.

### Beispiel: *Touch Gesten*

Der GNOME Desktop soll reibungslos auf mobilen Geräten benutzbar sein.
Daher sollten Anwendungsentwickler auf Touch--unfreundliche Eingaben wie
Doppelklicks verzichten und sicher stellen, dass typische Gesten wie das
»Zusammenziehen« mit den Fingern tatsächlich in ein Zoomen umgesetzt wird.

## Ressourcen (*Resources*)

Neben den tatsächlichen Richtlinien finden sich im GNOME Umfeld noch einige
allgemein nützliche Ressourcen. Darunter fällt beispielsweise das 
*Tango Icon Set* (siehe {@fig:tango-icons}), der freie Cantarell--Font (siehe
{@fig:cantarell}) sowie das Tango--Colorscheme  (siehe {@fig:tango}).

![Der Cantarell Font. (Quelle: \url{http://fontsov.com/data/font_face/Cantarell-Bold.png})](docs/pics/cantarell.png) {#fig:tango-icons}

![Das Tango Icon Scheme. (Quelle: \url{http://tango.freedesktop.org/Tango_Icon_Library})](docs/pics/tango-icons.png) {#fig:cantarell}

# Shredder --- Eine Beispielanwendung

Der ``HIG`` scheint für Außenstehende zunächst nur eine sehr theoretische Richtlinie
ohne praktische Relevanz für Anwendungsentwickler zu sein.
Um die tatsächliche Anwendbarkeit begreifbarer zu machen wird in diesem Kapitel
eine Beispielanwendung durchleuchtet, die den ``HIG`` größtenteils
implementiert.

## Entstehung von *Shredder*

![Das Logo von *Shredder*.](docs/pics/shredder_logo.png)

*Shredder* ist eine vom Autor im Jahr 2015 geschrieben Anwendung.
Sie bietet unter unixoiden Betriebssystemen die Möglichkeit doppelte Dateien und
Ordner zu finden und diese bei Bedarf auch zu löschen. *Shredder* ist in Python
geschrieben und umfasst ca. 4000 Zeilen Quellcode. Die eigentliche Arbeit des
Duplikatesuchens erledigt dabei das Kommandozeilenprogramm ``rmlint`` [{@hig}] im
Hintergrund.

``rmlint`` stammt ebenfalls vom Autor dieses Dokuments und umfasst wegen des
großen Feature--Umfangs ca. 9000 Zeilen C--Code, sowie eine Python--Testsuite,
die wiederum 3000 Zeilen umfasst. ``rmlint`` selbst löscht keine Duplikate,
schreibt aber nach erfolgreichen Durchlauf ein ``.sh``--Shellskript in eine Datei.
Diese kann dann vom Nutzer ausgeführt werden, um alle gefundenen Duplikate zu
löschen. Da *Shredder* ein grafisches Frontend zu ``rmlint`` ist, setzt es
diesem Prozess ähnlich um, bietet dabei aber zusätzlich Interaktion und Visualisierung.

Sowohl *Shredder* als auch ``rmlint`` können unter
\url{http://rmlint.rtfd.org}[@rmlint]
heruntergeladen werden. Unter [{@shredder_video}] findet sich zudem ein Video,
welches die Benutzung von *Shredder* erklärt. 

## Programmstruktur von *Shredder*

![Die Hauptansicht von *Shredder*.](docs/pics/shredder_screen.png) {#fig:screen}

*Shredder* wurde größtenteils nach den Prinzipien des ``HIG`` gestaltet.
Die Bereiche in denen das Design vom Guide abweicht, werden 
weiter unten beleuchtet. Das ursprüngliche Design ist stark von dem bei Gnome
mitgelieferten Programm ``baobab`` [^BAO] inspiriert, welches dazu dient die
Größenaufteilung in einem Verzeichnisbaum zu visualisieren.

[^BAO]: \url{https://de.wikipedia.org/wiki/Baobab_(Software)}

Prinzipiell ist die Anwendung in unterschiedliche Ansichten aufgeteilt, die den
Nutzer, ähnlich wie ein *Installations--Wizard*, durch den Prozess des
Duplikate--Entfernens führt. Dabei kann der Nutzer nach Belieben zwischen den
einzelnen Schritten wechseln und zwischen den Ansichten hin- und her springen.

Zur Navigation dient dabei die *Headerbar* (siehe Abbildung {@fig:screen}).
Bei *Shredder* finden sich in dieser links zwei Schaltflächen, um die Ansichten
der Reihe nach durchzuschalten. Die Schaltflächen sind dabei in einer Box
zusammengeschweißt. Der ``HIG`` empfiehlt dieses *Element* für Schaltflächen die
eine gegensätzliche Wirkung haben. 

Rechts findet man eine Schaltfläche, um *Shredder* in den Suchmodus zu schalten
(für mobile Anwender eine Alternative zu ``STRG-F``). Weiter rechts findet sich
ein Menüknopf unter dem die Einstellungen und der About--Dialog erreichbar ist.

Im Folgenden werden die einzelnen Ansichten nur grob besprochen. Eine Erklärung
sämtlicher Details würde den Umfang dieser Arbeit sprengen.

### ``Locations`` Ansicht

![Die ``Locations``-Ansicht von *Shredder* mit zwei selektierten Orten](docs/pics/gui_locations.png) {#fig:locations}

Nach dem Start wird zuerst die sogenannte *Locations--Ansicht* präsentiert (siehe
{@fig:locations}). Diese zeigt eine Liste von möglichen Orten, die der Nutzer
durchsuchen möchte. Standardmäßig umfasst dies seinen ``/home``--Ordner, das
``/var``--Verzeichnis[^VAR] und alle zuletzt unter GNOME genutzten Verzeichnisse. 
Mit der ``Add-Location``--Schaltfläche kann er auch eigene Orte auswählen.

Der Nutzer kann dabei mit der Maus einzelne Ordner auswählen, die dann
\textcolor{blue}{blau} hinterlegt werden. Manchmal ist es nützlich mehrere
Ordner auszuwählen (beispielsweise ``music`` und ``music-copy``). Dabei möchte
man dann oft nur die Duplikate in einem der beiden Ordner löschen. Dies kann man
erreichen, indem man den *Original*--Ordner mittels der Checkbox auf der rechten
Seite als solchen markiert. Im Beispiel würde der Nutzer beispielsweise
``music`` als Original--Ordner kennzeichnen. Ist die selbe Datei in ``music``
und ``music-copy`` vorhanden, so wird diese immer nur aus ``music-copy``
gelöscht. Original--Ordner werden visuell mit einem Karo--Hintergrund
gekennzeichnet.

Wurde mindestens ein Ordner ausgewählt wird am unteren Rand eine *Actionbar*
angezeigt mit welcher der Nutzer den Scanvorgang starten kann. Da dies der
wahrscheinlichste nächste Schritt des Nutzers ist, wird die Schaltfläche ``Scan
folders`` als *Suggested Action* in \textcolor{blue}{blau} hervorgehoben.

[^VAR]: Hier werden unter Unix traditionell logs und caches abgespeichert.

### ``Runner`` Ansicht 

![Die ``Runner``-Ansicht von *Shredder* (Scan von ``/var``)](docs/pics/gui_runner.png) {#fig:runner}

In der ``Runner``--Ansicht werden in Echtzeit alle gefundenen Duplikate
angezeigt. Die Ansicht ist dabei zweigeteilt: Links findet sich eine
Baumansicht, welche die Pfade zu den Duplikaten abbildet. Neben den einzelnen
Pfaden wird noch die Größe der jeweiligen Datei oder des Ordners angezeigt,
sowie der Zeitpunkt der letzten Änderung und die Anzahl der doppelten Dateien
(bei Ordnern die Anzahl der Dupletten darin). Vor dem eigentlichen Pfad wird
zudem ein \textcolor{green}{\cmark} oder ein \textcolor{red}{\xmark} angezeigt. Dieses gibt
Auskunft darüber, ob die Datei im nächsten Schritt gelöscht wird. Durch ein
Rechtsklickmenü kann der Nutzer diesen Zustand ändern. *Shredder* verhindert
dabei gemäß dem oben erwähnten Prinzip *»Anticipate errors«* allerdings, dass sämtliche Duplikate
samt den Original mit einem \textcolor{red}{\xmark} markiert werden.

Auf der rechten Seite wird ein Kreisdiagramm gezeichnet, welches dem Nutzer eine
Vorstellung gibt, wo sich die meisten Duplikate finden. Das Diagramm ist 
schichtenförmig aufgebaut. Auf der innersten Ebene findet sich dabei als voller
Kreis der gemeinsame Wurzelknoten aller durchsuchten Ordner. Die darauf
folgenden Ebenen sind dann jeweils die Unterordner bzw. Dateien der
Vorgängerebene. Dabei wird jedem Unterordner je nach Menge und Größe von
Duplikaten ein unterschiedlich breites Kreissegment zugeordnet.
Der Übersichtlichkeit halber werden sehr kleine Segmente von der Darstellung
ausgenommen, wodurch Lücken entstehen.

Der Nutzer kann durch das Diagramm navigieren indem er die Maus über die
einzelne Segmente bewegt. Dabei wird der Name der Ordner auf derselben Ebene als
Tooltip eingeblendet (siehe auch [@shredder_video]). Klickt er auf ein Segment
wird dies als neuer Wurzelknoten gesetzt. Dadurch können Teilbäume der
Hierarchie gesondert betrachtet werden.

Hat der Nutzer die dargebotene Sicht validiert, kann er mittels der ``Render
Script``--Schaltfläche ein Shellskript generieren. Dabei kann er durch die
Dropdown--Liste rechts der Schaltfläche entweder alle gefundenen Pfade in das Skript
aufnehmen, oder alternativ nur alle selektierten oder auch nur alle momentan
sichtbaren. Sichtbar ist ein Pfad wenn er durch eine Suchanfrage nicht gefiltert
wurde (``STRG-F``). Standardmäßig ist die Dropdown--Liste auf *All*
voreingestellt.

### ``Editor`` Ansicht

![Die ``Editor``--Ansicht von *Shredder* (kein ``dry-run``)](docs/pics/gui_editor.png) {#fig:editor}

In der *Editor*--Ansicht wird das von *Shredder* generierte Shellskript
mit Syntaxhighlighting angezeigt. Der Nutzer kann dieses noch ein letztes Mal
validieren. Erfahrene Nutzer können auch das Skript editieren.

Diese Vorgehensweise mag erst einmal seltsam erscheinen, so soll aber dem Nutzer die Angst
vor dem ,,gefährlichen“ Vorgang des Duplikate--Löschens genommen werden.
Im Zweifelsfall kann er mit etwas Recherche nachvollziehen was die Anwendung mit
den gefundenen Dateien tut. Uninteressierte Nutzer können hingegen gleich
fortfahren, da es sich dabei um keinen notwendigen Schritt handelt.

Das Skript kann durch die ``»Run Script«``--Schaltfläche ausgeführt werden. Dieser ist
standardmäßig auf einen *Trockenlauf* (``»dry run«``) eingestellt. Klickt man in
diesem Zustand auf die ``»Run Script«``--Schaltfläche, so wird das Skript bis auf die
tatsächlichen Lösch-Kommandos ausgeführt. Wenn der Nutzer *Shredder* ausreichend
vertraut kann er zum tatsächlichen Löschen übergehen, indem er den ``»dry
run«``--Teil der Schaltfläche anklicken. Anschließend färbt sich die gesamte
Schaltfläche rot und das Warnungszeichen darüber verändert sich zu einem
Totenkopf um den Nutzer darauf aufmerksam zu machen, dass er jetzt destruktive Operationen
auslöst. Dies entspricht dem ``HIG``--Prinzip *»Use emotion and humor
(sparingly)«*.

### ``Settings`` Ansicht

![Die ``Settings``-Ansicht von *Shredder*.](docs/pics/gui_settings.png) {#fig:settings}

Die Settings Ansicht findet sich *links* von der zu Programmstart gezeigten 
*Locations*--Ansicht. Sie ist dabei entweder über die Pfeile oben in der
Headerbar erreichbar, oder über das Menü rechts in der Headerbar.

In der eigentlichen Ansicht finden sich Gruppen von Schlüssel--Wert Paaren.
Jedem Schlüssel ist dabei eine deskriptive Beschreibung und ein Widget auf der
rechten Seite zugeordnet. Mit letzteren kann der Wert verändert werden (siehe auch
Abbildung {@fig:settings}).

Wird einer der Werte geändert, taucht in der Headerbar ein ``Apply``- und eine
``Reset``--Schaltfläche auf. Damit die Änderungen tatsächlich übernommen werden,
muss dieser betätigt werden.

## Anwendungsbeispiele des ``HIG``

Oben wurden bereits einige Elemente genannt, die vom ``HIG`` übernommen worden sind.
Im Folgenden werden noch einige allgemeine Grundgedanken genannt, die bei der
Implementierung eine Rolle gespielt haben.

### Prinzip: *Durchsuchbarkeit*

Der ``HIG`` empfiehlt durch das Prinzip *»Provide quick and effective search«*
die Anwendung zu jeder Zeit durchsuchbar zu machen, um den Nutzer die
Möglichkeit zu geben nur die Teile der Anwendung anzuzeigen, die ihn
interessieren.

Jede der oben genannte Ansichten kann vom Nutzer durchsucht werden, indem er
``STRG-F`` drückt. Die Funktion der Suche unterscheidet sich je nach Ansicht:

- ``Settings``: Ein Konfigurationswert wird nur dann angezeigt, wenn in seinem
  Namen oder seiner Beschreibung ein Teil der Suchanfrage enthält.
- ``Locations``: Ein Ordner wird nur dann angezeigt wenn ein Teil seines Pfades
  die Suchanfrage enthält.
- ``Runner``: Hier filtert die Suche die angezeigten Duplikate. Neben einfachen
  Suchanfragen, die ähnlich wie bei *Locations* nach Pfadkomponenten filtern,
  kann dem Suchbegriff ein Präfix wie ``size:`` mitgegeben werden, um
  (beispielsweise) nach der Größe zu filtern. Der Suchbegriff ``»size:1M-4M«``
  würde dabei nur alle Duplikate mit einer Größe von ein bis vier Megabyte
  anzeigen. Weitere Präfixe sind ``mtime:`` für den letzten Änderungszeitpunkt und
  ``count:``, was nach Anzahl der Zwillingsdateien filtert.
- ``Editor``: Das ``.sh``--Dokument ist voll durchsuchbar. Es werden dabei pro
  Zeile alle Treffer angezeigt. Der Nutzer kann sich dabei mit dem Standard
  ``GTK+``--Shortcut ``STRG-G`` durch die Treffer hangeln.

### Prinzip: *Keine Unterbrechungen*

Auch bei Fehlern wird der Nutzer nicht durch Popup--Dialoge gestört. Tritt
beispielsweise ein Fehler beim Einlesen der Duplikate auf --- beispielweise beim
Einlesen eines Netzwerkmounts, welches plötzlich verschwindet --- So wird dieser
in einer *In-app Notification*[^INAP] unterhalb der *Headerbar* angezeigt. Ist
der Fehler nicht fataler (aber erwähnenswerter) Natur kann der Nutzer diesen zur
Kenntnis nehmen und mit seiner Arbeit fortfahren.

[^INAP]: siehe \url{https://developer.gnome.org/hig/stable/in-app-notifications.html.de}

### Prinzip: *Keine stockende Oberfläche*

Die Oberfläche sollte zu jedem Zeitpunkt bedienbar bleiben. Insbesondere sollten
blockierende Operationen (wie das Suchen von Duplikaten) keinesfalls die
Anwendung stocken lassen. Der Anwender könnte dabei denken, dass die Anwendung
abgestürzt seie und deshalb beunruhigt die Aktion abbricht. 

Aus technischer Sicht muss daher Sorge getragen werden, dass ``GTK+`` auch
während blockierenden Operationen kurz Zeit bekommt die Oberfläche neu zu
zeichnen und Eingaben entgegennehmen.

## Abweichungen vom ``HIG``

Teilweise weicht *Shredder* mal mehr, mal weniger vom ``HIG`` ab.
In den meisten Fällen liegt das allerdings an noch nicht implementierten
Features.

### Detaillierte Konfiguration

Ein Prinzip des ``HIG`` lautet *»Use configuration options sparingly«*.
Dieses wird von *Shredder* nicht direkt erfüllt. Stattdessen bietet *Shredder* dem Nutzer
mittels der *Settings--Ansicht* eine große Auswahl von Stellschrauben.
Nach Meinung des Autors ist dies allerdings nötig, da das Finden von Duplikaten
keine leicht verallgemeinerbare Aufgabe ist. Der ,,Standardfall“ ist aber auch ohne
zusätzliche Konfiguration durchführbar.

Oben genanntes Prinzip ist nicht unumstritten. Oftmals wird die mangelnde
Konfigurierbarkeit von GNOME--Anwendungen kritisiert. Viele Konfigurationswerte
sind beispielsweise nur über die Kommandozeile erreichbar. *Shredder* geht hier
einen Mittelweg: Es bietet dem Nutzer mehr Stellschrauben, *,,versteckt“* diese aber
in einer gesonderten Ansicht. Diese Ansicht muss dabei als einziges beim
Duplikatefinden nicht durchlaufen werden.

Verbesserungswürdig hingegen wäre die Reihenfolge der Konfigurationswerte. Zwar sind
diese bereits nach Thema gruppiert, allerdings könnte man diese auch noch nach
Wichtigkeit sortieren. 

### Handbuch und Internationalisierung

Aufgrund von Zeitmangel des Autors enthält *Shredder* leider noch keine
eingebautes Handbuch, auch wenn dieses vom ``HIG`` empfohlen wird.
Auch ist das Programm noch nicht in anderen Sprachen als Englisch verfügbar, obwohl das
dahinter stehende Programm ``rmlint`` bereits in mehreren Sprachen vorliegt.

### Weitere kleinere Abweichungen

Es folgen der Vollständigkeit halber einige Details in denen *Shredder* noch vom ``HIG`` abweicht. 

#### Mobile Bedienbarkeit

Zwar ist die Zahl der Nutzer auf mobilen Geräten vermutlich eher gering, doch um für die
Zukunft gewappnet zu sein, sollte *Shredder* auch mittels Touchgesten
bedienbar sein. Dies funktioniert momentan für einfache Anwendungsfälle,
allerdings nicht für komplexere Anwendungen, die beispielsweise das
Rechtsklickmenü in der *Runner*--Ansicht benötigen. Der ``HIG`` erwähnt dabei
die mobile Bedienbarkeit unter den *Guidelines* [{@mobile}].


#### Anwendungsicon

Das Logo von *Shredder* hält sich nicht strikt an die Vorgaben des ``HIG``,
da das Logo bereits vor der Umsetzung von *Shredder* entstand. 
Insbesondere präferiert der ``HIG`` eckige Icons, die die Tango Farbpalette
benutzen (siehe Abbildung {@fig:tango})

![Das Tango Colorscheme. (\url{http://tango.freedesktop.org/Tango_Icon_Theme_Guidelines})](docs/pics/tango.png) {#fig:tango}

#### Unintuitive Suchsyntax

Es ist ohne Lesen des Manuals nicht ersichtlich, dass der Nutzer in der
*Runner*--Ansicht Suchanfragen wie ``size:4M`` abgeben kann.
Eine mögliche Lösung wäre eine Dropdown--Liste wie in Abbildung {@fig:dropdown}.
Diese würde alle möglichen Präfixe wie ``size``, ``mtime`` und ``count``
anbieten. Beim Klick auf einen Listenpunkt würde dann in das Suchfeld ein
hervorgehobenes Textsnippet wie ``size:low-high`` eingefügt werden. Dieses kann der Nutzer
dann editieren. Zudem werden momentan Syntaxfehler in der Suchsyntax nicht an den
Nutzer weitergegeben. Eine mögliche Lösung wäre den falschen Bereich
\textcolor{red}{rot} hervorzuheben.

![Eine Single-Selection Dropdown-Liste (Quelle: ``HIG``)](docs/pics/dropdown.png) {#fig:dropdown}


# Fazit

Der Gnome ``HIG`` ist nur ein Ratgeber unter vielen. Viele andere Anleitungen
beziehen sich dabei meist auf Webanwendungen und nicht auf
Desktopanwendungen. Für viele Entwickler die keinen Design--Hintergrund haben
bietet der ``HIG`` daher eine detaillierte Hilfe, um schnell und einfach gute
Ergebnisse zu erzielen.

Im Gegensatz zu anderen Guides hat sich der ``HIG`` in der Praxis bewährt und 
weit über 100 Programme befolgen ihn mit unterschiedlicher Detailtreue.

Auch wenn man keine GNOME Anwendung entwickelt, kann der ``HIG`` nützlich sein, da
er Patterns für oft genutzte Designfragen bereithält. Auch die Icons- und Fonts-
Kategorie der Guidelines sind für externe Projekte nützlich. Der ``HIG`` ist
auch dann nützlich wenn man nicht die technische Grundbasis und Bibliotheken von
GNOME nutzt, da er allgemein genug geschrieben ist.
Wenn man ein anderes Toolkit als ``GTK+`` nutzt ist das Nachbauen der einzelnen
Widgets eventuell schwieriger, aber die dahinter liegenden Paradigmen sind
übertragbar.

*Shredder* entspricht den meisten Prinzipien des ``HIG``, auch wenn nicht alle
erwähnt worden sind. In der Zukunft sollten die abweichenden Punkten nach
Möglichkeit noch angeglichen werden.

\newpage

# Literaturverzeichnis
