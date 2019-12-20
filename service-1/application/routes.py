'''
Python file that handles hyperlink routing within the site
'''
from flask import render_template, redirect, url_for, request
from application import app, db
from random import randint
import requests

@app.route('/', methods = ["GET"])
def generate_random_number():
	random_number = randint(0, 1000)
	#requests.post('http://localhost:5000/', json = {'random_number' : random_number})
	print("Generated random number: ", str(random_number), "\n")
	return random_number
