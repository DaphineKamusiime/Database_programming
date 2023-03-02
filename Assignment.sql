--creating the database
create database StudentResults;

show databases;
use StudentResults;

--creating the tables students and grades
create table Students (id varchar(1), name varchar(20), date_of_birth date);

create table Grades (student_id char(1), Subject varchar(20), grade int);

--adding values to the tables
insert into Students(id,name,date_of_birth) values("1","Emma","2002-01-30"),('2','Sara','2003-12-26'),('3','Marie','2006-12-12');


insert into Grades(student_id,Subject,grade) values ('1','English',98),('2','SST',90),('3','Science',92),('4','Math',100);


--Select all columns from the "students" table.
select * from Students;


-- Alter the "grades" table to add a column "teacher" of data type varchar(50).
ALTER TABLE Grades ADD COLUMN teacher VARCHAR(50);

--Update the "grades" table to set the value of the "teacher" column to "Mr. Smith" for all rows.
UPDATE Grades SET teacher = 'Mr.Matsiko';


--. Delete all rows from the "grades" table where the grade is less than 60.
DELETE FROM Grades WHERE grade < 60;


-- Drop the "grades" table.
--DROP TABLE Grades;


--Insert a new row into the "students" table with values for "name" and "date_of_birth".
INSERT INTO Students (id,name, date_of_birth) VALUES ('4','Daphine','2002-09-01');


--Select all rows from the "students" table where the "name" column contains the string"John"
SELECT * FROM Students WHERE name LIKE '%Emma%';


-- Select all rows from the "students" table where the "date_of_birth" column is between
--'2000-01-01' and '2010-12-31', ordered by the "name" column in descending order
SELECT * FROM Students WHERE date_of_birth BETWEEN '2000-01-01' AND '2010-12-31' ORDER BY name DESC;


--Select all rows from the "grades" table where the "subject" column contains the string "Math".
SELECT * FROM Grades WHERE Subject LIKE '%Math%';


-- Set the "id" column of the "students" table as the primary key
ALTER TABLE Students ADD PRIMARY KEY (id);


--Set the "student_id" column of the "grades" table as the foreign key referencing the "id"
--column of the "students" table
ALTER TABLE Grades ADD FOREIGN KEY (student_id) REFERENCES Students(id);


--. Use a join to select the "name" and "subject" columns from the "students" and "grades"
--tables respectively, where the "grade" column in the "grades" table is greater than or
--equal to 80, using an equi join
SELECT Students.name, Grades.subject FROM Students INNER JOIN Grades ON Students.id = Grades.student_id WHERE Grades.grade >= 80;


-- Use a join to select the "name" and "subject" columns from the "students" and "grades"
--tables respectively, where the "grade" column in the "grades" table is less than 60, using a
--left outer join
SELECT Students.name, Grades.subject FROM Students LEFT OUTER JOIN Grades ON Students.id = Grades.student_id WHERE Grades.grade < 60;


--set a join to select the "name" and "subject" columns from the "students" and "grades"
--tables respectively, where the "subject" column in the "grades" table contains the string
--"Science", using a natural join.
SELECT name, subject FROM Students NATURAL JOIN Grades WHERE Subject LIKE '%Science%';


-- Use a join to select the "name" and "subject" columns from the "students" and "grades"
--tables respectively, where the "grade" column in the "grades" table is greater than or
--equal to 80, using a cross join

SELECT Students.name, Grades.subject FROM Students CROSS JOIN Grades WHERE Grades.grade >= 80;


--. Use a join to select the "name" and "subject" columns from the "students" and "grades"
--tables respectively, where the "grade" column in the "grades" table is less than 60, using a
--full outer join
SELECT Students.name, Grades.subject FROM Students FULL OUTER JOIN Grades ON Students.id = Grades.student_id AND Grades.grade < 60;


-- Use all the above features to retrieve the name, subject, and grade of all students who
--have a grade of 80 or higher in a subject that contains the string "Math", and whose date
--of birth is between '2000-01-01' and '2010-12-31', ordered by the "name" column in
--ascending order.
SELECT Students.name, Grades.subject, Grades.grade FROM Students JOIN Grades ON Students.id = Grades.student_id WHERE Grades.grade >= 80 AND Grades.Subject LIKE '%Math%' AND Students.date_of_birth BETWEEN '2000-01-01' AND '2010-12-31' ORDER BY Students.name ASC;

