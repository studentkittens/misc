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

* A micro web framework written in Python (2/3)
* Developed by Armin Ronacher
* Extensively documented

::

    The idea of Flask is to build a good 
    foundation for all applications. Everything
    else is up to you or extensions. 
                              -- Armin Ronacher

----

Microwebframework
=================

* Keeps the core simple but extensible

  + No form validation
  + Has no database abstraction layer
  + [ ... ]

* Add features by using extension

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

Frontend
========

* Jinja2 

    + Template Inheritance
    + Fast development
    + Secure

* Extensions like Flask-Bootstrap
  

----

Backend
=======

* Pros:

  + Maximum flexibility by using extensions
  + Batteries included 
  + Fast prototyping language

* Cons:

  + Synchronous framework by nature
  + ,,Slow" interpreted language

----


Security
========

* Flask-Security (extension)

  + Session based authentication
  + Role management
  + Password encryption
  + Basic HTTP authentication
  + Token based authentication (activation | password recovery | resetting)
  + User registration 
  + Login tracking 
  + JSON/Ajax Support

* Jinja2 XSS prevention


----

Developement Tools
==================

* Integrated development server and debugger

.. code:: python

   if __name__ == '__main__':
       app.run(debug=True, port='4242')

Testing
=======
 
* integrated unit testing support
