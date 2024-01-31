ALTER TABLE hasGenre
ADD CONSTRAINT hasgenre_pk
PRIMARY KEY (movie_id, genre_id);

ALTER TABLE hasKeyword
ADD CONSTRAINT haskeyword_pk
PRIMARY KEY (movie_id, keyword_id);

ALTER TABLE belongsTocollection
ADD CONSTRAINT bcollection_pk
PRIMARY KEY (movie_id, collection_id);

ALTER TABLE hasproductioncompany
ADD CONSTRAINT hpcompany_pk
PRIMARY KEY (movie_id, pc_id);

ALTER TABLE Ratings
ADD CONSTRAINT bcollection_pk
PRIMARY KEY (movie_id, user_id);
