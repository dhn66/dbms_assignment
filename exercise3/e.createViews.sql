CREATE VIEW Actor AS 
SELECT DISTINCT person_id, gender, name
FROM Movie_cast

CREATE VIEW CrewMember AS
SELECT DISTINCT person_id, gender, name
FROM Movie_crew

CREATE VIEW PERSON AS
SELECT person_id, gender, name
FROM Actor
UNION
SELECT person_id, gender, name
FROM CrewMember
