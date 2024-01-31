import numpy as np
import matplotlib.pyplot as plt
import psycopg2

# Update connection string information
host = "mysqlserver.database.windows.net"
dbname = "ExercisesDatabase"
user = "examiner@mysqlserver"
password = "Vaseis2023"
sslmode = "require"

# Construct connection string
conn_string = "host={0} user={1} dbname={2} password={3} sslmode={4}".format(host, user, dbname, password,sslmode)
conn = psycopg2.connect(conn_string)
print("Connection established")

cursor = conn.cursor()

#Query 1
def query1(cursor):
	
	cursor.execute("""
		SELECT YEAR(m.release_date) as year, COUNT(m.id) as movies_per_year
		FROM movie m
		WHERE m.budget > 1000000
		GROUP BY year(m.release_date)
		ORDER BY year(m.release_date)
		""")

	data = cursor.fetchall()
	data = np.array(data)
	
	plt.bar(data[0],data[1],color='g',linewidth=3.)
	plt.title('Query 1',color='r')
	plt.xlabel("year",color='r')
	plt.ylabel("movies_per_year",color='r')

	plt.show()

#Query 2 
def query2(cursor):

	cursor.execute("""
		SELECT g.name as genre, COUNT(m.id) as movies_per_genre
		FROM movie m 
		INNER JOIN hasGenre hg ON m.id = hg.movie_id
		INNER JOIN Genre g ON g.id = hg.genre_id
		WHERE m.budget > 1000000 OR m.runtime > 120
		GROUP BY g.name
		""")
	
	data = cursor.fetchall()
	data = np.array(data)

	plt.bar(data[0],data[1],color='g',linewidth=3.0)
	plt.title('Query 2',color='r')
	plt.xlabel("genre",color='r')	
	plt.ylabel("movies_per_genre",color='r')
	
	plt.show()

#Query 4
def query4(cursor):	

	cursor.execute("""
		SELECT YEAR(m.release_date) as year, SUM(m.revenue) as revenue 
		FROM movie m 
		INNER JOIN movie_cast as mc ON m.id = mc.movie_id
		WHERE mc.name = 'Antonio Banderas'
		GROUP BY YEAR(m.release_date)
		ORDER BY YEAR(m.release_date)
		""")
	
	data = cursor.fetchall()
	data = np.array(data)

	plt.bar(data[0],data[1],color='g',linewidth=3.)
	plt.title('Query 4',color='r')
	plt.xlabel("year",color='r')
	plt.ylabel("revenues_per_year",color='r')
	plt.show()

#Query 5
def query5(cursor):
	
	cursor.execute("""
		SELECT YEAR(m.release_date) as year, MAX(m.budget) as max_budget
		FROM movie m 
		WHERE m.budget != 0
		GROUP BY YEAR(m.release_date)
		ORDER BY YEAR(m.release_date)
		""")

	data = cursor.fetchall()
	data = np.array(data)

	plt.bar(data[0],data[1],color='g',linewidth=3.0)
	plt.title('Query 5',color='r')
	plt.xlabel("year",color='r')
	plt.ylabel("max_budget",color='r')
	plt.show()

#Query 7
def query7(cursor):

	cursor.execute("""
		SELECT r.user_id, AVG(r.rating) as avg_rating, COUNT(r.rating) as rating_count
		FROM ratings r
		GROUP BY r.user_id
		ORDER BY r.user_id
		""")

	data = cursor.fetchall()
	data = np.array(data)

	x  = data[0]
	y  = data[1]
	dz = data[2]

	dx = np.ones(len(x)) 
	dy = np.ones(len(x))  
	z = np.zeros(len(x))

	fig = plt.figure()

	ax = fig.add_subplot(111, projection='3d')

	ax.bar3d(x,y,z,dx,dy,dz,color='green')

	ax.set_xlabel("user id ",color='red')
	ax.set_ylabel("avg_rating",color='red')
	ax.set_zlabel("rating_count",color='red')
	ax.set_title("Query 7")

	plt.show()


#Function calling
query1(cursor)
query2(cursor)
query4(cursor)
query5(cursor)
query7(cursor)
