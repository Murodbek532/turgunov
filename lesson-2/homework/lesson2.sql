CREATE DATABASE Lesson_2

--Task 1: 
CREATE TABLE Employees (
EmpID int,
Name varchar(50),
Salary decimal(10,2)
);


--Task 2:
INSERT INTO Employees (EmpID, Name, Salary)
VALUES(1, 'Sam', 7600),
(2, 'Leo', 4200),
(3, 'Thomas', 5500),
(4, 'John', 6000),
(5, 'Alex', 3000);


--Task 3:
UPDATE Employees
SET Salary = 1300
WHERE EmpID = 1; 


--Task 4:
DELETE FROM Employees WHERE EmpID = 2;


/*Task 5:
DELETE - Removes specific rows based on a condition.
TRUNCATE - Removes all rows from the table.
DROP -Removes the entire table, structure and all data.
*/

--Task 6:
ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100);


--Task 7:
ALTER TABLE Employees
ADD Department VARCHAR(50);


--Task 8:
ALTER TABLE Employees
ALTER COLUMN Salary float;

SELECT * FROM Employees 
DROP TABLE Employees


--Task 9:
CREATE TABLE Departments(
DepartmentID int,
DepartmentName varchar(50)
);


--Task 10:
TRUNCATE TABLE Employees


--Task 11:
INSERT INTO Departments (DepartmentID, DepartmentName)
SELECT EmpID, Name FROM Employees;

SELECT * FROM Departments


--Task 12:
UPDATE Employees
SET Department = 'Managment'
WHERE Salary>5000

UPDATE Employees
SET Department = 'Credit'
WHERE Salary<5000


--Task 13:
DELETE FROM Employees;

--Task 14:
ALTER TABLE Employees
DROP COLUMN Department;

--Task 15:
EXEC sp_rename 'Employees', 'StaffMembers';
SELECT * FROM StaffMembers


--Task 16:
DROP TABLE Departments

--Task 17:
CREATE TABLE Products (
ProductID int,
ProductName varchar(50),
Category varchar(50),
Price decimal
);


--Task 18:
ALTER TABLE Products
ADD CONSTRAINT chk_price CHECK (Price > 0);


--Task 19:
ALTER TABLE Products
ADD StockQuantity INT DEFAULT 50;

--Task 20:
EXEC sp_rename 'Products.Category', 'ProductCategory';
SELECT * FROM Products

--Task 21:
INSERT INTO Products (ProductID, ProductName, ProductCategory, Price)
VALUES (1, 'Apple', 'Fruit', 10),
(2, 'Carrot', 'Vegetables', 6),
(3, 'Banana', 'Fruit', 20),
(4, 'Cucumber', 'Vegetables', 8),
(5, 'Tomato', 'Vegetables', 12);

--Task 22:
SELECT * INTO Products_Backup
FROM Products;

--Task 23:
EXEC sp_rename 'Products', 'Inventory';

--Task 24:
ALTER TABLE Inventory
ALTER COLUMN Price FLOAT;

--Task 25:
ALTER TABLE Inventory
ADD ProductCode INT IDENTITY(1000, 5);
