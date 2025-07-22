
CREATE TABLE Numbers1(Number INT)

INSERT INTO Numbers1 VALUES (5),(9),(8),(6),(7)

CREATE TABLE FindSameCharacters
(
     Id INT
    ,Vals VARCHAR(10)
)
 
INSERT INTO FindSameCharacters VALUES
(1,'aa'),
(2,'cccc'),
(3,'abc'),
(4,'aabc'),
(5,NULL),
(6,'a'),
(7,'zzz'),
(8,'abc')



CREATE TABLE RemoveDuplicateIntsFromNames
(
      PawanName INT
    , Pawan_slug_name VARCHAR(1000)
)
 
 
INSERT INTO RemoveDuplicateIntsFromNames VALUES
(1,  'PawanA-111'  ),
(2, 'PawanB-123'   ),
(3, 'PawanB-32'    ),
(4, 'PawanC-4444' ),
(5, 'PawanD-3'  )





CREATE TABLE Example
(
Id       INTEGER IDENTITY(1,1) PRIMARY KEY,
String VARCHAR(30) NOT NULL
);


INSERT INTO Example VALUES('123456789'),('abcdefghi');


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    DepartmentID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, DepartmentID, FirstName, LastName, Salary) VALUES
(1, 1, 'John', 'Doe', 60000.00),
(2, 1, 'Jane', 'Smith', 65000.00),
(3, 2, 'James', 'Brown', 70000.00),
(4, 3, 'Mary', 'Johnson', 75000.00),
(5, 4, 'Linda', 'Williams', 80000.00),
(6, 2, 'Michael', 'Jones', 85000.00),
(7, 1, 'Robert', 'Miller', 55000.00),
(8, 3, 'Patricia', 'Davis', 72000.00),
(9, 4, 'Jennifer', 'García', 77000.00),
(10, 1, 'William', 'Martínez', 69000.00);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'Sales'),
(3, 'Marketing'),
(4, 'Finance'),
(5, 'IT'),
(6, 'Operations'),
(7, 'Customer Service'),
(8, 'R&D'),
(9, 'Legal'),
(10, 'Logistics');

CREATE TABLE Sales (
    SalesID INT PRIMARY KEY,
    EmployeeID INT,
    ProductID INT,
    SalesAmount DECIMAL(10, 2),
    SaleDate DATE
);
INSERT INTO Sales (SalesID, EmployeeID, ProductID, SalesAmount, SaleDate) VALUES
-- January 2025
(1, 1, 1, 1550.00, '2025-01-02'),
(2, 2, 2, 2050.00, '2025-01-04'),
(3, 3, 3, 1250.00, '2025-01-06'),
(4, 4, 4, 1850.00, '2025-01-08'),
(5, 5, 5, 2250.00, '2025-01-10'),
(6, 6, 6, 1450.00, '2025-01-12'),
(7, 7, 1, 2550.00, '2025-01-14'),
(8, 8, 2, 1750.00, '2025-01-16'),
(9, 9, 3, 1650.00, '2025-01-18'),
(10, 10, 4, 1950.00, '2025-01-20'),
(11, 1, 5, 2150.00, '2025-02-01'),
(12, 2, 6, 1350.00, '2025-02-03'),
(13, 3, 1, 2050.00, '2025-02-05'),
(14, 4, 2, 1850.00, '2025-02-07'),
(15, 5, 3, 1550.00, '2025-02-09'),
(16, 6, 4, 2250.00, '2025-02-11'),
(17, 7, 5, 1750.00, '2025-02-13'),
(18, 8, 6, 1650.00, '2025-02-15'),
(19, 9, 1, 2550.00, '2025-02-17'),
(20, 10, 2, 1850.00, '2025-02-19'),
(21, 1, 3, 1450.00, '2025-03-02'),
(22, 2, 4, 1950.00, '2025-03-05'),
(23, 3, 5, 2150.00, '2025-03-08'),
(24, 4, 6, 1700.00, '2025-03-11'),
(25, 5, 1, 1600.00, '2025-03-14'),
(26, 6, 2, 2050.00, '2025-03-17'),
(27, 7, 3, 2250.00, '2025-03-20'),
(28, 8, 4, 1350.00, '2025-03-23'),
(29, 9, 5, 2550.00, '2025-03-26'),
(30, 10, 6, 1850.00, '2025-03-29'),
(31, 1, 1, 2150.00, '2025-04-02'),
(32, 2, 2, 1750.00, '2025-04-05'),
(33, 3, 3, 1650.00, '2025-04-08'),
(34, 4, 4, 1950.00, '2025-04-11'),
(35, 5, 5, 2050.00, '2025-04-14'),
(36, 6, 6, 2250.00, '2025-04-17'),
(37, 7, 1, 2350.00, '2025-04-20'),
(38, 8, 2, 1800.00, '2025-04-23'),
(39, 9, 3, 1700.00, '2025-04-26'),
(40, 10, 4, 2000.00, '2025-04-29'),
(41, 1, 5, 2200.00, '2025-05-03'),
(42, 2, 6, 1650.00, '2025-05-07'),
(43, 3, 1, 2250.00, '2025-05-11'),
(44, 4, 2, 1800.00, '2025-05-15'),
(45, 5, 3, 1900.00, '2025-05-19'),
(46, 6, 4, 2000.00, '2025-05-23'),
(47, 7, 5, 2400.00, '2025-05-27'),
(48, 8, 6, 2450.00, '2025-05-31'),
(49, 9, 1, 2600.00, '2025-06-04'),
(50, 10, 2, 2050.00, '2025-06-08'),
(51, 1, 3, 1550.00, '2025-06-12'),
(52, 2, 4, 1850.00, '2025-06-16'),
(53, 3, 5, 1950.00, '2025-06-20'),
(54, 4, 6, 1900.00, '2025-06-24'),
(55, 5, 1, 2000.00, '2025-07-01'),
(56, 6, 2, 2100.00, '2025-07-05'),
(57, 7, 3, 2200.00, '2025-07-09'),
(58, 8, 4, 2300.00, '2025-07-13'),
(59, 9, 5, 2350.00, '2025-07-17'),
(60, 10, 6, 2450.00, '2025-08-01');

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    CategoryID INT,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, CategoryID, ProductName, Price) VALUES
(1, 1, 'Laptop', 1000.00),
(2, 1, 'Smartphone', 800.00),
(3, 2, 'Tablet', 500.00),
(4, 2, 'Monitor', 300.00),
(5, 3, 'Headphones', 150.00),
(6, 3, 'Mouse', 25.00),
(7, 4, 'Keyboard', 50.00),
(8, 4, 'Speaker', 200.00),
(9, 5, 'Smartwatch', 250.00),
(10, 5, 'Camera', 700.00);


--Task 1:
WITH Numbers AS (
    SELECT 1 AS num
    UNION ALL
    SELECT num + 1
    FROM Numbers
    WHERE num < 1000
)
SELECT *
FROM Numbers;


--Task 2:
SELECT e.EmployeeID, e.FirstName, e.LastName, t.TotalSales
FROM Employees e
JOIN (
    SELECT EmployeeID, SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID
) t ON e.EmployeeID = t.EmployeeID;


--Task 3:
WITH AvgSalary AS (
    SELECT AVG(Salary) AS AvgSal
    FROM Employees
)
SELECT AvgSal FROM AvgSalary;


--Task 4:
SELECT p.ProductID, p.ProductName, t.MaxSale
FROM Products p
JOIN (
    SELECT ProductID, MAX(SalesAmount) AS MaxSale
    FROM Sales
    GROUP BY ProductID
) t ON p.ProductID = t.ProductID;


--Task 5:
WITH Doubling AS (
    SELECT 1 AS num
    UNION ALL
    SELECT num * 2
    FROM Doubling
    WHERE num * 2 < 1000000
)
SELECT * FROM Doubling;


--TAsk 6:
WITH SalesCount AS (
    SELECT EmployeeID, COUNT(*) AS NumSales
    FROM Sales
    GROUP BY EmployeeID
)
SELECT e.EmployeeID, e.FirstName, e.LastName
FROM Employees e
JOIN SalesCount sc ON e.EmployeeID = sc.EmployeeID
WHERE sc.NumSales > 5;


--Task 7:
WITH ProductSales AS (
    SELECT ProductID, SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY ProductID
)
SELECT p.ProductID, p.ProductName, ps.TotalSales
FROM Products p
JOIN ProductSales ps ON p.ProductID = ps.ProductID
WHERE ps.TotalSales > 500;


--Task 8:
WITH AvgSalary AS (
    SELECT AVG(Salary) AS AvgSal FROM Employees
)
SELECT *
FROM Employees
WHERE Salary > (SELECT AvgSal FROM AvgSalary);


--TAsk 9:
SELECT e.EmployeeID, e.FirstName, e.LastName, t.OrderCount
FROM Employees e
JOIN (
    SELECT EmployeeID, COUNT(*) AS OrderCount
    FROM Sales
    GROUP BY EmployeeID
    ORDER BY OrderCount DESC
    LIMIT 5
) t ON e.EmployeeID = t.EmployeeID;


--TAsk 10:
SELECT p.CategoryID, SUM(s.SalesAmount) AS TotalSales
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.CategoryID;


--TAsk 11:
WITH Factorials AS (
    SELECT Number, CAST(1 AS BIGINT) AS Fact, 1 AS n
    FROM Numbers1
    UNION ALL
    SELECT f.Number, f.Fact * (n + 1), n + 1
    FROM Factorials f
    WHERE n + 1 <= f.Number
)
SELECT Number, MAX(Fact) AS Factorial
FROM Factorials
GROUP BY Number;


--Task 12:
WITH RECURSIVE Split AS (
    SELECT Id, String, 1 AS pos, SUBSTRING(String, 1, 1) AS ch
    FROM Example
    UNION ALL
    SELECT Id, String, pos + 1, SUBSTRING(String, pos + 1, 1)
    FROM Split
    WHERE pos + 1 <= LEN(String)
)
SELECT Id, ch
FROM Split;


--Task 13:
WITH MonthlySales AS (
    SELECT
        DATEPART(YEAR, SaleDate) AS Yr,
        DATEPART(MONTH, SaleDate) AS Mn,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY DATEPART(YEAR, SaleDate), DATEPART(MONTH, SaleDate)
),
Diff AS (
    SELECT
        Yr, Mn,
        TotalSales - LAG(TotalSales) OVER (ORDER BY Yr, Mn) AS SalesDiff
    FROM MonthlySales
)
SELECT * FROM Diff;


--Task 14:
SELECT e.EmployeeID, e.FirstName, e.LastName, t.QuarterSales
FROM Employees e
JOIN (
    SELECT EmployeeID,
           DATEPART(YEAR, SaleDate) AS Yr,
           DATEPART(QUARTER, SaleDate) AS Qtr,
           SUM(SalesAmount) AS QuarterSales
    FROM Sales
    GROUP BY EmployeeID, DATEPART(YEAR, SaleDate), DATEPART(QUARTER, SaleDate)
    HAVING SUM(SalesAmount) > 45000
) t ON e.EmployeeID = t.EmployeeID;


--Task 15:
WITH Fibonacci AS (
    SELECT 1 AS n, 0 AS fib
    UNION ALL
    SELECT 2, 1
    UNION ALL
    SELECT n + 1, fib + LAG(fib) OVER (ORDER BY n)
    FROM Fibonacci
    WHERE n < 20
)
SELECT * FROM Fibonacci;


--TAsk 16:
SELECT *
FROM FindSameCharacters
WHERE Vals IS NOT NULL
  AND LEN(Vals) > 1
  AND LEN(REPLACE(Vals, LEFT(Vals, 1), '')) = 0;


--Task 17:
WITH RECURSIVE Seq AS (
    SELECT 1 AS n, CAST('1' AS VARCHAR(20)) AS seq
    UNION ALL
    SELECT n + 1, seq + CAST(n + 1 AS VARCHAR(20))
    FROM Seq
    WHERE n < 5
)
SELECT * FROM Seq;


--Task 18:
SELECT e.EmployeeID, e.FirstName, e.LastName, t.TotalSales
FROM Employees e
JOIN (
    SELECT EmployeeID, SUM(SalesAmount) AS TotalSales
    FROM Sales
    WHERE SaleDate >= DATEADD(MONTH, -6, GETDATE())
    GROUP BY EmployeeID
    ORDER BY TotalSales DESC
    LIMIT 1
) t ON e.EmployeeID = t.EmployeeID;


--Task 19:
SELECT PawanName,
       Pawan_slug_name,
       CASE 
           WHEN LEN(REPLACE(SUBSTRING(Pawan_slug_name, CHARINDEX('-', Pawan_slug_name) + 1, LEN(Pawan_slug_name)), 
                             LEFT(REPLACE(SUBSTRING(Pawan_slug_name, CHARINDEX('-', Pawan_slug_name) + 1, LEN(Pawan_slug_name)), 
                             SUBSTRING(Pawan_slug_name, CHARINDEX('-', Pawan_slug_name) + 1, 1), ''), 1), '')) = 0
                AND LEN(SUBSTRING(Pawan_slug_name, CHARINDEX('-', Pawan_slug_name) + 1, LEN(Pawan_slug_name))) > 1
           THEN LEFT(Pawan_slug_name, CHARINDEX('-', Pawan_slug_name)) + 
                SUBSTRING(Pawan_slug_name, CHARINDEX('-', Pawan_slug_name) + 1, 1)
           ELSE Pawan_slug_name
       END AS CleanedName
FROM RemoveDuplicateIntsFromNames;















