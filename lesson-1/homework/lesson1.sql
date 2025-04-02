/*Task 1:

1. Data refers to raw facts, figures, or values that are collected and stored. It can come in various forms, such as numbers, text, images, or sounds. Data itself has no meaning until it is processed or interpreted in a specific context.
2. A database is a structured collection of data that is stored and managed in a way that makes it easy to access, manipulate, and update. A database can hold large amounts of data and is often organized into tables, rows, and columns. Databases can store various types of data, such as text, numbers, images, and files, and can be queried using SQL to retrieve or manipulate data.
3. A relational database is a type of database that stores data in a structured format, using tables (also known as relations) that are related to each other. The relational model organizes data into rows and columns, and each row represents a unique record while each column represents an attribute or field of that record.
4. A table in a relational database is a collection of related data organized in rows and columns. Each table stores data for a specific entity or subject, such as customers, products, orders, etc.*/

/*Task 2:

1. Security: Security: Robust authentication, encryption, and role-based access control.
2. High Availability and Disaster Recovery: Features like Always On Availability Groups and failover clustering.
3. Scalability and Performance: Indexing, partitioning, and in-memory OLTP for performance optimization.
4. Data Integration and Analysis: Tools like SSIS, SSRS, and SSAS for integrating and analyzing data.
5. T-SQL (Transact-SQL): Extended SQL language with procedural programming capabilities.*/

/*Task 3:

1. Windows Authentication Mode: Uses Windows login credentials to authenticate users.
2. SQL Server Authentication Mode: Uses SQL Server-specific credentials to authenticate users..*/

Task 4: 
create database SchoolDB


Task 5:
create table Students (
StudentID int, 
Name varchar(50),
Age int 
);


/*Task 6:

* SQL Server is the database management system (DBMS) that stores and processes data.
* SSMS is the management tool used to interact with and manage SQL Server instances through a graphical interface.
* SQL is the language used to query, modify, and manage the data within a relational database system like SQL Server.
 (These three work together to help users design, query, and manage databases effectively.) */


/*Task 7:

DQL - Querying data from a database(SELECT) example: SELECT * FROM Students;
DML - Manipulating data in a database(INSERT, UPDATE, DELETE) example: INSERT INTO Students (StudentID, Name, Age) VALUES (1, 'John', 19);
DDL - Defining and modifying database structure(CREATE, ALTER, DROP, TRUNCATE) example: CREATE TABLE Students (StudentsID int,name varchar(50),Age int);
DCL - Controlling access to data(GRANT, REVOKE) example: REVOKE INSERT ON employees FROM user1;
TCL - Managing database transactions(COMMIT, ROLLBACK, SAVEPOINT) example: COMMIT; */


Task 8:  
INSERT INTO Students (StudentID,Name, Age) 
VALUES (1, 'John', 19),
(2, 'Sam', 22),
(3, 'Thomas', 20);


SELECT * FROM Students

DROP TABLE Students 

/*Task 9:

1. Open SSMS and connect to the SQL Server instance where you want to restore SchoolDB.
2. In the Object Explorer, right-click on the Databases node and select Restore Database.
3. In the Restore Database window:
   * Choose the Device option and click the Browse button to locate the backup file (e.g., C:\Backups\SchoolDB.bak).
   * Select the backup file and click OK.
4. Under the Destination section, verify that the Database field has SchoolDB selected*\


