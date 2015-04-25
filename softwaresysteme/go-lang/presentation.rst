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

.. image:: images/glenda.png
   :width: 25%
   :align: left

Google Go (2½!)

.. note::

   Wir haben eine sehr go-reiche Woche gehabt.

   Umfrage: Wer hat go gemacht seit dem letzten mal?

   TODO: Agenda?

   Wir werden die nächsten 40 Minuten etwas schneller reden, 
   falls 

   Das ist übrigens immer noch gopher. Wir mögen ihn auch immer noch.
   Er ist immer noch putzig.

----

:blocky:`Was ist Go?`

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

Stuff that's written in Go
==========================

*Not so much yet actually:*

- Google Doodles (*you seem them almost daily!*)
- Google App Engine
- Docker

In general, a lot of backend stuff:

.. image:: images/appengine.png
   :align: left
   :width: 20%

.. image:: images/docker.png
   :align: center
   :width: 20%

.. image:: images/doodle.png
   :align: right
   :width: 40%

.. note:: 

    <explain slide>

    I cannot give an tutorial, but I can show some of the special features of Go.

    Go has also most of the constructs and datastructures most other imperative language have, but we'll focus on the weird bits. 

    So let's start with...

-----

Eingebaute Datentypen
=====================

.. note::

    Standarddatentypen wie bei jeder anderen Programmiersprache.
    (int, float, byte, rune, string).

    Kurzschreibweise nur innerhalb Funktionen erlaubt.
    Unicode Variablen sind übrigens erlaubt.
    Kein up/downcasting wie in C/Java.

**Primitive Datentypen:**

.. code-block:: go

   var name string = "Berta"    // Normale Schreibweise
   Δtime := 42.0                // Kurzschreibweise (inferred)
   a, b, c := 1.0, 77, "Helmut" // Multiple Zuweisung
   var balance int = int(2.0)   // Explizite Konversion

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

``tux.go``

.. code-block:: go

   package tux

   func Name() {
        return "Tux"   
   }

``main.go``

.. code-block:: go

   package main

   import (
       "fmt"
       "tux"
   )

   func main() {
       fmt.Println(tux.Name())
   }

-----

:class: heading

:blocky:`Go is parallel`

… and parallel is easy with Go.

.. note::

    No conventional threads. 
    Only goroutines and channels to communicate between them.
    go routines can be seen as lightweight threads.

    Go routines do not necessary have a thread behind them, that's
    an implementation detail of go.


*Go routines:* 

.. code-block:: go

    func main() {
        for i := 0; i < 10; i++ {
            go func(i int) {
                fmt.Println(i)
            }(i)
        }
        time.Sleep(1)  // crappy synchronization
    }


------

:class: heading

:blocky:`Go is parallel`

*Channels:*

.. code-block:: go

    func echo(c chan int) {
        for {
            msg := <- c
            fmt.Println(msg)
        }
    }

    func main() {
        numbers := make(chan int)
        go echo(numbers)
        
        for i := 0; i < 10; i++ {
            numbers  <- i
        }
    }

.. note::

    Parallelism is built into the language itself. Communication also, no
    special data structures needed (like asynchronous queues). 

-----

Go has no exceptions
====================

.. note::

   <Spot the bug in the first code block>

   defer can be used to delay function execution till the end.

   even, if the function returns early or panics.

*But it has* ``defer``. Spot the bug here:

.. code-block:: go

   func processFile(srcName string)  {
       src, err := os.Open(srcName)
       if err != nil || !processFile(src) {
           return "oops, stuff did go wrong"
       }
       // … read src …
       src.Close()
       return "all cool."
   }

Using **Go**-idioms:

.. code-block:: go

   func processFile(srcName string)  {
       src, err := os.Open(srcName)
       defer src.Close()
       if err != nil || !processFile(src) {
           panic("oops, stuff did go wrong")
       }
       // … read src …
       // … caller should call recover() on errors …
    }

-----

Webframeworks
=============

*Quite some for a young language:*

- Full scale web frameworks like *Beego* or *Revel*:
- Lightweight alternatives like *Gorilla* or *Martini*.
- Often it's enough to use *Gorilla* & the standard ``net/http``. *(\*)*
- **Go** is supported well for *Google App Engine* and many other popular
  cloud platforms like *Heroku*.

.. image:: images/gorilla.png
   :width: 20%
   :align: left

.. image:: images/beego.png
   :width: 40%
   :align: center

.. image:: images/revel.png
   :width: 30%
   :align: right

*(\* Websocket support included)*

.. note::

    Beego looks to be a full featured MVC framework, maybe on the same level as
    Rails. It doesn’t make any attempts at being small. It has its own logging
    library, ORM and Web frameworks.

    <explain slide>

-----

Random Example: **Martini**
===========================

.. note::

    A bit the Flask of the Go world.
    A really lightweight framework.
    Below is some real world go code.

    <explain slide>

.. code-block:: go

   package main

   import "github.com/go-martini/martini"

   func main() {
       m := martini.Classic()
       m.Get("/hello/:name", func(params martini.Params) string {
           return "Hello " + params["name"]
       })
       m.Run()
   }

*Running it:*

.. code-block:: bash

   $ curl http://localhost:3000/hello/world
   Hello world

-----

Testing
=======

.. code-block:: go

    func TestStupid(t *testing.T) {
        if 1 + 1 != 2 {
            t.Error("I shouldn't have gone out of bed.")
        }
    }

    func BenchmarkStuff(b *testing.B) {
        for i := 0; i < b.N; i++ { 
            n = i * i / N  // whatever.
        }
    }

Run with:

.. code-block:: bash

   $ go test 

.. note::

    You can have the test modules and benchmark functions directly
    in the same module you have your code in.

-------

Developer tools
===============

- All major IDEs are more or less supported.
- But most go developers prefer to use a plain text editor.
- Buildsystem, package manager, testing tool, lint checker and more is
  integrated into the ``go`` command line tool. 
- Just no text editor in there yet.

.. note:: 

    IDEs: Netbeans, Eclipse, IntelliJ, Vim

    ``go`` tool makes most IDE features beyond code completion 
    and syntax highlighting less useful.

    Go shebang scripts

-------

Security aspects
================

.. note:: 

    Go is a programming language and you can't say "It's secure"#
    out of the box. 

    But the language learned from C in order to make less mistakes.

    There are actually pointers

    UTF-8, so programs have to handle broken encoding and do not silently 
    produce bad results or even trigger exceptions in the program.

    Every function go that can return an error should be checked.

**Go** features that might help make secure applications:

- No pointer arithmetics or buffer overflows.
- Automatic garbage collection.
- Strings are always *UTF-8*.
- Error handling and exception handling is the same thing. 

-------

Summary - the upsides
=====================

.. note::

    It has not yet the speed of C yet.
    
    Portable but not important for a backend.

    A bit like a nice and pleasant mixture of Python and C.


+ Very **fast** with little programming effort.
+ **Parallel**: well suited for asynchronous backend tasks.
+ Quite some **Webframeworks** and **Deployement** possibilities.
+ **Compiles** blazingly fast.
+ **Large** standard library (*Batteries included*)
+ **Easy** to learn for **C**-Programmers.
+ **Open Source** language (*BSD-Style*).

*There is a concurrent web crawler at the end of the introduction tour:*

It has about :underline:`60` lines of code as it's core.

-----

Summary - the downsides
=======================

- Not a very commonly **known** language yet.
- Might be weird for programmers coming from e.g. **Java**.
- Not so many **libraries** to chose from (yet).
- No **Generics** (yet).
- No **Exceptions**. *(\*)*
- Googling for *,,go run''* yields not what you want. 

(\* although replaced by ``defer`` and ``panic/recover``)

.. note::

    You dont find many programmers yet.

    people might feel the need for traditional OOP

    Example: GTK is still missing for go and many special need libs

-------

:id: fin

.. note::

    BOOK!

    If you really want to dive in Go, I can recommend those:

:blocky:`Last words`

    https://tour.golang.org/

    https://gobyexample.com/

|
|

**(Questions?)**
