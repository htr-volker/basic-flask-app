'''Main flask run file'''
from application import app
# Runs in debug mode and allows all connections
if __name__ == '__main__':
	app.run(debug = True, port = 5001)
