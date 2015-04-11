:title: Flask
:author: Christoph Piechula
:description: The Hovercraft! tutorial.
:keywords: presentation, backend, impress.js, go-lang
:data-transition-duration: 500
:css: hovercraft.css

Brainstorming:

- Introduction to Flask
- What is a Microwebframework? -> lightweight
- Details of Flask Project
- Hello World
- Jinja Templating Engine, lots of plugins
- Good for prototyping
- If not enought go go!

----

:data-x: 300
:data-y: 2000

Introduction
============

.. image:: images/flask.png

----

Project details
===============

* A microwebframework written in Python
* Developed by Armin Ronacher
* Aims to be extensible and well documented

::

    The idea of Flask is to build a good 
    foundation for all applications. Everything
    else is up to you or extensions. 
                              -- Armin Ronacher

----

Microwebframework
=================

* keeps the core simple but extensible

  + no form validation
  + has no database abstraction layer
  + [ ... ]

* add features by using extension

  + Flask-OpenID, Flask-SQLAlchemy, ...



----

Hello World
===========

Creating a webpage with less code.

.. code:: python

    from flask import Flask
    app = Flask('my helloworld app')

    @app.route("/")
    def hello():
        return "Hello World!"

    if __name__ == "__main__":
        app.run()


----


Additional features
===================

* Integrated developement server and debugger
* RESTful request dispatching
* Support for secure cookies (client side sessions)
* Unicode-based
* Google App Engine Compatibility
