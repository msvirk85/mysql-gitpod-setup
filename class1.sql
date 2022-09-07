/*markdown
# Relational Database Class 1
*/

/*markdown
### Create a database name day1
*/

CREATE DATABASE day1;

/*markdown
### View the database
*/

SHOW DATABASES;

USE day1;

CREATE TABLE universities(name varchar(30), location varchar(30));

INSERT INTO universities (name) VALUES ('Ucalgary');
INSERT INTO universities VALUES ('UToronto', 'Toronto');
UPDATE universities SET location='Calgary' WHERE name='UCalgary';
INSERT INTO universities VALUES ('MRU', 'Calgary');
INSERT INTO universities VALUES ("St. Mary's", 'Calgary');
INSERT INTO universities VALUES ('UBC', 'Vancouver');

Select * FROM universities;

ALTER TABLE universities ADD COLUMN (id INT AUTO_INCREMENT PRIMARY KEY);
ALTER TABLE universities ADD COLUMN u_rank INT;
ALTER TABLE universities ADD COLUMN province varchar(30);
ALTER TABLE universities ADD COLUMN mcrank INT DEFAULT 0;

DELETE FROM universities WHERE name="MRU";
INSERT INTO universities  (name, location, u_rank, province, mcrank) VALUES ('MRU', 'Calgary', 5, 'AB', 7);
