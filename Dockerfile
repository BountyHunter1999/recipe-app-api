# Pull base image
FROM python:3.11-rc-alpine

# Environment Variables
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

# installing required packages
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# Set work directory
RUN mkdir /app
WORKDIR /app

# Copy project
COPY ./app /app

# Create a user and switch to it
RUN adduser -D user
USER user