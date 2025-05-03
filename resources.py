from flask import jsonify, session
from flask_restful import Resource, reqparse
from datetime import datetime
import hashlib
from app import conn

# Move all Resource classes here
class UserLogin(Resource):
    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('username', required=True)
        parser.add_argument('password', required=True)
        args = parser.parse_args()

        username = args['username']
        password = args['password']
        input_pwd_hash = hashlib.sha256(password.encode('utf-8')).hexdigest()

        cursor = conn.cursor()
        query = 'SELECT pwd FROM user WHERE username=%s'
        cursor.execute(query, username)
        data = cursor.fetchone()
        cursor.close()

        if not data:
            return {'error': 'Invalid credentials'}, 401

        db_password = data['pwd']
        db_pwd_hash = hashlib.sha256(db_password.encode('utf-8')).hexdigest()

        if input_pwd_hash == db_pwd_hash:
            session['name'] = username
            return {'message': 'Login successful'}, 200
        else:
            return {'error': 'Invalid credentials'}, 401

class UserRegister(Resource):
    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('username', required=True)
        parser.add_argument('password', required=True)
        parser.add_argument('fname', required=True)
        parser.add_argument('lname', required=True)
        parser.add_argument('nickname', required=True)
        args = parser.parse_args()

        cursor = conn.cursor()
        query = 'SELECT * FROM user WHERE username = %s'
        cursor.execute(query, (args['username']))
        data = cursor.fetchone()

        if data:
            return {'error': 'User already exists'}, 400

        loginStats = datetime.utcnow().strftime('%Y-%m-%d')
        ins = 'INSERT INTO user VALUES(%s, %s, %s, %s, %s, %s)'
        cursor.execute(ins, (args['username'], args['password'], args['fname'], 
                           args['lname'], loginStats, args['nickname']))
        conn.commit()
        cursor.close()
        return {'message': 'User created successfully'}, 201

class SongList(Resource):
    def get(self):
        cursor = conn.cursor()
        query = '''SELECT songID, title, fname, lname, genre, releaseDate, songURL, aves
                  FROM song NATURAL JOIN aveRate NATURAL JOIN songGenre 
                  NATURAL JOIN artist NATURAL JOIN artistPerformsSong'''
        cursor.execute(query)
        songs = cursor.fetchall()
        cursor.close()
        return jsonify(songs)

class Song(Resource):
    def get(self, song_id):
        cursor = conn.cursor()
        query = '''SELECT songID, title, fname, lname, genre, releaseDate, songURL, aves
                  FROM song NATURAL JOIN aveRate NATURAL JOIN songGenre 
                  NATURAL JOIN artist NATURAL JOIN artistPerformsSong
                  WHERE songID = %s'''
        cursor.execute(query, (song_id))
        song = cursor.fetchone()
        cursor.close()
        
        if not song:
            return {'error': 'Song not found'}, 404
        return jsonify(song)

class PlaylistList(Resource):
    def get(self):
        if 'name' not in session:
            return {'error': 'Not logged in'}, 401
            
        username = session['name']
        cursor = conn.cursor()
        query = 'SELECT * FROM playlist WHERE username=%s'
        cursor.execute(query, username)
        playlists = cursor.fetchall()
        cursor.close()
        return jsonify(playlists)

    def post(self):
        if 'name' not in session:
            return {'error': 'Not logged in'}, 401

        parser = reqparse.RequestParser()
        parser.add_argument('title', required=True)
        parser.add_argument('description', required=True)
        args = parser.parse_args()

        username = session['name']
        create_date = datetime.utcnow().strftime('%Y-%m-%d')

        cursor = conn.cursor()
        query = 'SELECT * FROM playlist WHERE username=%s AND title=%s'
        cursor.execute(query, (username, args['title']))
        if cursor.fetchone():
            cursor.close()
            return {'error': 'Playlist already exists'}, 400

        query = 'INSERT INTO playlist VALUES(%s, %s, %s, %s)'
        cursor.execute(query, (args['title'], username, create_date, args['description']))
        conn.commit()
        cursor.close()
        return {'message': 'Playlist created successfully'}, 201

class PlaylistSongs(Resource):
    def get(self, playlist_title):
        """Get all songs in a playlist"""
        if 'name' not in session:
            return {'error': 'Not logged in'}, 401
            
        username = session['name']
        cursor = conn.cursor()
        query = '''SELECT song.songID, song.title 
                  FROM songInList JOIN song ON song.songID=songInList.songID 
                  WHERE songInList.username=%s AND songInList.title=%s'''
        cursor.execute(query, (username, playlist_title))
        songs = cursor.fetchall()
        cursor.close()
        return jsonify(songs)

    def post(self, playlist_title):
        """Add a song to a playlist"""
        if 'name' not in session:
            return {'error': 'Not logged in'}, 401

        parser = reqparse.RequestParser()
        parser.add_argument('song_id', required=True, type=int)
        args = parser.parse_args()

        username = session['name']
        cursor = conn.cursor()
        
        # Check if song already in playlist
        query = 'SELECT * FROM songInList WHERE songID=%s AND username=%s AND title=%s'
        cursor.execute(query, (args['song_id'], username, playlist_title))
        if cursor.fetchone():
            cursor.close()
            return {'error': 'Song already in playlist'}, 400

        # Add song to playlist
        query = 'INSERT INTO songInList VALUES(%s, %s, %s)'
        cursor.execute(query, (args['song_id'], playlist_title, username))
        conn.commit()
        cursor.close()
        return {'message': 'Song added to playlist'}, 201

class SongRating(Resource):
    def post(self, song_id):
        """Rate a song"""
        if 'name' not in session:
            return {'error': 'Not logged in'}, 401

        parser = reqparse.RequestParser()
        parser.add_argument('stars', required=True, type=float)
        args = parser.parse_args()

        if args['stars'] < 0 or args['stars'] > 5:
            return {'error': 'Rating must be between 0 and 5'}, 400

        username = session['name']
        date = datetime.utcnow().strftime('%Y-%m-%d')
        
        cursor = conn.cursor()
        # Check if rating exists
        query = 'SELECT * FROM rateSong WHERE username=%s AND songID=%s'
        cursor.execute(query, (username, song_id))
        existing_rating = cursor.fetchone()

        if existing_rating:
            # Update existing rating
            query = 'UPDATE rateSong SET stars=%s, ratingDate=%s WHERE username=%s AND songID=%s'
            cursor.execute(query, (args['stars'], date, username, song_id))
        else:
            # Create new rating
            query = 'INSERT INTO rateSong VALUES(%s, %s, %s, %s)'
            cursor.execute(query, (username, song_id, args['stars'], date))
            
        conn.commit()
        cursor.close()
        return {'message': 'Rating saved successfully'}, 200

class FriendList(Resource):
    def get(self):
        """Get user's friends list"""
        if 'name' not in session:
            return {'error': 'Not logged in'}, 401
            
        username = session['name']
        cursor = conn.cursor()
        query = '''SELECT user1 as username, fname, lname, requestSentBy 
                  FROM (friend JOIN user on friend.user1=user.username) 
                  WHERE friend.user2 = %s AND acceptStatus="Accepted" 
                  UNION
                  SELECT user2, fname, lname, requestSentBy 
                  FROM (friend JOIN user on friend.user2=user.username) 
                  WHERE friend.user1 = %s AND acceptStatus="Accepted"'''
        cursor.execute(query, (username, username))
        friends = cursor.fetchall()
        cursor.close()
        return jsonify(friends)

    def post(self):
        """Send friend request"""
        if 'name' not in session:
            return {'error': 'Not logged in'}, 401

        parser = reqparse.RequestParser()
        parser.add_argument('friend_username', required=True)
        args = parser.parse_args()

        username = session['name']
        friend = args['friend_username']
        current_time = datetime.utcnow()

        cursor = conn.cursor()
        # Check if request already exists
        query = '''SELECT * FROM friend 
                  WHERE (user1=%s AND user2=%s) OR (user1=%s AND user2=%s)'''
        cursor.execute(query, (username, friend, friend, username))
        if cursor.fetchone():
            cursor.close()
            return {'error': 'Friend request already exists'}, 400

        # Send friend request
        query = "INSERT INTO friend VALUES(%s, %s, 'Pending', %s, %s, %s)"
        cursor.execute(query, (username, friend, username, current_time, current_time))
        conn.commit()
        cursor.close()
        return {'message': 'Friend request sent'}, 201

class FriendRequest(Resource):
    def get(self):
        """Get pending friend requests"""
        if 'name' not in session:
            return {'error': 'Not logged in'}, 401
            
        username = session['name']
        cursor = conn.cursor()
        query = '''SELECT user1 as username, fname, lname, requestSentBy 
                  FROM (friend JOIN user on friend.user1=user.username) 
                  WHERE friend.user2 = %s AND acceptStatus="Pending"'''
        cursor.execute(query, username)
        requests = cursor.fetchall()
        cursor.close()
        return jsonify(requests)

    def put(self, request_id):
        """Accept/Reject friend request"""
        if 'name' not in session:
            return {'error': 'Not logged in'}, 401

        parser = reqparse.RequestParser()
        parser.add_argument('action', required=True, choices=('accept', 'reject'))
        args = parser.parse_args()

        username = session['name']
        current_time = datetime.utcnow()

        cursor = conn.cursor()
        status = "Accepted" if args['action'] == 'accept' else "Not accepted"
        query = 'UPDATE friend SET acceptStatus=%s, updatedAt=%s WHERE user1=%s AND user2=%s'
        cursor.execute(query, (status, current_time, request_id, username))
        conn.commit()
        cursor.close()
        return {'message': f'Friend request {args["action"]}ed'}, 200

class SongReview(Resource):
    def get(self, song_id):
        """Get reviews for a song"""
        cursor = conn.cursor()
        query = '''SELECT username, reviewText, reviewDate 
                  FROM reviewSong WHERE songID=%s 
                  ORDER BY reviewDate DESC'''
        cursor.execute(query, song_id)
        reviews = cursor.fetchall()
        cursor.close()
        return jsonify(reviews)

    def post(self, song_id):
        """Add or update a review"""
        if 'name' not in session:
            return {'error': 'Not logged in'}, 401

        parser = reqparse.RequestParser()
        parser.add_argument('review_text', required=True)
        args = parser.parse_args()

        username = session['name']
        date = datetime.utcnow().strftime('%Y-%m-%d')

        cursor = conn.cursor()
        # Check if review exists
        query = 'SELECT * FROM reviewSong WHERE username=%s AND songID=%s'
        cursor.execute(query, (username, song_id))
        if cursor.fetchone():
            # Update existing review
            query = 'UPDATE reviewSong SET reviewText=%s, reviewDate=%s WHERE username=%s AND songID=%s'
            cursor.execute(query, (args['review_text'], date, username, song_id))
        else:
            # Create new review
            query = 'INSERT INTO reviewSong VALUES(%s, %s, %s, %s)'
            cursor.execute(query, (username, song_id, args['review_text'], date))
        
        conn.commit()
        cursor.close()
        return {'message': 'Review saved successfully'}, 200

class UserProfile(Resource):
    def get(self, username):
        """Get user profile"""
        cursor = conn.cursor()
        query = 'SELECT username, fname, lname, nickname FROM user WHERE username=%s'
        cursor.execute(query, username)
        profile = cursor.fetchone()
        if not profile:
            return {'error': 'User not found'}, 404
        cursor.close()
        return jsonify(profile)
