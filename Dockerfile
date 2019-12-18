# an argument for the python version
# by default this is for version 3.6.8, but it can be modified
ARG PYTHON_VERSION=3.6.8

# the base image to build from with python version passed through
FROM python:${PYTHON_VERSION}

# set the working directory
WORKDIR /opt/flask-app

# copy files from context to working directory
# .dockerignore is used to ignore any files you don't want to copy over
COPY . .

# app will run on port 8000 (gunicorn default)
EXPOSE 8000

# install dependencies
RUN pip install -r requirements.txt

# env variables
# need to be set for flask app to connect to database
ENV MYSQL_USER=''
ENV MYSQL_PASSWORD=''
ENV MYSQL_URL=''
ENV MYSQL_DATABASE=''
ENV MYSQL_SECRETKEY=''

# app runs on gunicorn
ENTRYPOINT ["gunicorn", "-b", "0.0.0.0:8000", "flask_app:app"]
