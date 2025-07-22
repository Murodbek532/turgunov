--task 1:

DROP TABLE IF EXISTS #RegionSales;
GO
CREATE TABLE #RegionSales (
  Region      VARCHAR(100),
  Distributor VARCHAR(100),
  Sales       INTEGER NOT NULL,
  PRIMARY KEY (Region, Distributor)
);
GO
INSERT INTO #RegionSales (Region, Distributor, Sales) VALUES
('North','ACE',10), ('South','ACE',67), ('East','ACE',54),
('North','ACME',65), ('South','ACME',9), ('East','ACME',1), ('West','ACME',7),
('North','Direct Parts',8), ('South','Direct Parts',7), ('West','Direct Parts',12);

SELECT r.Region,
       d.Distributor,
       ISNULL(rs.Sales, 0) AS Sales
FROM (SELECT DISTINCT Region FROM #RegionSales) r
CROSS JOIN (SELECT DISTINCT Distributor FROM #RegionSales) d
LEFT JOIN #RegionSales rs 
       ON rs.Region = r.Region 
      AND rs.Distributor = d.Distributor
ORDER BY r.Region, d.Distributor;


--task 2:
CREATE TABLE Employee (id INT, name VARCHAR(255), department VARCHAR(255), managerId INT);
TRUNCATE TABLE Employee;
INSERT INTO Employee VALUES
(101, 'John', 'A', NULL), (102, 'Dan', 'A', 101), (103, 'James', 'A', 101),
(104, 'Amy', 'A', 101), (105, 'Anne', 'A', 101), (106, 'Ron', 'B', 101);

SELECT m.id, m.name, COUNT(e.id) AS DirectReports
FROM Employee m
JOIN Employee e ON e.managerId = m.id
GROUP BY m.id, m.name
HAVING COUNT(e.id) >= 5;

--task 3:
CREATE TABLE Products (product_id INT, product_name VARCHAR(40), product_category VARCHAR(40));
CREATE TABLE Orders (product_id INT, order_date DATE, unit INT);
TRUNCATE TABLE Products;
INSERT INTO Products VALUES
(1, 'Leetcode Solutions', 'Book'),
(2, 'Jewels of Stringology', 'Book'),
(3, 'HP', 'Laptop'), (4, 'Lenovo', 'Laptop'), (5, 'Leetcode Kit', 'T-shirt');
TRUNCATE TABLE Orders;
INSERT INTO Orders VALUES
(1,'2020-02-05',60),(1,'2020-02-10',70),
(2,'2020-01-18',30),(2,'2020-02-11',80),
(3,'2020-02-17',2),(3,'2020-02-24',3),
(4,'2020-03-01',20),(4,'2020-03-04',30),(4,'2020-03-04',60),
(5,'2020-02-25',50),(5,'2020-02-27',50),(5,'2020-03-01',50);

SELECT p.product_name, SUM(o.unit) AS total_units
FROM Products p
JOIN Orders o ON p.product_id = o.product_id
WHERE o.order_date >= '2020-02-01' 
  AND o.order_date < '2020-03-01'
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100;


--task 4:
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
  OrderID    INTEGER PRIMARY KEY,
  CustomerID INTEGER NOT NULL,
  [Count]    MONEY NOT NULL,
  Vendor     VARCHAR(100) NOT NULL
);
INSERT INTO Orders VALUES
(1,1001,12,'Direct Parts'), (2,1001,54,'Direct Parts'), (3,1001,32,'ACME'),
(4,2002,7,'ACME'), (5,2002,16,'ACME'), (6,2002,5,'Direct Parts');

SELECT CustomerID, Vendor
FROM (
    SELECT CustomerID, Vendor,
           COUNT(*) AS OrderCount,
           RANK() OVER (PARTITION BY CustomerID ORDER BY COUNT(*) DESC) AS rnk
    FROM Orders
    GROUP BY CustomerID, Vendor
) ranked
WHERE rnk = 1;


--task 5:
DECLARE @Check_Prime INT = 91;
DECLARE @i INT = 2;
DECLARE @isPrime BIT = 1;

IF @Check_Prime <= 1
    SET @isPrime = 0;
ELSE
BEGIN
    WHILE @i <= SQRT(@Check_Prime)
    BEGIN
        IF @Check_Prime % @i = 0
        BEGIN
            SET @isPrime = 0;
            BREAK;
        END
        SET @i = @i + 1;
    END
END

IF @isPrime = 1
    PRINT 'This number is prime';
ELSE
    PRINT 'This number is not prime';


--task 6:
CREATE TABLE Device(
  Device_id INT,
  Locations VARCHAR(25)
);
INSERT INTO Device VALUES
(12,'Bangalore'), (12,'Bangalore'), (12,'Bangalore'), (12,'Bangalore'),
(12,'Hosur'), (12,'Hosur'),
(13,'Hyderabad'), (13,'Hyderabad'), (13,'Secunderabad'),
(13,'Secunderabad'), (13,'Secunderabad');

WITH LocationCounts AS (
    SELECT Device_id,
           Locations,
           COUNT(*) AS SignalCount,
           RANK() OVER (PARTITION BY Device_id ORDER BY COUNT(*) DESC) AS rnk
    FROM Device
    GROUP BY Device_id, Locations
),
DeviceSummary AS (
    SELECT Device_id,
           COUNT(DISTINCT Locations) AS NumberOfLocations,
           SUM(SignalCount) AS TotalSignals
    FROM LocationCounts
    GROUP BY Device_id
)
SELECT ds.Device_id,
       ds.NumberOfLocations,
       lc.Locations AS MostSignalsLocation,
       ds.TotalSignals
FROM DeviceSummary ds
JOIN LocationCounts lc 
  ON ds.Device_id = lc.Device_id
 AND lc.rnk = 1;


--task 7:
CREATE TABLE Employee (
  EmpID INT,
  EmpName VARCHAR(30),
  Salary FLOAT,
  DeptID INT
);
INSERT INTO Employee VALUES
(1001,'Mark',60000,2), (1002,'Antony',40000,2), (1003,'Andrew',15000,1),
(1004,'Peter',35000,1), (1005,'John',55000,1), (1006,'Albert',25000,3), (1007,'Donald',35000,3);

SELECT e.EmpID, e.EmpName, e.Salary
FROM Employee e
JOIN (
    SELECT DeptID, AVG(Salary) AS AvgSalary
    FROM Employee
    GROUP BY DeptID
) d ON e.DeptID = d.DeptID
WHERE e.Salary > d.AvgSalary;


--task 8:
WITH TicketMatches AS (
    SELECT 
        t.TicketID,
        SUM(CASE WHEN n.Number IS NOT NULL THEN 1 ELSE 0 END) AS Matched,
        COUNT(DISTINCT t.Number) AS TotalPicked
    FROM Tickets t
    LEFT JOIN Numbers n ON t.Number = n.Number
    GROUP BY t.TicketID
)
SELECT SUM(
    CASE 
        WHEN Matched = (SELECT COUNT(*) FROM Numbers) THEN 100
        WHEN Matched > 0 THEN 10
        ELSE 0
    END
) AS TotalWinnings
FROM TicketMatches;


--task 9:
CREATE TABLE Spending (
  User_id INT,
  Spend_date DATE,
  Platform VARCHAR(10),
  Amount INT
);
INSERT INTO Spending VALUES
(1,'2019-07-01','Mobile',100),
(1,'2019-07-01','Desktop',100),
(2,'2019-07-01','Mobile',100),
(2,'2019-07-02','Mobile',100),
(3,'2019-07-01','Desktop',100),
(3,'2019-07-02','Desktop',100);

WITH UserPlatform AS (
    SELECT Spend_date,
           User_id,
           SUM(CASE WHEN Platform = 'Mobile' THEN Amount ELSE 0 END) AS MobileAmount,
           SUM(CASE WHEN Platform = 'Desktop' THEN Amount ELSE 0 END) AS DesktopAmount
    FROM Spending
    GROUP BY Spend_date, User_id
)
SELECT Spend_date,
       SUM(CASE WHEN MobileAmount > 0 AND DesktopAmount = 0 THEN 1 ELSE 0 END) AS MobileOnlyUsers,
       SUM(CASE WHEN MobileAmount > 0 AND DesktopAmount = 0 THEN MobileAmount ELSE 0 END) AS MobileOnlyAmount,
       SUM(CASE WHEN DesktopAmount > 0 AND MobileAmount = 0 THEN 1 ELSE 0 END) AS DesktopOnlyUsers,
       SUM(CASE WHEN DesktopAmount > 0 AND MobileAmount = 0 THEN DesktopAmount ELSE 0 END) AS DesktopOnlyAmount,
       SUM(CASE WHEN MobileAmount > 0 AND DesktopAmount > 0 THEN 1 ELSE 0 END) AS BothUsers,
       SUM(CASE WHEN MobileAmount > 0 AND DesktopAmount > 0 THEN MobileAmount + DesktopAmount ELSE 0 END) AS BothAmount
FROM UserPlatform
GROUP BY Spend_date
ORDER BY Spend_date;


--task 10:
DROP TABLE IF EXISTS Grouped;
CREATE TABLE Grouped
(
  Product  VARCHAR(100) PRIMARY KEY,
  Quantity INTEGER NOT NULL
);
INSERT INTO Grouped (Product, Quantity) VALUES
('Pencil', 3), ('Eraser', 4), ('Notebook', 2);


SELECT Product, 1 AS Quantity
FROM Grouped
JOIN (
    SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM master.dbo.spt_values -- таблица чисел в SQL Server
) numbers
  ON numbers.n <= Grouped.Quantity
ORDER BY Product;




















