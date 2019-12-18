# an argument for the python version
# by default this is for version 3.6.8, but it can be modified
ARG PYTHON_VERSION=3.6.8

# the base image to build from which is ready to run
# Python code immediately
FROM python:${PYTHON_VERSION}

# the working directory for docker instructions has
# been changed to where our application is going
# to be installed
WORKDIR /opt/flask-app

# copy the correct python script to the current working directory
COPY . .

# the application runs on port 9000
# port 9000 on TCP has been exposed here for documentation purposes
EXPOSE 8000

# install dependencies
RUN pip install -r requirements.txt

# env variables
ENV MYSQL_USER=''
ENV MYSQL_PASSWORD=''
ENV MYSQL_URL=''
ENV MYSQL_DATABASE=''
ENV MYSQL_SECRETKEY=''

# an entrypoint has been set here
# the Python binary is executed, with the correct script as an argument
ENTRYPOINT ["gunicorn", "-b", "0.0.0.0:8000", "flask_app:app"]
