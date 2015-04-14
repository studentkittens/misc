:title: go-lang
:author: Christopher Pahl
:description: The Hovercraft! tutorial.
:keywords: presentation, backend, impress.js, hovercraft, go-lang
:css: presentation.css

----

.. First slide

:id: first 

.. note::

    Mention Gopher.

.. image:: images/glenda.png
   :width: 25%
   :align: left

Google Go

----

What is it?
===========

.. note::

    Disclaimer: I have no experience yet with go lang, I never came beyond the
    tutorial. those points are rather why I'd love to learn it.

+ First seen 2009.
+ paradigms: parallel, imperativ, object oriented
+ developed by ken thompson and rob pike
+ Philosophy, write uniform code, best practices
+ Java tries to be successor of C++, Go a successor of C. 
+ Current version: 1.4

.. image:: images/rob.jpg
   :align: left

.. image:: images/ken.jpg 
   :align: right

-----

Hello World!
============

.. code-block:: go

   package main

   import "os"
   import "fmt"

   func main() {
       if os.Args[1] == "mandarin (flo said that's how you call it)" {
           fmt.Println("Hello, 世界")
       } else {
           fmt.Println("Hello, World!")
       }
   }

.. note::

    Who knows some software written in Go?

-----

Stuff that's written in Go
==========================

*Not so much yet actually:*

- Google Doodles (you seem them daily!)
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

    Okay, now a very short tour through the language.  I cannot give an
    tutorial, but I can show some of the special features of Go Go has also most
    of the constructs and datastructures most other imperative language have,
    but we'll focus on the weird bits. 

-----

:id: heading

Go can do OOP
=============

But without classes and inheritance. **Huh?**

- Duck typing does not needed classes.
- But here are interfaces and (anonymous) composition!

.. code-block:: go

   type Animal {
       Name string        // general member
   }

   type Cat {
       Animal             // anonymous member
       CutenessLevel int  // some other member
   }

   func greetAnimal(cat *Cat) {
        fmt.Println("Hello, " + cat.Name)
   }


-----

Go is parallel
==============

... and parallel is easy with Go.

.. note::

    No conventional threads. 
    Only goroutines and channels to communicate between them.
    go routines can be seen as lightweight threads.


*Go routines:* 

.. code-block:: go

    func f(i int) {
        fmt.Println(i)
    }

    func main() {
        for i := 0; i < 10; i++ {
            go f()    
        }
    }

------

Go is parallel (#2)
===================

*Channels:*

.. code-block:: go

    func echo(c chan int) {
        for {
            msg := <- c
            fmt.Println(msg)
        }
    }

    func main() {
        numbers = make(chan int)
        go echo(numbers)
        
        for i := 0; i < 10; i++ {
            cmds <- i
        }
    }

.. note::

    Parallelism is built into the language itself.

-----

Go is weird (but in a cool way!)
================================

.. code-block:: go

   src, err := os.Open(srcName)
   if err != nil {
       return
   }
   // .. read src ...
   src.Close()

no exceptions, just panic and recover and defer.

.. code-block:: go

   src, err := os.Open(srcName)
   defer 
   if err != nil {
       return
   }
   // .. read src ...
   src.Close()


-----

Webframeworks
=============

Quite some for a young language.

- Full scale web frameworks like *Beego* or *Revel*
- Lightweight alternatives
- You can always built up on invidual components, like *gorilla* for websockets.
  and ``net/http`` 

- Google supports go well for their ``Google App Engine`` as many other popular
  platforms like Heroku do.

.. image:: images/gorilla.png

.. image:: images/beego.png

.. image:: images/revel.png

.. note::

    Beego looks to be a full featured MVC framework, maybe on the same level as
    Rails. It doesn’t make any attempts at being small. It has its own logging
    library, ORM and Web frameworks.

-----

Random Example: **Martini**
===========================

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


.. note::

    a bit like python, but 

-------

Developer tools
===============

- There are IDEs, yes.
- But most go developers prefer to use a simple text editor.
- Introducing the ``go`` command line tool.
- Buildsystem, package manager, testing tool and more.

.. note:: 

    go shebang erwähnen.

-------

Security
========

.. note:: 

    Go is a programming language and you can't say "It's secure"#
    out of the box. 

**Go** features that might help make applications secure:

- No pointer arithmetics or buffer overflows.
- Automatic garbage collection.
- Strings are always UTF-8.

-------

Summary
=======

.. note::

    It has not yet the speed of C yet.
    1. Backend explanation:

       1. Communication part
       2. Processing part

*Advantages:*

+ Very fast with little programming effort.
+ High parallelism, making it well suited for backend tasks and
  asynchronous requests.
+ Many webframeworks and deployement possibilities.
+ compiles blazingly fast
+ relatively fast to learn for C-Programmers

- Why is ist suitable for backend developement.

  - damn fast.
  - highly parallel 
  - object oriented, although totally different to java. 
  - there is even a concurrent web crawler at the end of the introduction tour
    -- it has 60 lines as core.

*Disadvantages:*

- Not a very common language yet
- Might be weird for Java programmers.
- not so many libraries yet.
- Other weirdness: No exception (but error, defer, panic, recover) 
- generics missing, but might be added in future versions.

``gccgo`` needs to be used for that and only with conventionally 
compiled libraries.
However there is cgo.

.. note::

    libraries for common 

-------

:id: fin

Last words:
===========

    https://tour.golang.org/

**(Questions?)**
