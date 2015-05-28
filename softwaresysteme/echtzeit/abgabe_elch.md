---
documentclass: scrartcl
title: Softwaresysteme - Echtzeitsysteme
author: Christopher Pahl, \#944081
date: \today
---

# Definitionen und Grundbegriffe

`1.) Vergleichen Sie Polling und Interrupt als Verfahren zur Kopplung von realer
Welt und Rechnerfunktion. Welches Verfahren würde man bei
a) einer Temperatur-Überwachung einer Heizung
b) einem Füllstandssensor einer Abfüllanlage
empfehlen? Begründen Sie Ihre Empfehlung.`


Das permanente Abfragen eines Sensorwertes oder eine Variable nennt man Polling.
Für gewöhnlich erledigt man dies in einer `while`--Schleife, die nach einem
bestimmten Zeitintervall den Wert wieder abfrägt. Bei Interrupts hingegen wird
von außen ein Ereignis generiert, das in einer ISR asynchron behandelt wird. 
Generell sollte eine Interruptlösung Polling bevorzugt werden, da diese
ressourcensparender ist und nicht die Gefahr besteht ein Ereignis zu spät zu
erkennen.

Im konkreten Szenario:

a.) Da die Temperatur sich nur langsam im Sekunden bis Minutentakt ändert bietet
    sich hier Polling an. Die Anwendung von Interrupts gestaltet sich schwierig,
    da diese entweder bei jeder kleinsten Temperaturschwankung oder erst ab
    einem bestimmten Änderungsgrad ausgelöst werden würden. 

b.) Hier machen Interrupts mehr Sinn, da ein Interrupt getriggert werden kann
    sobald ein Fülllevel erreicht oder überschritten ist. Unter Umständen kann
    dieses Ereignis nur sehr selten eintreten was Polling mit einem kleinen
    Intervall sehr aufwendig machen würde.

`2.) Machen sie an geeigneten Beispielen den Unterschied zwischen "embedded
system" und "Echtzeit System" zu Standard-Rechnern klar.`

Echtzeitsysteme müssen ein klar definiertes Zeitverhalten lastunabhängig
garantieren. Embedded Systeme sind zwar auch oft zeitgleich echtzeitfähig, dies
ist aber nicht zwangsweise notwendig. Ein Beispiel wäre der Controller im Auto
der die Auslösung des Airbags steuert. Dieser ist sowohl ein eigenes
eingebettetes System, muss aber auch echtzeitfähig sein um den Airbag weder zu
früh noch zu spät auszulösen. In beiden Fällen ist direkter Hardwarezugriff
erwünscht und die Systeme sollten über lange Zeit sehr stabil laufen. 
Für letzteren Punkt sind auch spezielle Betriebssystem wie QNX empfehlenswert,
die möglichst wenig Funktionalität in den Kernel packen und den Rest in den
Userspace verlagern, wo ein fehlerhafter falls nötig neu gestartet werden kann.

Der Übergang zwischen Embedded System und einem Echtzeit System ist oft
fließend, aber prinzipiell können auch größere Rechner echtzeitfähig gemacht
werden. 

Standardrechner erzielen in den meisten Fällen den höchsten Durchsatz und sind
daher für Rechenintensive Aufgaben wie Rendering oder beispielsweise der
Wettervorhersage prädestinierend. Der höhere Durchsatz erklärt sich dadurch,
dass durch intelligentere Scheduler die darunterliegenden Ressourcen (wie die
CPU) besser ausgelastet werden können.

`3.) Welche Besonderheiten zeichnen ein Echtzeit-Rechner-System aus? Erläutern
Sie dabei die Begriffe "Rechtzeitigkeit", "Harte Echtzeit - Weiche Echtzeit"
genauer!`


Es zeichnet sich durch die Garantie aus, nach einer Anfrage in einer
definierten, vorher berechenbaren Zeit eine Antwort zu liefern.

Begriffe:

*Rechtzeitigkeit*: Die Zeit die die Beantwortung einer Anfrage braucht muss
*garantiert* und *vorher berechenbar* sein.

*Harte Echtzeit*: Eine definierte ,,Deadline'' darf nicht überschritten werden.
Obiges Airbag--Beispiel gilt auch hier: Sollte die Antwort, bzw. die Reaktion zu
spät erfolgen entstehen möglicherweise Kollateralschäden. 

*Weiche Echtzeit*: Die Deadline der harten Echtzeit kann überschritten werden
ohne Katastrophen zu verursachen. Allerdings ist die Antwort unter Umständen
dann nicht mehr zu gebrauchen oder ist weniger qualitativ. Als Beispiel kann man
hier einen Sensore in einer Industrieanlage nennen, der Produkte nach bestimmten
aussortiert. Kommt die Antwort zum ,,Sortiere aus!" zu spät ist das Produkt
möglicherweise bereits zu weit und muss manuell entsorgt werden.

# Betriebssystem

`1.) Welche Rolle spielt UNIX im Prozeßrechnerbereich?`

Die meisten gebräuchlichen UNIX Systeme sind nicht echtzeitfähig (Linux,
BSD--Derivate). Mit QNX gibt es allerdings ein kommerzielles Unix das selbst
harte Echtzeit beherrscht. Es wird wegen seiner hohen Ausfallsicherheit sogar in
Atomkraftwergen eingesetzt.

`2.) Welche Eigenschaften sind für ein Echtzeit-Betriebssystem wünschenswert?`


* *Multitasking:* Mehrere Prozess können gleichzeitig ausgeführt werden. Die
  Systemaufrufe sollten dazu reentrant sein um nötigenfalls neu ausgeführt
  werden zu können.
* *Echtzeit Scheduler/Dispatcher:* Ein Task sollte via Preemption unterbrochen
  werden können um höher priorisierten Aufgaben den Vortritt zu lassen.
* Echtzeit-Speicherverwaltung: Speicherzugriffe erfolgen in definierter Zeit,
  beispielsweise ist dazu nötigenfalls der Caching Mechanismus abschaltbar.
* Echtzeit-Dateisystem: Schreiben/Lesen von Daten erfolgt in definierter Zeit,
  beispielsweise wird hierbei kein Caching von Dateimetadaten und Dateien
  durchgeführt, wie es auf Desktop System (vernünftigerweise) üblich ist.
* IPC mit ISR Unterstütung: Unterstützung von Messagequeues um Daten aus ISR
  zurückzugeben.

``3.) Was fehlt bei Standard-Linux zur Echtzeitfähigkeit? Was ist überflüssig? ``

Linux bietet kein Scheduler (bzw. Dispatcher) der Prozesse zu einem definierten
Zeitpunkt wieder ausführt. Die Zeit nach der ein Prozess weiterarbeitet hängt
von vielen internen Faktoren ab. Zudem ist es nicht garantiert, dass das System
unter Last Ereignisse entgegen nehmen kann.

Um weiche Echtzeit zu ermöglichen ist es möglich einen Preemptive Kernel zu
nutzen, der es dem Scheduler ermöglicht einen Kontextwechsel auch dann
durchzuführen wenn ein Treiber ausgeführt wird falls ein höher priorisierter 
Task vorliegt. 

Überflüssig beim Linux Kernel ist beispielsweise die Multiuser--Fähigkeit,
bzw. alles was auf typischen Embeddedsystemen keine Anwendung findet, da dies
nur zusätzlicher Ballast darstellt und eventuell unnötige Kontextwechsel verursacht.

# Softwareentwicklung

`1.) Wieso ist Pearl eine gute Programmiersprache für Echstzeitsysteme?`

PEARL bietet als Echtzeithochsprache eine komfortable und sichere Entwicklung
von Multitasking- und Echtzeitanwendungen. Da sie vom Deutschen Institut für
Normung standardisiert wurde, eignet sie sich zudem für den Lehrbetrieb und hält
keine ,,Versions-Überaschungen'' bereit wie andere Sprachen.

Da die Sprache prozessorunabhängig und speziell für den Einsatz zur
Echtzeitprogrammierung konzipiert wurde stellt sie oft eine bessere Alternative
da als beispielsweise ,,Echtzeit-Java'' das eine Menge Insiderwissen benötigt
und noch zusätzlich viele Stolpersteine mitbringt und auch dann oft nur wenig
zufriedenstellend funktioniert.

`2.) Warum ist die Entwicklung von Echtzeitsoftware aufwendiger als die anderer
Software? Kann man Echtzeitsoftware nur mit Assembler realisieren?`

Herkömmliche Programme können auf bestimmte Ereignisse beliebig lange warten und
können für bestimmte Abschnitte prinzipiell genauso beliebig lange brauchen.

Zwar ist auch bei einem normalen Rechner die ,,Deadline'' erreicht wenn man er
nach einer eigentlich kleinen Berechnung eingefroren ist, doch diese Art von
,,Echtzeit'' wird bereits von den meisten Programmen automatisch garantiert.

Echtzeitsoftware hingegen darf nur eine bestimme Zeit auf ein Ergebnis warten
und im Fehlerfall selbst eine Fehlerbehandlung ausführen. Zudem müssen bestimmte
Berechnungen und Aufgaben in einer definierten Zeiten erledigt werden um auch
eine ausreichend kleine Antwortzeit bei hoher Last zu gewährleisten.

Dies erhöht den Testaufwand der Software enorm, zumal die Ausführung des
Programms abhängig von vielen Faktoren ist, die nicht alle in einer
Simulationsumgebung aufgefangen werden können. Die Zielplattform kann zudem noch
Differenzen zur Simulationsumgebung haben, was zu schwierig nachvollziehbaren
Fehlern führen kann.

Echtzeitsoftware muss nicht zwangsweise in Assembler geschrieben werden --- und
sollte des Aufwands wegen lieber in einer geeigneten Hochsprache verfasst
werden. Sprache wie PEARL oder C bieten sich hier an, da sie eine hohe
Hardwarenähe bieten und keine Hinderungsgründe wie Garbage--Collection haben.

`3.) Welche Vorteile kann eine gute Echtzeitsprache für einen Entwickler bieten?
(Was wünschen Sie sich?)` 

* Kein Garbage Collector (und damit keine unkalkulierbaren Unterbrechungen im
  Programmablauf).
* Kein eigener Userspace--Scheduler (wie bei Golang).
* Nach Möglichkeit direkter Hardwarezugriff.
* Komfortable ISR Benutzung.
* Hochsprache um Probleme aus der realen Welt gut abbilden zu können.
* Prozessorunabhänigige Entwicklung möglich (nicht wie Assembler).
