FROM python:3.8-buster

WORKDIR /

COPY app.py /
COPY Pipfile /
COPY Pipfile.lock /

RUN pip install pipenv
RUN pipenv install

ENTRYPOINT [ "python3" ]

CMD [ "app.py" ]
