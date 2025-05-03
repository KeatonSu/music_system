from flask import Flask
from flask_restful import Api
import pymysql.cursors

# Create the Flask application
app = Flask(__name__)
app.secret_key = "secret key"

# Configure app
UPLOAD_FOLDER = 'FlaskDemoPhotos'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
app.config['MAX_CONTENT_LENGTH'] = 16 * 1024 * 1024

# Create the API
api = Api(app)

# Configure MySQL
conn = pymysql.connect(host='localhost',
                      port = 8889,
                      user='root',
                      password='root',
                      db='try2',
                      charset='utf8mb4',
                      cursorclass=pymysql.cursors.DictCursor)

# Create aveRate view
with conn.cursor() as cursor:
    cursor.execute("DROP VIEW IF EXISTS aveRate")
    cursor.execute('''CREATE VIEW aveRate AS 
                    SELECT songID, AVG(stars) as aves
                    FROM song NATURAL JOIN rateSong 
                    GROUP BY songID''')
    conn.commit()

#include the routes
