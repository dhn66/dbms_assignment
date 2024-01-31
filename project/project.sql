------------------------------------------------------------------
					    Project
------------------------------------------------------------------

/*
  1.Αριθμός ταινιών ανά έτος (year, movies_per_year) 
    για ταινίες με συνολικό budget μεγαλύτερο από 1,000,000.
*/

SELECT YEAR(m.release_date) as year, COUNT(m.id) as movies_per_year
FROM movie m
WHERE m.budget > 1000000
GROUP BY year(m.release_date)
ORDER BY year(m.release_date)

----------------------------------------------------------------
/*
   2. Αριθμός ταινιών ανά είδος (genre, movies_per_genre) για ταινίες που έχουν συνολικό budget μεγαλύτερο από 1,000,000 ή διάρκεια μεγαλύτερη από 2 ώρες.

*/

SELECT g.name as genre, COUNT(m.id) as movies_per_genre
FROM movie m 
INNER JOIN hasGenre hg ON m.id = hg.movie_id
INNER JOIN Genre g ON g.id = hg.genre_id
WHERE m.budget > 1000000 OR m.runtime > 120
GROUP BY g.name
-----------------------------------------------------------------
/*
   3. Αριθμός ταινιών ανά είδος και ανά έτος (genre, year,movies_per_gy) .
*/

SELECT g.name as genre, YEAR(m.release_date) as year 
,COUNT(m.id) as movies_per_genre
FROM movie m 
INNER JOIN hasGenre hg ON m.id = hg.movie_id
INNER JOIN Genre g ON g.id = hg.genre_id
GROUP BY g.name ,YEAR(m.release_date)
ORDER BY YEAR(m.release_date)
-----------------------------------------------------------------
/*
  4.Για τον αγαπημένο σας ηθοποιό, το σύνολο των εσόδων
  (revenue) για τις ταινίες στις
  οποίες έχει συμμετάσχει ανά έτος (year, revenues_per_year)
*/

SELECT YEAR(m.release_date) as year, SUM(m.revenue) as revenue 
FROM movie m 
INNER JOIN movie_cast as mc ON m.id = mc.movie_id
WHERE mc.name = 'Antonio Banderas'
GROUP BY YEAR(m.release_date)
ORDER BY YEAR(m.release_date)
-----------------------------------------------------------------

/*
   5. Το υψηλότερο budget ταινίας ανά έτος (year, max_budget), όταν το budget αυτό δεν είναι μηδενικό.
*/

SELECT YEAR(m.release_date) as year, MAX(m.budget) as max_budget
FROM movie m 
WHERE m.budget != 0
GROUP BY YEAR(m.release_date)
ORDER BY YEAR(m.release_date)
-----------------------------------------------------------------
/*
   6. Τις συλλογές του πίνακα Collection που αναφέρονται σε τριλογίες, δηλαδή η συλλογή έχει ακριβώς 3 ταινίες (trilogy_name).
*/

SELECT c.name
FROM collection c
WHERE c.name LIKE '%Trilogy%'
-----------------------------------------------------------------
/*
   7. Για κάθε χρήστη του πίνακα Ratings, να επιστραφούν η μέση βαθμολογία του χρήστη και ο αριθμός των βαθμολογιών του (avg_rating, rating_count).
*/

SELECT r.user_id, AVG(r.rating) as avg_rating, COUNT(r.rating) as rating_count
FROM ratings r
GROUP BY r.user_id
ORDER BY r.user_id
-----------------------------------------------------------------

/*
  8.Οι 10 ταινίες με το υψηλότερο budget (movie_title, budget). Σε περίπτωση που έχουμε ισοβαθμία μεταξύ δύο ή περισσοτέρων ταινιών για την θέση 10 και μετά, να επιστραφεί μία από τις δύο.
*/

SELECT TOP (10) m.original_title, m.budget
FROM movie m
ORDER BY m.budget DESC









