-- CREATE DATABASE Test;
use Test;

CREATE TABLE Client_table(
clientno CHAR (6) PRIMARY KEY,
nam_e VARCHAR (20) NOT NULL,
City VARCHAR (50) NOT NULL,
Pin INT,
Mobile CHAR(10)
);

INSERT INTO Client_table(clientno,nam_e, City,Pin,Mobile)
VALUES ('C00001', 'Ivan Bayross', 'Bombay',400054,'3456212343'),('C00002','Vandana Saitwal','Madras',780001,'8976532322'),
('C00003', 'Pramada Jaguste','Bombay', 400007,'9090898765'),('C00004','Ravi Shreedharan','Delhi',110020,'8727121232'),
('C00005','Rukmani ','Kolkata',340003,'2312376543'),('C00006','Pradeep Singhania','Jaipur',130102,'1222132333'),
('C00007','George Paul','Kolkata',340010,'3323211232'),('C00008','D Ravichandran','Bombay',400014,'2212387896');

SELECT nam_e FROM Client_table WHERE nam_e LIKE '%van%';
SELECT * FROM Client_table WHERE City!='Bombay';
SELECT DISTINCT(City) FROM Client_table ;

CREATE TABLE Club(
Coachid INT  NOT NULL AUTO_INCREMENT PRIMARY KEY, 
Coachname VARCHAR(20),
Age INT ,
Sport VARCHAR (20),
Dateofapp VARCHAR(20),
Pay INT,
Gender CHAR(2));

INSERT INTO Club(Coachname,Age,Sport,Dateofapp,Pay,Gender)
VALUES ( 'Karan ', 35,'Karate','27/03/19',10000,'M'),
 ( 'Ravina', 34,'Karate','20/01/20',12000,'F'),
  ( 'Kamal ', 34,'Squash','19/02/20',20000,'M'),
   ( 'Tarun ', 33,'Basketball','1/01/20',15000,'M'),
    ( 'Sumeru', 36,'Swimming','12/01/20',7500,'M'),
     ( 'Anjani ', 36,'Swimming','24/02/20',8000,'F'),
	 ( 'Shamima', 37,'Squash','20/02/20',22000,'F'),
      ( 'Soumya ', 30,'Karate','22/02/20',11000,'F');