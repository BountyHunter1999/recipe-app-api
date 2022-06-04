# Pull base image
FROM python:3.7-alpine

# Environment Variables
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

# installing required packages
COPY ./requirements.txt /requirements.txt

# installing postgressql-client
RUN apk add --update --no-cache postgresql-client jpeg-dev

# adding temporary packages for requirements.txt
RUN apk add --update --no-cache --virtual .tmp-build-deps \
     gcc libc-dev linux-headers postgresql-dev \
     zlib zlib-dev

RUN pip install -r /requirements.txt

# removing the temporary packages
RUN apk del .tmp-build-deps


# Set work directory
RUN mkdir /app
WORKDIR /app

# Copy project
COPY ./app /app

# for static media files
RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/static

# Create a user 
RUN adduser -D user

# change ownership of the files
RUN chown -R user:user /vol/

# add permissions to run
RUN chmod -R 755 /vol/web

# switch to user
USER user