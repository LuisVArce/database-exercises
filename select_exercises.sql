USE albums_db;

SELECT count(*) FROM albums;
DESCRIBE albums;
SELECT count(DISTINCT(artist)) FROM albums;
SELECT * FROM albums;
SELECT MAX(release_date) FROM albums;
SELECT release_date FROM albums WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";
