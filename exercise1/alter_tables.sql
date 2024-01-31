/* CREATING PRIMARY KEYS */

ALTER TABLE movie
ADD CONSTRAINT movie_pk
PRIMARY KEY (id);

ALTER TABLE genre
ADD CONSTRAINT genre_pk
PRIMARY KEY (id);

ALTER TABLE productioncompany
ADD CONSTRAINT productioncompany_pk
PRIMARY KEY (id);

ALTER TABLE collection
ADD CONSTRAINT collection_pk
PRIMARY KEY (id);

ALTER TABLE movie_cast
ADD CONSTRAINT moviecast_pk
PRIMARY KEY (cid, person_id);

ALTER TABLE movie_crew
ADD CONSTRAINT moviecrew_pk
PRIMARY KEY (cid, person_id);

ALTER TABLE keyword
ADD CONSTRAINT keyword_pk
PRIMARY KEY (id);

ALTER TABLE ratings
ADD CONSTRAINT ratings_pk
PRIMARY KEY (user_id, movie_id);


/* CREATING FOREIGN KEYS */

ALTER TABLE belongsTocollection
ADD CONSTRAINT FK_collectionid FOREIGN KEY (collection_id)
REFERENCES collection(id);

ALTER TABLE belongsTocollection
ADD CONSTRAINT FK_collectionmovieid FOREIGN KEY (movie_id)
REFERENCES movie(id);

ALTER TABLE hasGenre
ADD CONSTRAINT FK_genreid FOREIGN KEY (genre_id)
REFERENCES genre(id);

ALTER TABLE hasGenre
ADD CONSTRAINT FK_genremovieid FOREIGN KEY (movie_id)
REFERENCES movie(id);

ALTER TABLE hasProductioncompany
ADD CONSTRAINT FK_pcid FOREIGN KEY (pc_id)
REFERENCES productioncompany(id);

ALTER TABLE hasProductioncompany
ADD CONSTRAINT FK_movieid FOREIGN KEY (movie_id)
REFERENCES movie(id);

ALTER TABLE haskeyword
ADD CONSTRAINT FK_keywordid FOREIGN KEY (keyword_id)
REFERENCES keyword(id);

ALTER TABLE haskeyword
ADD CONSTRAINT FK_keywordmovieid FOREIGN KEY (movie_id)
REFERENCES movie(id);

ALTER TABLE movie_crew
ADD CONSTRAINT FK_crewmovieid FOREIGN KEY (movie_id)
REFERENCES movie(id);

ALTER TABLE movie_cast
ADD CONSTRAINT FK_castmovieid FOREIGN KEY (movie_id)
REFERENCES movie(id);

ALTER TABLE ratings
ADD CONSTRAINT FK_ratingsmovieid FOREIGN KEY (movie_id)
REFERENCES movie(id);










