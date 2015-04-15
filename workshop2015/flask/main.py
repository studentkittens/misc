#!/usr/bin/env python3
# encoding: utf8

from flask import Flask, request

app = Flask(__name__)

@app.route('/<name>')
def name(name):
    if name == 'ghost':
        raise Exception('user not allowed.')
    else:
        return 'Hello {name}'.format(name=name)



if __name__ == '__main__':
    app.run(debug=True)
