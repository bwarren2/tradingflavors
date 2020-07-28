FROM python:3
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
COPY requirements/ /code/requirements/
RUN pip install -r requirements/prod.txt
COPY . /code/
CMD python tradingflavors/manage.py runserver 0.0.0.0:8000
