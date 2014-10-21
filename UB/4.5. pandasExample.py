import pandas as pd
import numpy as np

def top_movies(dataFrame,usr):
    user= dataFrame[dataFrame.user_id == usr]
    max_i = user.rating.max()
    return user[user.rating == max_i].title

def compareTopMovies(data,usr1, usr2):
    movi1= top_movies(data,usr1).values
    movi2 = top_movies(data,usr2).values
    hits=np.intersect1d(movi1,movi2)
    return hits

def test():
	unames = ['user_id', 'gender', 'age', 'occupation', 'zip']
	users = pd.read_table('./ml-1m/users.dat', sep='::', header=None, names=unames, engine='python')
	rnames = ['user_id', 'movie_id', 'rating', 'timestamp']
	ratings = pd.read_table('./ml-1m/ratings.dat', sep='::', header=None, names=rnames,  engine='python')
	mnames = ['movie_id', 'title', 'genres']
	movies = pd.read_table('./ml-1m/movies.dat', sep='::', header=None, names=mnames,  engine='python')
	data = pd.merge(pd.merge(ratings, users), movies)
	#Top Movies for user 1
	print top_movies(data,1)
	#Compare TopMovies shared by two users:
	print compareTopMovies(data,1,2)