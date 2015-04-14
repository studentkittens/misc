#!/usr/bin/env python
# encoding: utf8

from flask import Flask, render_template, url_for

app = Flask('my hello world app')

@app.route('/<name>')
def plain(name=None):
    if name is None:
        return 'This is just plain text, {}'.format(name)
    else:
        return render_template('index.html', name=name)

if __name__ == "__main__":
    app.run(debug=True)
