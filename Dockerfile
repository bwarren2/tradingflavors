FROM python:3.8-slim

RUN apt-get update -y && apt-get install -y \
  libpq-dev gcc \
  && apt-get clean

RUN mkdir /code
WORKDIR /code
COPY requirements/ /code/requirements/
RUN pip install -r requirements/prod.txt
COPY . /code/

ENV PORT 8080

# Setting this ensures print statements and log messages
# promptly appear in Cloud Logging.
ENV PYTHONUNBUFFERED TRUE

# Run the web service on container startup. Here we use the gunicorn
# webserver, with one worker process and 8 threads.
# For environments with multiple CPU cores, increase the number of workers
# to be equal to the cores available.
CMD exec gunicorn --bind 0.0.0.0:$PORT --workers 1 --threads 8 --timeout 0 tradingflavors.tradingflavors.wsgi:application
