FROM python:3.8-slim-buster
WORKDIR /src
COPY . .
RUN pip install --upgrade pip
RUN pip install flask
RUN pip install flask_httpauth
RUN pip install pandas

RUN apt-get update
RUN apt-get install -y sqlite3

# Copy the SQL script into the container
COPY src/quiz.sql /docker-entrypoint-initdb.d/quiz.sql
COPY src/users.csv src/users.csv
COPY src/load_csv_to_db.py load_csv_to_db.py
COPY src/quiz.db quiz.db

# Run the SQL script
RUN sqlite3 quiz.db < /docker-entrypoint-initdb.d/quiz.sql

EXPOSE 8080

ENV FLASK_APP=src/softdes

# Command to run the Flask application
CMD ["flask", "run", "--host=0.0.0.0", "--port=8080"]