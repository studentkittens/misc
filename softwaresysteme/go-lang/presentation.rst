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

:id: first 

.. note::

    Mention Gopher.

.. image:: images/gopherswrench.png
   :width: 70%
   :align: left

Google Go 2½

.. note::

   Wir haben eine sehr go-reiche Woche gehabt.

   Umfrage: Wer hat go gemacht seit dem letzten mal?

   TODO: Agenda?

   Wir werden die nächsten 40 Minuten etwas schneller reden, 
   falls 

   Das ist übrigens immer noch gopher. Wir mögen ihn auch immer noch.
   Er ist immer noch putzig.

----

:blocky:`Was ist Go`

.. note::

    <explain slide>

    does not allow weird formatting

    Aktuelle Version: 1.4 (Dezemeber 2014)
    

*Eine Programmiersprache.*

+ Erster Release *2009.* Stable 1.0 version in *2012*
+ Concurrent, imperativ & Object orientiert. 
+ Von *Ken Thompson*, *Rob Pike* & *Robert Griesemer*.
+ Strong & Static (Duck) typing; Garbage collected.
+ **Java** tries to be successor of **C++**.
+ **Go** a successor of **C**. 

.. image:: images/ken.png
   :align: center

------

:blocky:`Go Projekte`

Bei genauerer Betrachtung schon einige: 

- Google Doodles
- Google App Engine
- Youtube
- Docker
- Dropbox
- ...

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

.. note:: 

    <explain slide>

    I cannot give an tutorial, but I can show some of the special features of Go.

    Go has also most of the constructs and datastructures most other imperative language have, but we'll focus on the weird bits. 

    So let's start with...

-----

:blocky:`Hello world`

.. note::

    - Kurz wirken lassen
    - Mix aus Python und C (typische Konstrukte zeigen: import etc)
    - GOPATH einrichten, workspace einrichten.
    
    + mkdir ~/go
    + export GOPATH=$HOME/go
    + cd ~/go
    + mkdir -p src/github.com/qitta/helloworld
    + cd src/github.com/qitta/helloworld
    + vim helloworld.go  # go fmt erwähnen, go def, autocompletion, go lint
    + go install / go build
    + Es kompiliert so schnell dass man es als Skriptsprache nehmen kann: go run
    + export PATH=$PATH:$GOPATH/bin
    + helloworld
    + vim helloworld_test.go
    + go test
    + vim helloworld_test.go # benchmark schreiben
    + go test -bench Add
    + debugger: man kann den standard gdb verwenden.


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

.. code-block:: bash

   $ go help

-----


:blocky:`Datentypen`

.. note::

    Standarddatentypen wie bei jeder anderen Programmiersprache.
    (int, float, byte, rune, string).

    Kurzschreibweise nur innerhalb Funktionen erlaubt.
    Unicode Variablen sind übrigens erlaubt.
    Kein up/downcasting wie in C/Java.

    1. No pointer arithmetics or buffer overflows.
    2. Strings are always *UTF-8*.

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
   /* ↦ [cat moose owl doves] [cat moose owl] */

-----

:blocky:`if`

.. note::

    Entpspricht C meist

    switch case als if/[else if]/else ersatz?

.. code-block:: go

   if name == "wolfgang" {
       fmt.Println("männlich.")
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

Bedingungslose ``switch`` als ``if/else`` Ersatz:

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

    Kein while loop, nur for. Auch for range.
    Man kann alles weglassen.

**Normales**   ``C for``

.. code-block:: go

   for i := 0; i < 10; i++ {
       // …
   }

``while``  **Schleife**

.. code-block:: go

   for {
       if something  {
           break  // or continue
       }
   }

``foreach`` **Schleife**

.. code-block:: go

   for host, ip := range hostToIP {
       fmt.Println(host, "↦", ip)
   }

-----

:blocky:`func`

.. note::

    Go hat keine Defaultparameter. Leider.

    Man kann auch return values benennen und sie dadurch direkt setzen.

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
       returb a / b, a % b
   }

-----

.. note::

    - Startwert für z auswählen (1.0)
    - Iterativ z berechnen, zurückgeben. (wieviel reichen denn aus?)
    - Plus: Iteration bei geringem Delta abbrechen.

:class: excercise1

:blocky:`Aufgabe 1/20`

.. image:: images/newton.png


*Quadratwurzel iterativ selber berechnen:*

.. code-block:: go
   
   package main

   import "fmt"
   import "math"

   func Sqrt(x float64) float64 {
       // ...?
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

    Interfaces: Sammlung von Methoden.

    Go is a statically and strong typed language.
    But most of the time value types can be derived from the context
    by the compiler. Types are divided into interfaces and structs. 
    Every struct can be used by a certain interface as long all methods 
    of this interface were implemented for a certain struct.

    By the way, also note that type declaration is reversed in go, so the
    variable name commes first, and the type name second.

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

    Es gibt auch noch panic + defer/recover.

    Die sind aber mehr für ernste absolute unerwartete Fehler.

    Die Beispiele sind sogar (fast) gleich lang!

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

    No conventional threads. 
    Only goroutines and channels to communicate between them.
    go routines can be seen as lightweight threads.

    Go routines do not necessary have a thread behind them, that's
    an implementation detail of go.


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

.. note::

    It has not yet the speed of C yet.
    
    Portable but not important for a backend.

    A bit like a nice and pleasant mixture of Python and C.

+ Beinahe die Schnelligkeit von **C**...
+ ...kombiniert mit der Einfachheit von **Python**.
+ Große Standardlibrary (*Batteries included*, *Websockets!*)
+ Kompiliert schnell genug um als Skriptsprache zu dienen.
+ Viele gängige Werkzeuge sind Bestandteil der Sprache.
+ **Open Source** und von **Google** supported.
+ Einfaches Deployement. (*eine statische gelinkte Binary*)

-----

:blocky:`Minuspunkte`

- Ungewohnte Sprachsyntax, vor allem für **Java** Programmierer.
- Einige fehlende Bibliotheken (*GObject*) noch nicht portiert.
- Binaries sind ein bisschen groß (*2 MB per Hello World*)
- (Noch) keine **Generics**. *(Nachteil?)*
- Wenige Go-Programmierer auf dem Markt. (😃)

.. note::

    You dont find many programmers yet.

    people might feel the need for traditional OOP

    Example: GTK is still missing for go and many special need libs

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
