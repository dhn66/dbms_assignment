/*
1.Βρες τους τιτλους των γαλλοφωνων ταινιων και τις περιγραφες τους που ανοικουν στο ειδος Drama
Output: 321
*/

SELECT m.title,m.overview
FROM movie m 
INNER JOIN hasGenre hg ON m.id = hg.movie_id
INNER JOIN genre g ON g.id = hg.genre_id
WHERE g.name = 'Drama' AND m.original_language = 'fr'

/*
2.Βρες το ελαχιστο και το μεγιστο rating που εχουν παρει οι ταινιες καθε ειδους.
Output: 9
*/

SELECT g.name , min(r.rating) AS min_rating, max(r.rating) AS max_rating
FROM movie m 
INNER JOIN ratings r
ON m.id = r.movie_id
INNER JOIN hasGenre hg ON m.id = hg.movie_id
INNER JOIN Genre g ON g.id = hg.genre_id
GROUP BY g.name

/*
3. Βρες τους τιτλους ταινιων και την διαρκεια τους οι οποιες εχουν στο tagline τις λεξεις love ή war με φθινουσα σειρα.
Output: 723
*/

SELECT m.title,m.runtime
FROM movie m
WHERE m.tagline LIKE '%love%' OR m.tagline LIKE '%war%'
ORDER BY m.runtime DESC

/*
4.Βρες τον αριθμό των ταινιων που ανοικουν στο ειδος Drama και
εχουν κυκλοφορησει μεταξυ των ημερομηνιων '1980-01-01' και '2000-01-01'
Output: 1
*/

SELECT count(DISTINCT m.id) AS movie_number
FROM movie m 
INNER JOIN hasGenre hg ON m.id = hg.movie_id
INNER JOIN Genre g ON g.id = hg.genre_id
WHERE g.name = 'Drama'
AND m.release_date BETWEEN '1980-01-01' AND '2000-01-01'

/*
5.Βρες τους τιτλους και την βαμολογια των ταινιων που παιζει ο Al Pacino και εχουν rating μεγαλυτερο του 2.
Output: 28
*/

SELECT DISTINCT m.title,r.rating
FROM movie m
INNER JOIN ratings r ON m.id = r.movie_id
INNER JOIN movie_cast mv on m.id = mv.movie_id
WHERE r.rating > 2 AND mv.name = 'Al Pacino'

/*
6.Βρες τις ταινιες που εχουν βαθμολογια πανω απο 3
Output: 1265
*/

SELECT DISTINCT m.title
FROM movie m
INNER JOIN ratings r
ON m.id = r.movie_id
WHERE rating > 3

/*
7.Βρες τις ταινιες στις οποιες παιζει ο Antonio Banderas
Output: 33
*/

SELECT m.title
FROM movie m
INNER JOIN movie_cast mc
ON m.id = mc.movie_id
WHERE mc.name = 'Antonio Banderas'

/*
8. Οι ταινιες και το rating που εχουν διαρκεια πανω απο 80 λεπτα
και περιεχουν τα keywords boy ή girl σε φθινουσα σειρα.
Output: 54
*/

SELECT m.title,r.rating
FROM movie m 
INNER JOIN ratings r ON m.id = r.movie_id
INNER JOIN hasKeyword hk ON m.id = hk.movie_id
INNER JOIN keyword k ON hk.keyword_id = k.id
WHERE m.runtime > 80.0 AND (k.name = 'girl' OR k.name = 'boy')
ORDER BY r.rating DESC

/*
9. Το avg rating των ταινιων της δεκαετιας των 90' που εχουν
revenue μεγαλυτερο απο 10 εκ.
Output: 1
*/

SELECT avg(r.rating)
FROM movie m 
INNER JOIN ratings r
ON m.id = r.movie_id
WHERE m.release_date BETWEEN '1990-01-01' AND '1999-12-31'
AND m.revenue > 10000000

/*
10. Βρες τους πρωτους 10 τιτλους ταινιων,τo rating και την ημερομηνια 	κυκλοφοριας τους, οι οποιες εχουν στην περιγραφη τις λεξεις evil ή good .
Output: 10
*/

SELECT TOP(10) m.title,r.rating,m.release_date
FROM movie m
INNER JOIN ratings r ON m.id = r.movie_id
WHERE m.overview LIKE '%evil%' OR m.overview LIKE '%good%'

/*
11. Οι ταινιες οι οποιες εχουν budget μεγαλυτερο απο 20 εκ και 
rating = 4 
Output: 299
*/

SELECT DISTINCT m.title,m.budget
FROM movie m
FULL OUTER JOIN ratings r ON m.id = r.movie_id
WHERE m.budget > 20000000 AND r.rating = 4

/*
12. Οι ταινιες me rating me rating > 3 , του ειδους comedy οι οποιες εχουν 2 φυλλα.
Output: 704
*/

SELECT DISTINCT m.title, g.name
FROM movie m 
INNER JOIN ratings r
ON m.id = r.movie_id
INNER JOIN hasGenre hg ON m.id = hg.movie_id
INNER JOIN Genre g ON g.id = hg.genre_id
FULL OUTER JOIN movie_cast mv on m.id = mv.movie_id
WHERE r.rating > 3 AND g.name = 'Drama' AND mv.gender = 2




