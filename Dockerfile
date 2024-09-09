FROM python:3.8-slim-buster
WORKDIR /src
COPY . .
RUN pip install --upgrade pip
RUN pip install flask
RUN pip install flask_httpauth


EXPOSE 8080

ENV FLASK_APP=src/softdes

CMD ["flask", "run", "--host=0.0.0.0", "--port=8080"]