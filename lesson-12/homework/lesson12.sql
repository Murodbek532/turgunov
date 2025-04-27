create database LEsson_12

--Task 1:
Create table Person (personId int, firstName varchar(255), lastName varchar(255))
Create table Address (addressId int, personId int, city varchar(255), state varchar(255))
Truncate table Person
insert into Person (personId, lastName, firstName) values ('1', 'Wang', 'Allen')
insert into Person (personId, lastName, firstName) values ('2', 'Alice', 'Bob')
Truncate table Address
insert into Address (addressId, personId, city, state) values ('1', '2', 'New York City', 'New York')
insert into Address (addressId, personId, city, state) values ('2', '3', 'Leetcode', 'California')

SELECT p.PersonID, p.firstName, a.City, a.State
FROM Person p
LEFT JOIN Address a ON p.PersonID = a.PersonID;


--TAsk 2:
Create table Employee (id int, name varchar(255), salary int, managerId int)
Truncate table Employee
insert into Employee (id, name, salary, managerId) values ('1', 'Joe', '70000', '3')
insert into Employee (id, name, salary, managerId) values ('2', 'Henry', '80000', '4')
insert into Employee (id, name, salary, managerId) values ('3', 'Sam', '60000', NULL)
insert into Employee (id, name, salary, managerId) values ('4', 'Max', '90000', NULL)

SELECT e.name, e.Salary, m.name AS ManagerName, m.Salary AS ManagerSalary
FROM Employee e
JOIN Employee m ON e.ManagerID = m.id
WHERE e.Salary > m.Salary;


--Task 3:
Create table If Not Exists Person (id int, email varchar(255)) 
Truncate table Person 
insert into Person (id, email) values ('1', 'a@b.com') 
insert into Person (id, email) values ('2', 'c@d.com') 
insert into Person (id, email) values ('3', 'a@b.com')

SELECT Users.email, Orders.orderID
FROM Users
JOIN Orders ON Users.userID = Orders.userID;

SELECT DISTINCT email
FROM Emails;

SELECT email, COUNT(*)
FROM Emails
GROUP BY email;


--Task 4:
DELETE FROM Emails
WHERE Id > (SELECT MIN(Id) FROM Emails WHERE Email = 'john@example.com')
  AND Email = 'john@example.com';


--Task 5:
CREATE TABLE boys (
    Id INT PRIMARY KEY,
    name VARCHAR(100),
    ParentName VARCHAR(100)
);

CREATE TABLE girls (
    Id INT PRIMARY KEY,
    name VARCHAR(100),
    ParentName VARCHAR(100)
);

INSERT INTO boys (Id, name, ParentName) 
VALUES 
(1, 'John', 'Michael'),  
(2, 'David', 'James'),   
(3, 'Alex', 'Robert'),   
(4, 'Luke', 'Michael'),  
(5, 'Ethan', 'David'),    
(6, 'Mason', 'George');  


INSERT INTO girls (Id, name, ParentName) 
VALUES 
(1, 'Emma', 'Mike'),  
(2, 'Olivia', 'James'),  
(3, 'Ava', 'Robert'),    
(4, 'Sophia', 'Mike'),  
(5, 'Mia', 'John'),      
(6, 'Isabella', 'Emily'),
(7, 'Charlotte', 'George');


SELECT DISTINCT g.ParentName
FROM girls g
LEFT JOIN boys b ON g.ParentName = b.ParentName
WHERE b.ParentName IS NULL;


--Task 6:
SELECT 
    o.CustomerID,
    SUM(o.SalesAmount) AS TotalSales,
    MIN(o.Weight) AS LeastWeight
FROM 
    Sales.Orders o
WHERE 
    o.Weight > 50
GROUP BY 
    o.CustomerID;


--Task 7:
DROP TABLE IF EXISTS Cart1;
DROP TABLE IF EXISTS Cart2;
GO

CREATE TABLE Cart1
(
Item  VARCHAR(100) PRIMARY KEY
);
GO

CREATE TABLE Cart2
(
Item  VARCHAR(100) PRIMARY KEY
);
GO

INSERT INTO Cart1 (Item) VALUES
('Sugar'),('Bread'),('Juice'),('Soda'),('Flour');
GO

INSERT INTO Cart2 (Item) VALUES
('Sugar'),('Bread'),('Butter'),('Cheese'),('Fruit');
GO

SELECT Item
FROM Cart1
INTERSECT
SELECT Item
FROM Cart2;


--Task 8:
create table match1 (MatchID int, Match varchar(30), Score varchar(5))
insert into match1 values 
		      (1,'Italy-Spain','2:0'),
              (2,'Spain-France','2:1'),
              (3,'France-Belgium','0:0'),
              (4,'Belgium-Spain','2:2'),
              (5,'Belgium-Italy','0:3'),
              (6,'Italy-France','2:0');


SELECT 
    Match,
    CASE 
        WHEN CAST(SUBSTRING(Score, 1, CHARINDEX(':', Score) - 1) AS INT) > CAST(SUBSTRING(Score, CHARINDEX(':', Score) + 1, LEN(Score)) AS INT) THEN 
            SUBSTRING(Match, 1, CHARINDEX('-', Match) - 1) 
        WHEN CAST(SUBSTRING(Score, 1, CHARINDEX(':', Score) - 1) AS INT) < CAST(SUBSTRING(Score, CHARINDEX(':', Score) + 1, LEN(Score)) AS INT) THEN 
            SUBSTRING(Match, CHARINDEX('-', Match) + 1, LEN(Match)) 
        ELSE 
            'Draw' 
    END AS Result
FROM match1;


--Task 9:
Create table Customers (id int, name varchar(255))
Create table Orders (id int, customerId int)
Truncate table Customers
insert into Customers (id, name) values ('1', 'Joe')
insert into Customers (id, name) values ('2', 'Henry')
insert into Customers (id, name) values ('3', 'Sam')
insert into Customers (id, name) values ('4', 'Max')
Truncate table Orders
insert into Orders (id, customerId) values ('1', '3')
insert into Orders (id, customerId) values ('2', '1')

SELECT c.id, c.name
FROM Customers c
LEFT JOIN Orders o ON c.id = o.customerId
WHERE o.id IS NULL;


--TAsk 10:
Create table Students (student_id int, student_name varchar(20))
Create table Subjects (subject_name varchar(20))
Create table Examinations (student_id int, subject_name varchar(20))
Truncate table Students
insert into Students (student_id, student_name) values ('1', 'Alice')
insert into Students (student_id, student_name) values ('2', 'Bob')
insert into Students (student_id, student_name) values ('13', 'John')
insert into Students (student_id, student_name) values ('6', 'Alex')
Truncate table Subjects
insert into Subjects (subject_name) values ('Math')
insert into Subjects (subject_name) values ('Physics')
insert into Subjects (subject_name) values ('Programming')
Truncate table Examinations
insert into Examinations (student_id, subject_name) values ('1', 'Math')
insert into Examinations (student_id, subject_name) values ('1', 'Physics')
insert into Examinations (student_id, subject_name) values ('1', 'Programming')
insert into Examinations (student_id, subject_name) values ('2', 'Programming')
insert into Examinations (student_id, subject_name) values ('1', 'Physics')
insert into Examinations (student_id, subject_name) values ('1', 'Math')
insert into Examinations (student_id, subject_name) values ('13', 'Math')
insert into Examinations (student_id, subject_name) values ('13', 'Programming')
insert into Examinations (student_id, subject_name) values ('13', 'Physics')
insert into Examinations (student_id, subject_name) values ('2', 'Math')
insert into Examinations (student_id, subject_name) values ('1', 'Math')

SELECT s.student_name AS StudentName,
       sub.subject_name AS SubjectName,
       COUNT(e.subject_name) AS ExamCount
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
GROUP BY s.student_name, sub.subject_name
ORDER BY s.student_name, sub.subject_name;
