#!/usr/bin/env python
# encoding: utf8

from flask import Flask, render_template

app = Flask('myapp')

@app.route('/')
def index(name=None, methods=['GET']):
    return 'Hello Flask'

@app.route('/greet/<name>')
def greet(name=None):
    return render_template('index.html', name=name)

if __name__ == "__main__":
    app.run(host='localhost', debug=True)
