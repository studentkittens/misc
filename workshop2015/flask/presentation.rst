:title: Flask
:author: Christoph Piechula
:description: The Hovercraft! tutorial.
:keywords: presentation, backend, impress.js, go-lang
:data-transition-duration: 500
:css: presentation.css 

Brainstorming:

- Introduction to Flask
- What is a Microwebframework? -> lightweight
- Details of Flask Project
- Hello World
- Jinja Templating Engine, lots of plugins
- Good for prototyping
- If not enought go go!


----

:id: first

Introduction 
============

.. image:: images/flask.png
    :width: 50%

----


:id: details 


What is **Flask**?
==================

.. image:: images/ar.png
    :width: 40%

* A microwebframework written in Python
* Started as a April Fool's joke
* Developed by Armin Ronacher



----


What does this **micro** mean?
==============================

:: 

    The idea of Flask is to build a good foundation for all 
    applications. Everything else is up to you or extensions.  
                                           -- Armin Ronacher

* Based on Werkzeug WSGI toolkit 
* Uses Jinja 2 template engine


.. image:: images/werkzeug.png
    :width: 20%

.. image:: images/jinja2.png
    :width: 20%

* Aims to extensible and well documented

.. note: depends only on jinja 2 and werkzeug

----

What does this **micro** mean? #2
=================================

* Flask keeps the core simple but extensible

  + No form validation
  + Has no database abstraction layer
  + no user management

* Add features yourself by using extensions

  + Flask-WTF
  + Flask-Cache
  
  
.. note:: wsgi, google app engine copatible, werkzeug

----


Hello World
===========

Creating a page with less code.

.. code:: python

    from flask import Flask
    app = Flask('myapp')

    @app.route("/")
    def index_page():
        return "Hello World!"

    if __name__ == "__main__":
        app.run()

----


Frontend and Backend #1
=======================

* Jinja 2 

    + Template Inheritance
    + Fast and flexible development
    
* Tempesting engine can be easily exchanged
* Extensions like Flask-Bootstrap
  
.. note:: Rendering templates in Python is not fun, you have to about proper
   html excaping to keep your application secure

----


Frontend and Backend #2
=======================

.. code:: html

   <!doctype html>
        <title>Hello from Flask</title>
    {% if name %}
          <h1>Hello {{ name }}!</h1>
    {% else %}
          <h1>Hello World!</h1>
    {% endif %}

.. code:: python

    from flask import render_template

    @app.route('/greet/<name>')
    def greet(name=None):
        return render_template('hello.html', name=name)

----

Frontend and Backend #3
=======================

* **Pros**:

  + Maximum flexibility by using extensions
  + Batteries included 
  + Fast prototyping language

* **Cons**:

  + Synchronous framework by nature
  + ,,Slow" interpreted language


.. note::

    Critical parts may be exchanged with Cython/C
    There is socketio, autobahn, tornado to implement async behaviour
    Flask on Google WebApp

----


Security
========

* Flask-Security (extension)

  + Session based authentication
  + Role management
  + Password encryption
  + Basic HTTP authentication
  + Token based authentication
  + User registration 
  + Login tracking 
  + JSON/Ajax Support

* Jinja2 XSS prevention

.. note:: 

    Various security modules
    KISS by default -> less bugs prone
    Jinja2 enhanced security -> unix philosophy

----


Developement Environment #1
===========================

Yes there are IDE's and Plugins!

* Eric
* PyCharm
* PyDev

But, Python developers often prefer to use simple text editors like **vim** or
**emacs**.

----

Developement Environment #2
===========================

* Integrated development server 
* Running on http://localhost:4242

.. code:: python

   if __name__ == '__main__':
       app.run(debug=True, port='4242')

.. note:: No webserver needed for testing


----

Developement Environment #3
===========================

* Integrated debugger console
* Directly integrated http://localhost:4242

.. code:: python

   if __name__ == '__main__':
       app.run(debug=True, port='4242')


Testing
=======
 
* Integrated unit testing support
