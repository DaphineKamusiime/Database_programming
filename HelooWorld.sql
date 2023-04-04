--privileges
SHOW GRANT for 'User'@'loacalhost' IDENTIFIED by 'password';-- show privilege of other user
SHOW GRANT --admin

GRANT SELECT ON *.* TO 'User@localhost';

GRANT UPDATE(column) ON myDb.table_name TO 'User@localhost';--for a particular column

GRANT ALL PRIVILEGES ON *.* to 'User@localhost' WITH GRANT OPTION;--granting privileges to other user


GRANT INSERT ON *.* TO 'User@localhost';
REVOKE INSERT ON myDb.table FROM 'User@localhost';--revokig a privilege

--creating a user
CREATE USER 'User'@'localhost' IDENTIFIED BY 'password';

--showing available users 
SELECT USER,HOST FROM mysql.user;

--removing a user
DROP USER 'User@localhost';

--renaming tables
RENAME TABLE table_name TO new_name;

ALTER DATABASE myDb READONLY=1;--enable read-only-mode

ALTER DATABASE myDb READONLY=0;--disable read-only-mod
--showing available databases
SHOW DATABASE;

--delete a DATABASE
DROP database;

CREATE DATABASE record_company;

USE record_company;
CREATE TABLE bands(
	id INT NOT NULL auto_increment,
	name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE albums(
	id INT NOT NULL auto_increment,
    name VARCHAR(25) NOT NULL,
    release_year INT,
    band_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (band_id) REFERENCES bands(id)
);
INSERT INTO bands (name)
VALUES ('Iron Maiden');

INSERT INTO bands(name)
VALUES ('Deuce'),('Avenged Sevenfold'),('Ankor');

SELECT * FROM bands;

SELECT * FROM bands LIMIT 2;

SELECT name FROM bands;

SELECT id AS 'ID', name AS 'Band Name' FROM bands;

SELECT * FROM bands ORDER BY name;

INSERT INTO albums (name, release_year,band_id)
VALUES ('The Number of The Beasts',1985,1),
('Power Slave', 1984,1),
('Nightmare',2018,2),
('Nightmare',2010,3),
('Test Album', NULL,3);

SELECT * FROM albums;
			
SELECT DISTINCT name FROM albums;

UPDATE albums 
SET release_year=1982
WHERE id = 1;

SELECT * FROM albums WHERE name LIKE '%er%' OR band_id = 2;

SELECT * FROM albums WHERE release_year=1984 AND band_id = 1;

SELECT * FROM albums WHERE release_year IS NULL;

DELETE FROM albums WHERE id =5 ;

SELECT * FROM albums;

SELECT * FROM bands 
JOIN albums ON bands.id = albums.band_id;

SELECT * FROM bands 
INNER JOIN albums ON bands.id = albums.band_id;

SELECT * FROM bands 
LEFT JOIN albums ON bands.id = albums.band_id;

SELECT * FROM bands 
RIGHT JOIN bands ON bands.id = albums.band_id;

SELECT SUM(release_year) FROM albums;

SELECT band_id, COUNT (band_id) FROM albums GROUP BY band_id;
 
SELECT b.name AS band_name, COUNT (a.id) AS num_albums FROM bands AS b
LEFT JOIN albums AS a ON b.id = a.band.id
WHERE num-albums =1
GROUP BY b.id;

SELECT b.name AS band_name, COUNT (a.id) AS num_albums FROM bands AS b
LEFT JOIN albums AS a ON b.id = a.band.id
GROUP BY b.id
HAVING num_albums = 1;

SELECT b.name AS band_name, COUNT (a.id) AS num_albums FROM bands AS b
LEFT JOIN albums AS a ON b.id = a.band.id
WHERE b.name = 'Deuce'
GROUP BY b.id
HAVING num_albums = 1;

ALTER TABLE orders ADD COLUMN order_date DATE;

--SAVING THE DATABASE
mysqldump -u user -p dbname > backupfile.sql

--'%' user can login from anywhere