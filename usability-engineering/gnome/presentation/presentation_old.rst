:title: go-lang
:author: Christopher Pahl, Christoph Piechula
:description: The Hovercraft! tutorial.
:keywords: presentation, backend, impress.js, hovercraft, go-lang
:css: presentation.css

----

.. utility roles

.. role:: underline
    :class: underline

.. role:: blocky
   :class: blocky

.. role:: tiny
   :class: tiny

:id: first 

Google Go
:tiny:`(2½)`

.. note::


    - Was ist Gnome? (5 Minuten)

      - Ein Desktop für Linux.
      - (Ja, Linux hat mehr als einen Desktop - oder auch gar keinen)
        (wer nutzt ihn?)
      - Mittlerweile Version 3.18
      - Sieht so aus (Demo)

    - Was hat das mit Usability zu tun?
    - Beispiel: Currently Playing

    - Der Gnome HIG (10 Minuten)
 
      - Ein ganzen Desktop ähnlich zu stylen ist schwierig.
      - Besonders wenn es gut aussehen soll. 
      - Besonders wenn es behindertengerecht nutzbar sein muss.
      - Besonders wenn es effizient benutzbar sein muss.
      - Besonders wenn es internationalisiert ist.
      - (aaaaah!)

      - Ein paar Strategien dagegen:

        - Alle nutzen dasselbe Toolkit: Gtk+ (selbe Widgets und Shortcuts immerhin)
        - Aber Design?
        - Ein Designdokument an das sich alle halten müssen.
        - Mit viel Patterns

      - Patterns aus HIG vorstellen.

    - Was hat man davon als Entwickler?

      Machen wir einen kleinen Test (10 Minuten)

      - Shredder zeigen.
      - Frontend für einen Duplikatfinder in Gtk.
      - Größtenteils nach Gnome Richtlinien gestaltet.

.. image:: images/gopherswrench.png
   :width: 70%
   :align: center

.. note::

   Wir haben eine sehr go-reiche Woche gehabt.

   Umfrage: Wer hat go gemacht seit dem letzten mal?

   Wir werden die nächsten 40 Minuten etwas schneller reden.

   Agenda:

    * Einführung
    * Überblick wie GO Entwicklung aussieht/Demo
    * Spracheinführung
    * Übung
    * Go extended features
    * Überraschung
   
   Das wird kein Go Tutorium, es geht uns eher drum dass ihr einfach mal 
   so seht wie die Sprache so aussieht und wie man damit Probleme löst.

   Neue Sprachen lernen erfordert leider immer noch Übung :)

   Das ist übrigens immer noch gopher. Wir mögen ihn auch immer noch.
   Er ist immer noch putzig.

----

:blocky:`Was ist Go`

.. note::

    * Aktuelle Version: 1.4 (Dezemeber 2014)
    * Drei haben Erfahrung mit Sprachdesign
    * Go hat durchdachtes Design an vielen Ecken

*Eine Programmiersprache.*

+ Erster Release *2009.* Stable 1.0 version seit *2012*
+ Nebenläufig, imperativ & objektorientiert. 
+ Von *Ken Thompson*, *Rob Pike* & *Robert Griesemer*.
+ Strong & Static (Duck) typing; Garbage collected.

,, **Java** tries to be successor of **C++**.''

,, **Go** a successor of **C**. ''

.. image:: images/ken.png
   :align: center

------

.. note::

    * Nachbesserung zum letzten Mal -> doch viel Go im ,,backend''
    * Dropbox -> Performancekritische sachen in Go
    * Github, Youtube -> Backendinfrastruktur teile in Go

:blocky:`Go Projekte`

Bei genauerer Betrachtung schon einige: 

- Google Doodles
- Google App Engine
- Youtube
- Docker
- Dropbox
- …

Allgemein, viele Backendprojekte:

.. image:: images/appengine.png
   :align: left
   :width: 15%

.. image:: images/docker.png
   :align: center
   :width: 15%

.. image:: images/doodle.png
   :align: right
   :width: 30%

.. image:: images/dropbox.png
   :align: right
   :width: 15%

.. image:: images/youtube.png
   :align: right
   :width: 20%

-----

:blocky:`Hello World`

.. note:: 

   * Go sieht aus wie C von Python vergewaltigt
   * Konstrukte beider Sprachen eingefloßen
   * << Folie erklären >>
   * <<< JETZT ERSTMAL SWITCH ZUR Nächste FOLIE >>>

.. code-block:: go

   package main

   import "os"
   import "fmt"

   func main() {
       if len(os.Args) > 1 && os.Args[1] == "mandarin" {
           fmt.Println("Hello, 世界")
       } else {
           fmt.Println("Hello, World!")
       }
   }

-----

:blocky:`Demo`

.. note::


    + Jetzt werden wir praktische
    + GOPATH zeigen, workspace zeigen 
    + cd ~/go/bin/
    + mkdir -p src/github.com/qitta/helloworld
    + cd src/github.com/qitta/helloworld
    + go tool (go help zeigen)
    + Tools: debugger, profiler, documentation tool, formatter, static analyzer,
           build system, package manager... und compiler.
    + vim helloworld.go  # go fmt erwähnen, go def, autocompletion, go lint
    + go install / go build/ go run
    + Es kompiliert so schnell dass man es als Skriptsprache nehmen kann: go run
    + ausführen helloworld
    + vim helloworld_test.go
    + go test
    + vim helloworld_test.go # benchmark schreiben
    + go test -bench Add
    + debugger: man kann den standard gdb verwenden.

.. code-block:: bash

   $ go help

-----


:blocky:`Datentypen`

.. note::
   
    * <<< GO Playground googeln >>>
    * Umgekehrte Typreihenfolge
    * Standarddatentypen wie bei jeder anderen Programmiersprache.
        (int, float, byte, rune, string).

    * Kurzschreibweise nur innerhalb Funktionen erlaubt.
    * Unicode Bezeichner sind übrigens erlaubt.
    * Kein up/downcasting wie in C/Java.
    * Keine Pointerarithmetik
    * Variablen immer definiert auf nil/0 etc
    * Maps immer typisiert
    * Interne Verarbeitung UTF8


**Primitive Datentypen:**

.. code-block:: go

   var name string = "Berta"    // Normale Schreibweise
   Δtime := 42.0                // Kurzschreibweise (inferred)
   a, b, c := 1.0, 77, "Helmut" // Multiple Zuweisung
   var balance int = int(2.0)   // Explizite Konversion
   var pb *int = &balance       // Pointer zu balance. (iiih!)

**Maps:**

.. code-block:: go

   hostToIP := make(map[string]string)            // Hashtable
   hostToIP["localhost"] = "127.0.0.1"            // Zuweisung

**Arrays & Slices:**

.. code-block:: go

   animals := [...]string{"cat", "moose", "owl"}  // Array
   saneAnimals := animals[:2]                     // Slices
   fmt.Println(animals, saneAnimals)              
   /* ↦ [cat moose owl] [cat moose] */

-----

:blocky:`if`

.. note::

    * Entpspricht C meist
    * Unterschied: Kein Klammern () -> Go Blocks {}
    * << Folie erklären >>

.. code-block:: go

   if name == "wolfgang" {
       fmt.Println("vermutlich männlich.")
   }

Mit optionaler Kurzdeklaration:

.. code-block:: go

   if personId := GetId(name); personId > 0 {
       fmt.Println("Person ID was", personId)
   } else if personId == 0 {
       fmt.Println("Placeholder person id.")
   } else {
       fmt.Println("Invalid person.")
   }

-----

:blocky:`switch`

.. code-block:: go

    switch os := runtime.GOOS; os {
    case "linux":
        fmt.Println("[good descision!]")
        fallthrough
    default:
        fmt.Printf("%s.", os)
    }

Bedingungsloses ``switch`` als ``if/else`` Ersatz:

.. code-block:: go
    
    switch now := time.Now(); {
    case now.Hour() < 13:
        fmt.Println("Guten Morgen!")
    case now.Hour() < 17:
        fmt.Println("Guten Nachmittag!")
    default:
        fmt.Println("Guten Abend.")
    }

-----

:blocky:`for`

.. note::

    * Kein Preinkrement
    * Kein while loop, nur for. Auch for range.
    * Man kann alles weglassen. -> Endlosschleife

**Normales**   ``C for``:

.. code-block:: go

   for i := 0; i < 10; i++ {
       // …
   }

``while``  **Schleife**:

.. code-block:: go

   for {
       if something  {
           break  // or continue
       }
   }

``foreach`` **Schleife**:

.. code-block:: go

   for host, ip := range hostToIP {
       fmt.Println(host, "↦", ip)
   }

-----

:blocky:`func`

.. note::
   
    * <<< Folie erklären >>>
    * Go hat keine Defaultparameter. Leider.
    * Man kann auch return values benennen und sie dadurch direkt setzen.

.. code-block:: go

   func GetCoolnesFactor(language string) int {
       switch language {
           case "java":   return 1
           case "python": return 7
           case "golang": return 8
           default: 
               return -1
       }
   }

**Fehlerbehandlung mit mehreren Rückgabewerten:**

.. code-block:: go

   func div(a, b int) (int, int, error) {
       if b == 0 {
           return 0, 0, errors.New("divisor should not be 0")
       }
       return a / b, a % b, nil
   }

-----

:blocky:`Closures`

.. note::

   - Go unterstützt Higher Order Functions
   - Closure = anonyme Funktion die auf Erstellungskontext zugreifen kann.
   - Python ähnliche Generatoren.

.. code-block:: go

    func fibonacciEngine() func() int {
        f1, f2 := 0, 1
        return func() int {
            f2, f1 = f1 + f2, f2
            return f1
        }
    }

    func main() {
        fib := fibonacciEngine()
        for i := 0; i < 10; i++ {
            fmt.Println(fib())
        }
    }


-----

.. note::

    - Kommen wir zur ersten Aufgabe von 20 heute..
    - 2-3 Minuten Pause.
    - Zeit 5-10 Minuten, der erste bekommt Kekse!
    - Startwert für z auswählen (1.0)
    - Iterativ z berechnen, zurückgeben. (wieviel reichen denn aus?)
    - Plus: Iteration bei geringem Delta abbrechen.
    - Name: Newtonsche Quadratwurzelannäherung
    - Als nächstes Extended Features von Go

:class: excercise1

:blocky:`Aufgabe 1/20`

.. image:: images/newton.png

*Quadratwurzel iterativ selber approximieren:*

.. code-block:: go
   
   package main

   import "fmt"
   import "math"

   func Sqrt(x float64) float64 {
       // …?
   }

   func main() {
       better, worse := math.Sqrt(42), Sqrt(42)
       fmt.Printf("%g - %g = %g", better, worse, better - worse)
   }

*Web-Playground:* https://play.golang.org/

-----

:blocky:`OOP`

.. note::

    <explain slide>

    * In anderen Sprachen: Klassen, Objekte, Instanzen
    * In Go: Typen, Interfaces (was sind Typen sind) und Values
    * Interfaces: Sammlung von Methoden.
    * Unterschied philsophischer Natur
    * Duck typing Prinzip (wenn es sich wie ne Katze benutzt werden kann, ist es ne Katze)


**Go** hat eigentlich keine Klassen oder Vererbung.

.. code-block:: go

   type Animal interface {
       getName() string   // Interface-Anforderung
   }

   type Cat struct {      
       Name string        // Membervariable
   }

   func (c Cat) getName() string {    
       return c.Name
   }

   func GreetAnimal(animal Animal) {
        fmt.Println("Hello, " + animal.getName())
   }

   func main() {
       GreetAnimal(Cat{Name: "Garfield"})
   }

-----

:blocky:`Packages`

.. note::

    - Ein Paket kann auf mehrere Dateien mit selben package xy aufgeteilt sein.
    - Public/Private durch Groß/kleinschreibung definiert.
    - import durch vollen packagenamen, nutzung durch letzten teil. (fmt.Xy)
    - Mainmethode immer im package main.

``$GOPATH/github.com/studentkittens/tux/tux.go``

.. code-block:: go

   package tux

   func Name() {
        return "Tux"   
   }

``$GOPATH/main.go``

.. code-block:: go

   package main

   import (
       "fmt"
       "github.com/studentkittens/tux"
   )

   func main() {
       fmt.Println(tux.Name())
   }

-----

:blocky:`Errors`

.. note::

    - << Folie erklären >>
    - defer erklären.
    - Beispiele sind äquivalent. (Auch python context manager)
    - Die Beispiele sind sogar (fast) gleich lang!
    - Es gibt auch noch panic + defer/recover.
    - Die sind aber mehr für ernste absolute unerwartete Fehler.

**Python:**

.. code-block:: python

   try:
       with open('/nope', 'r') as fd:
           print(fd.read())
   except FileNotFoundError:
       print('Dude?!')

Das Gleiche in **Go**:

.. code-block:: go

    if fd, err := os.Open("/nope"); err == nil {
        defer fd.Close()
        fmt.Println(ioutil.ReadFile(fd))
    } else {
        fmt.Println("Dude?!")
    }

-----

:class: heading

:blocky:`Goroutinen`

Parallele **Go** Entsprechung eines **Python** Generator:

.. note::

   - Go ist eine Sprache wo parallele Programmierung sehr einfach ist, da in
     Sprache eingebaut.
   - Man kann einfach durch go func() Aufgaben *nebenläufig* starten. 
   - Go routinen sind nicht nur nebenläufig sondern meist auch parallel... aber! achtung!
   - Go hat einen eigenen Scheduler der die go routinen auf tatsächliche threads
     aufteilt. Ob eine go routine tatsächlich parallel ist, ist ein
     "Implementierungsdetail"

    - Channels erklären, gepuffer, ungepuffert
    - unterschied zu anderen sprachen: man benötigt eine threadlib und zB
      AsyncQueues zur Kommunikation
    - Folie erklären

*Go routines:* 

.. code-block:: go

    func fibonacci(n int, c chan int) {
        x, y := 0, 1
        for i := 0; i < n; i++ {
            c <- y
            x, y = y, x+y
        }
        close(c)
    }

    func main() {
        c := make(chan int, 10)
        go fibonacci(100, c)
        for i := range c {
            fmt.Println(i)
        }
    }

------

:blocky:`select`

.. note::

    - In go kann man sich mit den eingebauten Mitteln sehr einfach einen
      Eventloop bauen
    - Ein Eventloop wird ja in der asynchronen programmierung genutzt um
      bei auftreteten Ereignissen reagieren zu können. So können nichtblockend v
      viele Ereignisse nebenläufig abgearbeitet werden.
    - [Vergleich select mit socket-select bei linux]
    - tick ist ein channel
    - <<< folie erklären >>>

Ein simpler **Eventloop** in **Go**:

.. code-block:: go

    func main() {
        tick := time.Tick(100 * time.Millisecond)
        boom := time.After(500 * time.Millisecond)
        for {
            select {
            case <-tick:
                fmt.Println("tick.")
            case <-boom:
                fmt.Println("BOOM!")
                return
            default:
                fmt.Println("    .")
                time.Sleep(50 * time.Millisecond)
            }
        }
    }

------

:blocky:`Pluspunkte`

+ Beinahe die Schnelligkeit von **C**…
+ …kombiniert mit der Einfachheit und Kürze von **Python**.
+ Große Standardlibrary (**Batteries included**; *Websockets!*)
+ Kompiliert schnell genug um als **Skriptsprache** zu dienen.
+ Viele gängige **Werkzeuge** sind Bestandteil der Sprache.
+ **Open Source** und von **Google** supported.
+ Einfaches **Deployement**. (*eine statische gelinkte Binary*)

-----


.. note::

    GObject -> Gtk und co.

    Viele Leute wollen Go wie ihre gewohnte Sprache benutzen.
    Doofe Idee, aber Menschen sind halt Gewohnheitstiere.

    Man kann mit varargs optionale parameter faken.

:blocky:`Minuspunkte`

- Ungewohnt ⎯ vor allem für **Java** Programmierer.
- Einige **fehlende Bibliotheken** (*GObject!*) noch nicht portiert.
- **Binaries** sind ein bisschen **groß** (*~2 MB per HelloWorld*)
- Noch keine **Generics**. *(…Nachteil?)*
- Keine **Listcomprehensions**. (😕)
- Keine **Defaultparameter**. (😞)
- Wenige Go-Programmierer auf dem **Markt**. (😃)

------

:id: catlight

.. note:: 

    - Wir haben euch auch noch ein kleines Beispiel mitgebracht
    - Vorher: kleines Beispiel mit Martini
    - Heute: Kleiner Webserver mit der standard net/http lib.

:blocky:`Catlight Demo`

.. image:: images/catlight.png

**(...oder wie Gopher Licht ins Dunkel brachte)**

-------

:id: fin

.. note::

    BOOK!

    If you really want to dive in Go, I can recommend those:

:blocky:`Letzte Worte`

    https://tour.golang.org/

    https://gobyexample.com/

|
|

**(Fragen?)**
