---
documentclass: scrartcl
title: Zusammenfassung Softwaresysteme -- Compilerbau
author: Christopher Pahl - #944081
date: \today
---

# Einleitung

## Unix toolchain und Compiler

Zu Beginn des ersten Vorlesungsblock wurde eine kurze Einführung zum Thema
Kompilieren und Linken gegeben.  Der Dozent nutzte dieses Beispiel ebenfalls um
den Begriff des Compilers zu erklären und mit verwandten Begriffen wie den des
Interpreters zu verbinden.

Allgemein gesagt ist ein Compiler ein Übersetzer der eine Eingabesprache in eine
Ausgabesprache übersetzt.  Im speziellen sind damit oft Compiler(sammlungen) wie
``gcc`` oder ``clang`` die Programmiersprachen wie ``C`` in Maschinencode
übertragen. Interpreter übersetzen die Eingabesprache ,,live'' und führen sie
gleich aus. Tritt ein Fehler auf, so stoppt auch die Übersetzung.

Neben der Ein- und Ausgabesprache hängt das Resultat des Compilers meist auch
von der Plattform ab auf dem er läuft. Beispielsweise produziert ``gcc`` auf der
``x86`` Architektur normal auch entsprechende Binärdateien, kann aber auch zur
*Crosskompilierung* verwendet werden um Binärdateien für ARM zu erzeugen.
Im besten Falle sollte der Compiler natürlich auch passende Fehlermeldungen produzieren. 

Wichigstes Ziel des Dozenten war stets den Studierenden ein Gefühl dafür zu
vermitteln wann ein Compiler in der Softwareentwicklung eingesetzt werden
könnte. Besonders Situationen wo Parser von Hand gebaut worden sind sollen so
vermieden werden.

Zudem fanden im Verlauf weitere Werkzeuge aus der Unix toolbox wie `sed`
(zeilenorientieriter kommandozeileneditor, meist zum ersetzen genutzt), `gdb `
(mächtiger debugger für C und andere Sprachen) `make` (minimales build system)
und `strace` (verfolgung von system calls eines Prozesses)  kurze Erwähnung.
Besonderen Stellenwert bekamen die eigentlichen Werkzeuge zum Compilerbau:
``lex/flex`` und ``yacc/bison``.

# Sprachtheorie

Eine Sprache besteht aus: Wörtern, Grammatik (Syntax), Semantik und bei realen
Sprachen noch aus der Pragmatik (Subjektive Kontextabhängigkeit). Letzeres
sollte bei parsbaren Sprachen aus dem naheliegenden Grund der Eindeutigkeit
nicht gegeben sein. In der Informatik daher nur *formale* Sprachen.

## Chomsky Hierarchie

Einteilung der formalen Sprachen nach ihrer Mächtigkeit in die Chomsky
Hierarchie.

* CH0: Keinerlei Einschränkungen was die Sprache ausdrücken kann.
* CH1: Rechte Seite darf nicht kürzer sein als linke.
* CH2:
* CH3:

![Quelle: http://www.hsg-kl.de/faecher/inf/material/sprachen/chomsky/index.php](chomsky.png) 

CH1 - CH3 sind ein Subset von CH0 (mächtigste Sprache).
CH3 hingegen ist die am einfachsten zu parsende Sprache aber limitierteste
Sprache. Reguläre Ausdrücke entsprechen zum Beispiel CH3. Es gibt allerdings
keinen regulären Ausdruck der einen Ausdruck auf valide Klammerung überprüfen
kann. Die meisten behandelten Sprachen fallen in die ``CH2`` Kategorie.

- NEA und DEA: (nicht)deterministischer Zustandsautomat.
  Jeder NEA kann in ein DEA überführt werden.
  Jeder DEA kann durch eine CH3 Sprache dargestellt werden.
  Jeder CH3 Sprache kann durch einen regulären Ausdruck darstellen.
- C: Automaten mit Tabelle und switch/case oder goto implementieren.

## BNF

Computerlesbare Variante der Chomsky-Grammatiken. 
Besonders Zeichen wie $\varepsilon$ (Leeres Token) oder  $\Rightarrow$
und $\Leftarrow$ sind nur schwer zu setzen. 

Meist gebräuchlich als erweiterte Backusnaurform (EBNF).
Beispielhafte EBNF für ein if mit optionalem else und Endmarker.

    if_statement ::=
      "if" cond "then"
         more_stmts
      ["else" 
         more_stmts]
      "end if;"

## ``Dangling Else`` Problem

Betrachte verschachteln if-Ausdruck ``if c1 then if c2 then s1 else s2`` mit
Grammatik:

S -> "if" C "then" S;
S -> "if" C "then" S "else" S

Parser kann nicht entscheiden zu welchem ``if`` s2 gehört. Beides valide:

* erstes if:  ``if c1 then (if c2 then s1) else s2``
* zweites if: ``if c1 then (if c2 then s1 else s2)``

Lösungen: 

- Änderung der Assoziativität für ``if`` mit ``%right`` oder ``%left``.
- Änderung der Operatorpräzendez mit ``%pred``.

# Compiler

Bei größeren Compilern besteht der 

- Quellcode -> [Analyse] -> AST, Symboltabelle (Zwischendarstellung) -> Synthese zu
  Zielplattform.
- Optimierung durch Modifizierung des AST möglich.
- Bei C noch vorgelagerte Schritte wie Präprozessor ( echo "#include <stdlib.h>" | gcc -E - )
  und nachgelagerte Schritte (linking)
- Analyse besteht aus lexikalischer, syntaktischer (Scanner, Parser) und semantischer Analyse
  (Typprüfung etc.)
- Beispiel anhand clang/gcc
- T-Diagramm kurz erklären.
- Bootstrapping (T-Diagramme?)
- Vorteil und Nachteil von Interpretern
- Gute Compiler machen vor allem gute Fehlermeldungen aus.

Die syntaktische Analyse kann durch endliche Automaten automatisiert werden,
hier im speziellen Kellerautomaten.  Kellerautomaten bestehen aus einem Band,
einem Eingabealphabet, einem Ausgabealphabet, einem Lesekopf der auf dem Band
steht und einem Stack.  Zudem gibt es eine Tabelle mit Übergangsfunktionen die
das Verhalten des Lesekopfes basierend auf der Eingabe und dem Stack definiert.
    

![Quelle: http://www2.math.uni-wuppertal.de/~axel/skripte/compiler/c1_06.html](tdia.png) 

## Scanner

- Lexem - Zeichen die zu einem Token geführt haben.

Ein Scanner liefert aus einem Eingabezeichenstrom einen Tokenstrom. 
Jedes Token ist eine syntakisch atomare Einheit und besteht dabei aus dem Lexem, dem Typ des Tokens und eventuell noch
aus ein bis mehreren Werten (beispielsweise bereits geparse Integer).

- lex 
- .i -> lex -> .yy.c -> gcc -> .o
- Kompatible weiterentwicklung aus gnu umfeld: flex (f = fast)

- Definierung einzelner Tokens mittels regulärer Ausdrücke.
- C Variablen als reguläres (Token)Muster:  

Aufgrund der weiten Verbreitung wird im Folgenden auf ``flex`` eingegangen.

Sektionen eines flex files:

1. C-Code innerhalb von ``%{`` ``}%``. Hier werden meist Enumerationswerte für
   Token definiert, Header inkludiert und allgemeine Hilfsfunktionen und globale
   Variablen definiert. Der Code wird unverändert in die generierte Ausgabedatei
   übernommen. Diese Sektion ist optional.
2. Steueranweisungen für flex: Hier werden mittels spezieller Direktiven
   bestimmte Optionen eingestellt, Zustände definiert (``%s`` und ``%x``) sowie 
   oft genutzten Muster ein alternativer Name gegeben. Diese Sektion ist nicht
   optional, darf aber leer sein.
3. Durch ein ``%%`` abgetrennt folgt der eigentliche Matching--Teil in dem 
   Muster, welche als regulärer Ausdruck gegeben sind, mit Aktionen verknüpft
   werden können. Die Aktionen sind dabei wiederum C-Code der in geschweiften
   Klammern dahinter geschrieben wird und im einfachten Falle den Tokentype
   zurückliefert oder auch komplexere Parsingaufgaben übernimmt.
   Ein simples Beispiel wäre die Definiton eines C--Variablennamen:
   ``[a-Z_][a-Z0-9_]* { return VARIABLE; }``.
4. Durch ein weiteres ``%%`` getrennt folgt noch ein weiterer C-Codeblock.
   Dieser wird meist dafür genutzt um eine ``main`` Funktion zu definieren die
   schließlich in irgendeiner Form den Scanvorgang mittels mehrfachen Aufruf
   ``yylex()`` von startet. Diese Funktion parst dabei jeweils ein Token und
   gibt den Returnwert der entsprechende Aktion zurück. 


Hat man die ``flex`` Definition als ``.i`` Datei gespeichert, kann man sie
mittels folgenden Befehl in ein ausführbares Programm übersetzen:

	$ flex 6.i gcc lex.yy.c -W -g -lfl -o 6

Danach sollte unter ``./a.out`` eine Datei vorhanden sein die von ``stdin``
Eingaben liest und sie in Tokens zerlegt:

    $ echo "Im two words" | ./6 
       #1 Im
       #1 two
       #1 words
       #0 

    3 words 10 characters

Obige Beispielimplementierung der Übungsaufgabe 6 dazu findet sich im Anhang
unter ``6.i``.

Obwohl sich ``flex`` durchaus zum Parsen von Tokens missbrauchen lässt, ist die
Handhabe bei komplexeren Grammatiken eher schwierig. Zwar können Zustände
verwendet werden um zu definierten Zeitpunkten bestimmte Muster anzuwenden, doch
führen diese zu relativ unübersichtlichen Definitionen. Ein Beispiel welches
Kommentare erkennen kann findet sich im Anhang unter ``7.i``. 

## Parser

Unterschiedliche Parserarten:
    
1. LL(0) Parser (top-down)
   Lookahead von nur einem Zeichen.
   Einfach zu implementieren, aber relativ beschränkt.
2. Auch LR Parser (bottom-up)
   (l = tokenstrom v. l nach rechts generiert), r = parser
   Reduktion nach rechts. (Shift-Reduce Automat)
   Tools wie yacc fallen in diese Kategorie.

Die Grenze zwischen Parser und Scanner ist flüssig, da man auch das Umwandeln
eines Strings in eine Ganzzahl als Parsen aufgefasst werden kann. Müssen aber
komplexere Statements geparst werden, die aus einzelnen Tokens bestehen und
Unterformen von sich selbst enthalten, so empfiehlt sich die Benutzung eines
Parsergenerators.

- Meist direkt mit dem Scanner verzahnt, Scanner liefert token, parser
  konsumiert es. 
- Shift-Reduce Mechanismus
- Shift: Ein Token lesen und probieren eine der Regeln zu matchen.
  Wenn keine Regel anwendbar wird das Token auf einen Stack gelegt.
- Reduce: Anwenden einer Regel auf die Inhalte des Stacks und des aktuellen
  Tokens.
- Konflikte möglich (Shift-Reduce conflicts, if then else problematik)
  Reduce-Reduce Problematik wenn ein Lookaheadtoken zu zwei Produktionen
  vervollständigt werden kann.
- YACC (Yet another compiler compiler)
- name.y -> [bison] -> y.tab.h, y.tab.c
- Kompatible weiterentwicklung aus gnu umfeld: bison

Tools wie ``yacc`` baut aus der theorethischen Sicht letzlich die Tabelle der
Übergangsfunktionen.

Im weiteren wird auf ``bison`` eingegangen, da damit die Übungsaufgaben erledigt
worden sind.

Der Aufbau einer Bison-Datei ist relativ ähnlich zu dem einer ``flex`` Datei:

- Vorbereitender C-Code in ``%{`` ``}%``.
- Bison-Steueranweisungen danach. Vor allem die ``%union`` Anweisung sollte
  gegeben sein. Bei ``Shift/Reduce``--Konflikten kann hier die Angabe von
  ``%left`` oder ``%right`` bei bestimmten ``%tokens`` helfen.
- Grammatik in EBNF Form mit Aktionen in geschweiften Klammern.
  Innerhalb dieser Aktionen kann der eigentliche Reduce--Vorgang ausgeführt
  werden indem aus den speziellen Variablen ``$1..$n`` ein neuer typisierter
  Ausdruck gebaut wird der in ``$$`` gespeichert wird. Dadurch werden die
  vorigen Tokens mit diesem neuen Ausdruck ersetzt. 
- Weiterer C-Codeblock für ``main``.

# Beispiel

Als Beispiel für das Zusammenarbeiten von ``flex`` und ``bison`` wurde eine
kleine (für den Autor) nützliche Beispielanwendung geschrieben.

Die freie SQL--Datenbank ``SQLite3`` unterstützt Volltextsuche. Dazu
implementiert die ``fts3``--Erweiterung (*f*ull *t*ext *s*earch) eine spezielle
``MATCH``--Clause. Als Argument übergibt man dieser einen String in einer
bestimmten Syntax. Diese Syntax entspricht im einfachsten Falle einen simplen
Suchbegriff der dann in allen Spalten der Datenbank gesucht wird. Zudem können
spezielle Spalten ausgewählt werden und verschiedene Ausdrücke mit den `` AND
``, `` OR `` und `` NOT `` verbunden werden. Zudem können Ausdrücke geklammert
werden um doppeldeutige Reihenfolgen eindeutig zu machen. Auch sind Wildcards
möglich um nur den Anfang eines Strings zu matchen.

Die genaue Beschreibung der Syntax findet sich hier: 

    https://www.sqlite.org/fts3.html

Am Beispiel einer Musikdatenbank kann ein Ausdruck etwa so aussehen:

    (artist:Knorkator OR album:"Hasen*") AND (artist:knor OR album:knor OR
    album_artist:knor OR title:knor) AND title:b AND (date:2001 OR date:2002 OR
    date:2003)

Das ist natürlich für einen normalen Anwender eher schwer zu tippen oder zu
lesen. Der Autor nutzt daher in seinem MPD--Client[^1] eine alternative Syntax die
dann intern zu einer validen ``SQLite3--fts`` ``MATCH`` Clause umgebaut wird.

Der obige Ausdruck kann mit dieser Syntax von oben so umgeschrieben werden:

    (artist:Knorkator | b:"Hasen*") + knor g:rock d:2001-2003

Im Detail wird ``AND`` mit ``+``, ``OR`` mit ``|`` ersetzt und ``NOT`` mit
``!``. Die Spaltennamen erhalten jeweils Abkürzungen, so wird beispielsweise aus
den längeren ``artist:SomeArtist`` das kürzere ``a:SomeArtist``. 
Einzelne Begriffe wie ``a`` werden zu ``(artist:a OR album:a OR album_artist:a
OR )`` ersetzt, da eine Suche in anderen Spalten wenig Sinn macht oder
ungewollte Ergebnisse liefert. Bei der ``date:`` Spalte soll es zudem möglich
sein einen Bereich anzugeben. Eine Bereichsuche ist zwar in der Volltextsuche
nicht vorgesehen, kann aber (ineffizient) emuliert werden indem für jede Zahl in
diesem Bereich ein ``date:<zahl>`` Begriff eingefügt wird. Siehe dazu das
Beispiel oben.

Der vorige Parser war in C geschrieben und hat 700 Zeilen:

    https://github.com/studentkittens/moosecat/blob/gobject/lib/store/moose-store-query-parser.c
    
Die Flex/Bison Variante ist im Anhang unter ``fts.i`` zu finden.  Sie ist
größtenteils funktionsäquivalent mit dem obigen von Hand geschriebenen Parser,
kommt aber auf nur knapp 300 Zeilen. Lediglich die Fehlerbehandlung ist momentan
noch sehr stiefmütterlich.

Beispielaufruf des Parsers:

    $ make fts
    $ echo 'a:"Joe Cocker"' | ./a.out
    -> artist:"Joe Cocker"
    $ echo 'artist: artist:' | ./a.out 
    line 0: syntax error
    line 0: Empty input.

[^1]: https://github.com/studentkittens/moosecat

# Anhang
