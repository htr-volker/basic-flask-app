'''
Python file that handles hyperlink routing within the site
'''
from flask import render_template, redirect, url_for, request
from application import app, db
from application.forms import GenerateNumberForm

# Route to home page
@app.route('/')
def home():
	# button to generate a random number
	generate_number = GenerateNumberButton()
	number = requests.get("http://localhost:5001/")

	# request the number from service-1 when button is pressed
	if generate_number.is_submitted():
		number = requests.get("http://localhost:5001/")

    return render_template('index.html',
    	title = 'Home',
    	generate_number = generate_number,
    	number = number
    )
