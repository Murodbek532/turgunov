CREATE TABLE #Sales (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    Quantity INT,
    Price DECIMAL(10,2),
    SaleDate DATE
);


INSERT INTO #Sales (CustomerName, Product, Quantity, Price, SaleDate) VALUES
('Alice', 'Laptop', 1, 1200.00, '2024-01-15'),
('Bob', 'Smartphone', 2, 800.00, '2024-02-10'),
('Charlie', 'Tablet', 1, 500.00, '2024-02-20'),
('David', 'Laptop', 1, 1300.00, '2024-03-05'),
('Eve', 'Smartphone', 3, 750.00, '2024-03-12'),
('Frank', 'Headphones', 2, 100.00, '2024-04-08'),
('Grace', 'Smartwatch', 1, 300.00, '2024-04-25'),
('Hannah', 'Tablet', 2, 480.00, '2024-05-05'),
('Isaac', 'Laptop', 1, 1250.00, '2024-05-15'),
('Jack', 'Smartphone', 1, 820.00, '2024-06-01');

--task 1:
SELECT DISTINCT s.CustomerName
FROM #Sales s
WHERE EXISTS (
    SELECT 1
    FROM #Sales s2
    WHERE s2.CustomerName = s.CustomerName
      AND s2.SaleDate >= '2024-03-01'
      AND s2.SaleDate < '2024-04-01'
);

--task 2:
SELECT Product
FROM #Sales
GROUP BY Product
HAVING SUM(Quantity * Price) = (
    SELECT MAX(TotalRevenue)
    FROM (
        SELECT SUM(Quantity * Price) AS TotalRevenue
        FROM #Sales
        GROUP BY Product
    ) AS t
);


--task 3:
SELECT MAX(TotalAmount) AS SecondHighestSale
FROM (
    SELECT Quantity * Price AS TotalAmount
    FROM #Sales
) AS t
WHERE TotalAmount < (
    SELECT MAX(Quantity * Price)
    FROM #Sales
);



--task 4:
SELECT FORMAT(SaleDate, 'yyyy-MM') AS Month,
       (SELECT SUM(Quantity) 
        FROM #Sales s2 
        WHERE FORMAT(s2.SaleDate, 'yyyy-MM') = FORMAT(s1.SaleDate, 'yyyy-MM')) AS TotalQuantity
FROM #Sales s1
GROUP BY FORMAT(SaleDate, 'yyyy-MM');


--task 5:
SELECT DISTINCT s1.CustomerName
FROM #Sales s1
WHERE EXISTS (
    SELECT 1
    FROM #Sales s2
    WHERE s2.Product = s1.Product
      AND s2.CustomerName <> s1.CustomerName
);


--task 6:
create table Fruits(Name varchar(50), Fruit varchar(50))
insert into Fruits values ('Francesko', 'Apple'), ('Francesko', 'Apple'), ('Francesko', 'Apple'), ('Francesko', 'Orange'),
							('Francesko', 'Banana'), ('Francesko', 'Orange'), ('Li', 'Apple'), 
							('Li', 'Orange'), ('Li', 'Apple'), ('Li', 'Banana'), ('Mario', 'Apple'), ('Mario', 'Apple'), 
							('Mario', 'Apple'), ('Mario', 'Banana'), ('Mario', 'Banana'), 
							('Mario', 'Orange')

SELECT Name, Fruit, COUNT(*) AS FruitCount
FROM Fruits
GROUP BY Name, Fruit;




--task 7:
create table Family(ParentId int, ChildID int)
insert into Family values (1, 2), (2, 3), (3, 4)

WITH FamilyHierarchy AS (
    SELECT ParentId, ChildID
    FROM Family
    UNION ALL
    SELECT fh.ParentId, f.ChildID
    FROM FamilyHierarchy fh
    JOIN Family f ON fh.ChildID = f.ParentId
)
SELECT ParentId AS PID, ChildID AS CHID
FROM FamilyHierarchy
ORDER BY PID, CHID;



--task 8:
CREATE TABLE #Orders
(
CustomerID     INTEGER,
OrderID        INTEGER,
DeliveryState  VARCHAR(100) NOT NULL,
Amount         MONEY NOT NULL,
PRIMARY KEY (CustomerID, OrderID)
);


INSERT INTO #Orders (CustomerID, OrderID, DeliveryState, Amount) VALUES
(1001,1,'CA',340),(1001,2,'TX',950),(1001,3,'TX',670),
(1001,4,'TX',860),(2002,5,'WA',320),(3003,6,'CA',650),
(3003,7,'CA',830),(4004,8,'TX',120);


SELECT *
FROM #Orders o
WHERE o.DeliveryState = 'TX'
  AND EXISTS (
      SELECT 1
      FROM #Orders c
      WHERE c.CustomerID = o.CustomerID
        AND c.DeliveryState = 'CA'
  );



--task 9:
create table #residents(resid int identity, fullname varchar(50), address varchar(100))

insert into #residents values 
('Dragan', 'city=Bratislava country=Slovakia name=Dragan age=45'),
('Diogo', 'city=Lisboa country=Portugal age=26'),
('Celine', 'city=Marseille country=France name=Celine age=21'),
('Theo', 'city=Milan country=Italy age=28'),
('Rajabboy', 'city=Tashkent country=Uzbekistan age=22')

UPDATE r
SET fullname = SUBSTRING(
                  r.address,
                  CHARINDEX('name=', r.address) + 5,
                  CHARINDEX(' ', r.address + ' ', CHARINDEX('name=', r.address) + 5) 
                      - (CHARINDEX('name=', r.address) + 5)
              )
FROM #residents r
WHERE r.fullname IS NULL
  AND r.address LIKE '%name=%';



--task 10:
CREATE TABLE #Routes
(
RouteID        INTEGER NOT NULL,
DepartureCity  VARCHAR(30) NOT NULL,
ArrivalCity    VARCHAR(30) NOT NULL,
Cost           MONEY NOT NULL,
PRIMARY KEY (DepartureCity, ArrivalCity)
);

INSERT INTO #Routes (RouteID, DepartureCity, ArrivalCity, Cost) VALUES
(1,'Tashkent','Samarkand',100),
(2,'Samarkand','Bukhoro',200),
(3,'Bukhoro','Khorezm',300),
(4,'Samarkand','Khorezm',400),
(5,'Tashkent','Jizzakh',100),
(6,'Jizzakh','Samarkand',50);

;WITH RoutePaths AS (
    SELECT 
        CAST(DepartureCity + ' - ' + ArrivalCity AS VARCHAR(MAX)) AS Route,
        ArrivalCity,
        Cost
    FROM #Routes
    WHERE DepartureCity = 'Tashkent'

    UNION ALL
    SELECT
        CAST(rp.Route + ' - ' + r.ArrivalCity AS VARCHAR(MAX)) AS Route,
        r.ArrivalCity,
        rp.Cost + r.Cost
    FROM RoutePaths rp
    JOIN #Routes r ON rp.ArrivalCity = r.DepartureCity
    WHERE rp.Route NOT LIKE '%' + r.ArrivalCity + '%'  
)
SELECT TOP 1 Route, Cost
FROM RoutePaths
WHERE ArrivalCity = 'Khorezm'
ORDER BY Cost ASC

UNION ALL

SELECT TOP 1 Route, Cost
FROM RoutePaths
WHERE ArrivalCity = 'Khorezm'
ORDER BY Cost DESC;


--task 11:
CREATE TABLE #RankingPuzzle
(
     ID INT
    ,Vals VARCHAR(10)
)

 
INSERT INTO #RankingPuzzle VALUES
(1,'Product'),
(2,'a'),
(3,'a'),
(4,'a'),
(5,'a'),
(6,'Product'),
(7,'b'),
(8,'b'),
(9,'Product'),
(10,'c')

SELECT ID, Vals,
       DENSE_RANK() OVER (ORDER BY ID) AS RankOrder
FROM #RankingPuzzle;


--task 12:
CREATE TABLE #EmployeeSales (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    SalesAmount DECIMAL(10,2),
    SalesMonth INT,
    SalesYear INT
);

INSERT INTO #EmployeeSales (EmployeeName, Department, SalesAmount, SalesMonth, SalesYear) VALUES
('Alice', 'Electronics', 5000, 1, 2024),
('Bob', 'Electronics', 7000, 1, 2024),
('Charlie', 'Furniture', 3000, 1, 2024),
('David', 'Furniture', 4500, 1, 2024),
('Eve', 'Clothing', 6000, 1, 2024),
('Frank', 'Electronics', 8000, 2, 2024),
('Grace', 'Furniture', 3200, 2, 2024),
('Hannah', 'Clothing', 7200, 2, 2024),
('Isaac', 'Electronics', 9100, 3, 2024),
('Jack', 'Furniture', 5300, 3, 2024),
('Kevin', 'Clothing', 6800, 3, 2024),
('Laura', 'Electronics', 6500, 4, 2024),
('Mia', 'Furniture', 4000, 4, 2024),
('Nathan', 'Clothing', 7800, 4, 2024);

SELECT *
FROM #EmployeeSales e
WHERE SalesAmount > (
    SELECT AVG(SalesAmount)
    FROM #EmployeeSales
    WHERE Department = e.Department
);


--task 13:
SELECT *
FROM #EmployeeSales e
WHERE EXISTS (
    SELECT 1
    FROM #EmployeeSales s
    WHERE s.SalesMonth = e.SalesMonth
      AND s.SalesYear = e.SalesYear
    GROUP BY s.SalesMonth, s.SalesYear
    HAVING e.SalesAmount = MAX(s.SalesAmount)
);



--task 14:
CREATE TABLE Products (
    ProductID   INT PRIMARY KEY,
    Name        VARCHAR(50),
    Category    VARCHAR(50),
    Price       DECIMAL(10,2),
    Stock       INT
);

INSERT INTO Products (ProductID, Name, Category, Price, Stock) VALUES
(1, 'Laptop', 'Electronics', 1200.00, 15),
(2, 'Smartphone', 'Electronics', 800.00, 30),
(3, 'Tablet', 'Electronics', 500.00, 25),
(4, 'Headphones', 'Accessories', 150.00, 50),
(5, 'Keyboard', 'Accessories', 100.00, 40),
(6, 'Monitor', 'Electronics', 300.00, 20),
(7, 'Mouse', 'Accessories', 50.00, 60),
(8, 'Chair', 'Furniture', 200.00, 10),
(9, 'Desk', 'Furniture', 400.00, 5),
(10, 'Printer', 'Office Supplies', 250.00, 12),
(11, 'Scanner', 'Office Supplies', 180.00, 8),
(12, 'Notebook', 'Stationery', 10.00, 100),
(13, 'Pen', 'Stationery', 2.00, 500),
(14, 'Backpack', 'Accessories', 80.00, 30),
(15, 'Lamp', 'Furniture', 60.00, 25);

SELECT DISTINCT e.EmployeeName
FROM #EmployeeSales e
WHERE NOT EXISTS (
    SELECT DISTINCT SalesMonth
    FROM #EmployeeSales
    EXCEPT
    SELECT DISTINCT SalesMonth
    FROM #EmployeeSales s
    WHERE s.EmployeeName = e.EmployeeName
);



--task 15:
SELECT Name
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);


--task 16:
SELECT Name
FROM Products
WHERE Stock < (SELECT MAX(Stock) FROM Products);


--task 17:
SELECT Name
FROM Products
WHERE Category = (SELECT Category FROM Products WHERE Name = 'Laptop');


--task 18:
SELECT Name
FROM Products
WHERE Price > (
    SELECT MIN(Price)
    FROM Products
    WHERE Category = 'Electronics'
);


--task 19:
CREATE TABLE Orders (
    OrderID    INT PRIMARY KEY,
    ProductID  INT,
    Quantity   INT,
    OrderDate  DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Orders (OrderID, ProductID, Quantity, OrderDate) VALUES
(1, 1, 2, '2024-03-01'),
(2, 3, 5, '2024-03-05'),
(3, 2, 3, '2024-03-07'),
(4, 5, 4, '2024-03-10'),
(5, 8, 1, '2024-03-12'),
(6, 10, 2, '2024-03-15'),
(7, 12, 10, '2024-03-18'),
(8, 7, 6, '2024-03-20'),
(9, 6, 2, '2024-03-22'),
(10, 4, 3, '2024-03-25'),
(11, 9, 2, '2024-03-28'),
(12, 11, 1, '2024-03-30'),
(13, 14, 4, '2024-04-02'),
(14, 15, 5, '2024-04-05'),
(15, 13, 20, '2024-04-08');

SELECT Name
FROM Products p
WHERE Price > (
    SELECT AVG(Price)
    FROM Products
    WHERE Category = p.Category
);



--task 20:
SELECT DISTINCT p.Name
FROM Products p
JOIN Orders o ON p.ProductID = o.ProductID;



--task 21:
SELECT p.Name
FROM Products p
JOIN Orders o ON p.ProductID = o.ProductID
GROUP BY p.Name
HAVING SUM(o.Quantity) > (
    SELECT AVG(TotalQty)
    FROM (
        SELECT SUM(Quantity) AS TotalQty
        FROM Orders
        GROUP BY ProductID
    ) t
);


--task 22:
SELECT Name
FROM Products
WHERE ProductID NOT IN (SELECT DISTINCT ProductID FROM Orders);


--task 23:
SELECT TOP 1 p.Name
FROM Products p
JOIN Orders o ON p.ProductID = o.ProductID
GROUP BY p.Name
ORDER BY SUM(o.Quantity) DESC;





























