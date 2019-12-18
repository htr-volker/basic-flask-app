'''
Python file that handles hyperlink routing within the site
'''
from flask import render_template, redirect, url_for, request
from application import app, db

# Route to home page
@app.route('/')
@app.route('/home')
def home():
    return render_template('home.html', title = 'Home', posts = observations)

# Route to about page
@app.route('/about')
def about():
    return render_template('about.html', title='About')
