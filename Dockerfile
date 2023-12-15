# pull the official docker image
FROM python:3.11.1-slim-buster

# set work directory
WORKDIR /app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PYTHONPATH=/app

# install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# copy project
COPY . /app

# expose port
EXPOSE 10000

# run the app
RUN uvicorn api:app --host 0.0.0.0 --port 80
