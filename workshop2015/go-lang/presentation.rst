:title: go-lang
:author: Christopher Pahl
:description: The Hovercraft! tutorial.
:keywords: presentation, backend, impress.js, go-lang
:css: presentation.css

Brainstorming:

- Factoids:

  - first seen 2009
  - paradigms: parallel, imperativ, object oriented
  - developed by ken thompson and rob pike

- Glenda/Gopher as mascot
- Philosophy, write uniform code, best practices
- Mention gooogle doodles being written in it.
- SOme other examples
- Java tries to be successor of C++, Go a successor of C. 
- Different object approach
- show hello world.
- Show mostly differences to other languages
- Backend explanation:

  - Communication part
  - Processing part

- Why is ist suitable for backend developement.

  - damn fast.
  - highly parallel 
  - object oriented, although totally different to java. 
  - there is even a concurrent web crawler at the end of the introduction tour
    -- it has 60 lines as core.

- Testing

  - built in

- Package manager built in too.
- compiles blazingly fast

Disadvantags

.. note::

    ``gccgo`` needs to be used for that and only with conventionally 
    compiled libraries.
    However there is cgo.

- Other weirdness: No exception (but error, defer, panic, recover) 
- generics missing, but might be added in future versions.

----

.. First slide

.. image:: images/glenda.png
   :width: 25%
   :align: center

----

``go-lang``
===========

.. note::

    Disclaimer: I have no experience yet with go lang, I never came beyond the
    tutorial. those points are rather why I'd love to learn it.

Hello my kitteh.


.. code-block:: go

   package main

   import "fmt"

   func main() {
       fmt.Println("Hello, 世界")
   }

-----

:id: heading

Go can do OOP 
=============

- But without classes and inheritance. Huh?
- Duck typing does not needed classes.
- But there are interfaces!

.. code-block:: go

   dummy


-----

Go is parallel
==============

**Channels:** Something something.

**Go routines** Another something.

.. code-block:: go

   make(chan SomeTyp)


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
  platforms like Heroku.

.. note::

    Beego looks to be a full featured MVC framework, maybe on the same level as
    Rails. It doesn’t make any attempts at being small. It has its own logging
    library, ORM and Web frameworks.

-----

Random Example: *Martini*
==========================

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

Developer tools
===============

- There are IDEs, yes.
- But most go developers prefer to use a simple text editor.
- Introducing the ``go`` command line tool.
- Buildsystem, package manager, testing tool and more.

.. note:: 

    go shebang

Security
========

- automatic garbage collection
- no pointer arithmetics or buffer overflows
- out-of-index can be handled by global recover.

Summary
=======

.. note::

    It has not yet the speed of C yet.

*Advantages:*

+ Very fast with little programming effort.
+ High parallelism, making it well suited for backend tasks and
  asynchronous requests.
+ Many webframeworks and deployement possibilities.

*Disadvantages:*

- Not a very common language yet
- Might be weird for Java programmers.
- not so many libraries yet.

.. note::

    libraries for common 
