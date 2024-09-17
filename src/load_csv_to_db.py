import sqlite3
import csv

# Connect to the SQLite database
conn = sqlite3.connect('/quiz.db')
cursor = conn.cursor()

# Read the CSV file and insert data into the users table
with open('/src/users.csv', 'r') as file:
    reader = csv.DictReader(file)
    for row in reader:
        cursor.execute("INSERT INTO users (user, pass, type) VALUES (?, ?, ?)", (row['user'], row['pass'], "admin"))

# Commit the transaction and close the connection
conn.commit()
conn.close()