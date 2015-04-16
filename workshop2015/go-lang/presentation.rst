:title: go-lang
:author: Christopher Pahl
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

Google Go

.. note::

    Welcome to my talk about Google Go and why you should learn it as your next
    programming language. And also why it's a good idea if that next project is
    a web application backend.

    That's gopher right there btw.
    Do not google for "gopher", that's a weird animal.

----

:blocky:`What is it?`

.. note::

    <explain slide>

    does not allow weird formatting

    Poll: Anyone used go already for something?

    Current version: 1.4
    

*A programming language obviously.*

+ First seen *2009.* Stable 1.0 version in *2012*
+ Paradigms: parallel, imperative & object oriented.
+ Developed by *Ken thompson* and *Rob Pike* at *Google*.
+ Strong & Static Duck typing; Garbage collected.
+ **Java** tries to be successor of **C++**.
+ **Go** a successor of **C**. 

.. image:: images/ken.png
   :align: center

-----

:blocky:`Hello world`

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

.. note::

    It looks something like this.
    It already looks like a mix of Python and C - and feels like it too.

    <Describe standard constructs>

    Who knows some software written in Go?

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

**Go** supports OOP…
====================

.. note::

    <explain slide>

    Go is a statically and strong typed language.
    But most of the time value types can be derived from the context
    by the compiler. Types are divided into interfaces and structs. 
    Every struct can be used by a certain interface as long all methods 
    of this interface were implemented for a certain struct.

    By the way, also note that type declaration is reversed in go, so the
    variable name commes first, and the type name second.

…but without classes and inheritance. **Huh?**

- Duck typing does not needed classes.
- But here are interfaces and (anonymous) composition!

.. code-block:: go

   type Animal interface {
       getName() string   // general member
   }

   type Cat struct {
       Animal             // anonymous member
       CutenessLevel int  // some other member
   }

   func (c Cat) getName() string {    // bound method
       return "Garfield"
   }

   func greetAnimal(animal Animal) { // general  function
        fmt.Println("Hello, " + animal.getName())
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
