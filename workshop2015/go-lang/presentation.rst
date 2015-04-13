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

- not so many libraries yet.
- although go can link with most existing libraries.

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

   

Go is parallel
==============

**Channels:** Something something.

**Go routines** Another something.

.. code-block:: go

   make(chan SomeTyp)
