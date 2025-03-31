create database SchoolDB

create table Students (
StudentID int, 
Name varchar(50),
Age int 
);

INSERT INTO Students (StudentID,Name, Age) 
VALUES (1, 'John', 19),
(2, 'Sam', 22),
(3, 'Thomas', 20);


SELECT * FROM Students

DROP TABLE Students 
