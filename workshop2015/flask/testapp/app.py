#!/usr/bin/env python
# encoding: utf8

from flask import Flask, render_template, url_for

app = Flask('my helloworld app')

@app.route('/plain/<name>')
def plain(name=None):
    return name

@app.route('/html/<name>')
def htmlrender(name=None):
    return render_template('index.html', name=name)

if __name__ == "__main__":
    app.run(debug=True)
