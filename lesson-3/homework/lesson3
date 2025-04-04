--Task 1:
BULK INSERT homework
FROM 'C:\Users\Murodbek\Downloads\Telegram Desktop\Customers.csv'
WITH (
firstrow = 2,
rowterminator = '\n',
fieldterminator = ','
)

--Task 2:
--Exporting Data (Excel, Text, XML, JSON)

--Task 3:

CREATE TABLE Product (
ID INT IDENTITY(1, 1),
Name VARCHAR(50),
Price DECIMAL(10,2)
)

--Task 4:

INSERT INTO Product 
VALUES ('Banana', 600),	
('Orange', 300),
('Apple', 420);

SELECT * FROM Product
DROP TABLE Product

--Task 5:

CREATE TABLE NullDemo(ID int, Name varchar(50) NULL )
SELECT * FROM NullDemo
INSERT INTO NullDemo (ID) 
VALUES (1)

CREATE TABLE NotNullDemo(
ID int, 
Name varchar(50) NOT NULL 
)

--Task 6:
ALTER TABLE Product
ADD CONSTRAINT Name UNIQUE (Name);

--Task 7:
-- This query updates the price of a product with ID = 5
UPDATE Products
SET Price = 180
WHERE ProductID = 2;


--Task 8:
CREATE TABLE Categories (
	CategoryID INT IDENTITY(1, 1),
	CategoryName VARCHAR(50) UNIQUE
	)

--Task 9:
CREATE TABLE Product (
ID INT IDENTITY(1, 1),
Name VARCHAR(50),
Price DECIMAL(10,2)
)
SELECT * FROM Product

--Task 10:
BULK INSERT [dbo].[Customers]
FROM 'C:\Users\Murodbek\Downloads\Telegram Desktop\Customers.csv'
WITH 
(

--Task 11:





--Task 12:

--PRIMARY KEY:

--A PRIMARY KEY uniquely identifies each record in a table.
--Every table can have only one primary key.
--The primary key column(s) cannot have NULL values.

--UNIQUE KEY:

--A UNIQUE KEY also ensures that all values in the column(s) are unique.
--A table can have multiple UNIQUE keys (you can have multiple UNIQUE constraints on different columns).
--Unlike the PRIMARY KEY, a UNIQUE KEY can allow NULL values (depending on the DBMS)

--Task 13:
ALTER TABLE Product
ADD CONSTRAINT Price
CHECK (Price > 0);

--Task 14:
ALTER TABLE Product
ADD Stock INT NOT NULL DEFAULT 0;

--Task 15:
UPDATE Product
SET Stock = ISNULL(Stock, 0);

--Task 16:
--FOREIGN KEY constraints are essential for maintaining referential integrity between tables in SQL Server.

--They help ensure that relationships between data in different tables are valid and that changes in the parent table are reflected in the child table.

--You can configure how updates and deletions in the parent table should affect the child table using actions like CASCADE, SET NULL, NO ACTION, or RESTRICT.


--Task 17:
CREATE TABLE Customers1 (
ID INT IDENTITY(1, 1),
Name VARCHAR(50),
Age INT
)
 
ALTER TABLE Customers1
ADD CONSTRAINT Age
CHECK (Age > 18);

--Task 18:
CREATE TABLE Customers2 (
	ID INT IDENTITY(100, 10),
	Name VARCHAR(50)
)

--Task 19:
CREATE TABLE OrderDetails(
	OrderDetailID INT IDENTITY(1,1),
	OrdersName VARCHAR(50)
)

--Task 21:
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY, 
	Email VARCHAR(50) UNIQUE
	)
