CREATE TABLE sales_data (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    customer_name VARCHAR(100),
    product_category VARCHAR(50),
    product_name VARCHAR(100),
    quantity_sold INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    order_date DATE,
    region VARCHAR(50)
);

INSERT INTO sales_data VALUES
    (1, 101, 'Alice', 'Electronics', 'Laptop', 1, 1200.00, 1200.00, '2024-01-01', 'North'),
    (2, 102, 'Bob', 'Electronics', 'Phone', 2, 600.00, 1200.00, '2024-01-02', 'South'),
    (3, 103, 'Charlie', 'Clothing', 'T-Shirt', 5, 20.00, 100.00, '2024-01-03', 'East'),
    (4, 104, 'David', 'Furniture', 'Table', 1, 250.00, 250.00, '2024-01-04', 'West'),
    (5, 105, 'Eve', 'Electronics', 'Tablet', 1, 300.00, 300.00, '2024-01-05', 'North'),
    (6, 106, 'Frank', 'Clothing', 'Jacket', 2, 80.00, 160.00, '2024-01-06', 'South'),
    (7, 107, 'Grace', 'Electronics', 'Headphones', 3, 50.00, 150.00, '2024-01-07', 'East'),
    (8, 108, 'Hank', 'Furniture', 'Chair', 4, 75.00, 300.00, '2024-01-08', 'West'),
    (9, 109, 'Ivy', 'Clothing', 'Jeans', 1, 40.00, 40.00, '2024-01-09', 'North'),
    (10, 110, 'Jack', 'Electronics', 'Laptop', 2, 1200.00, 2400.00, '2024-01-10', 'South'),
    (11, 101, 'Alice', 'Electronics', 'Phone', 1, 600.00, 600.00, '2024-01-11', 'North'),
    (12, 102, 'Bob', 'Furniture', 'Sofa', 1, 500.00, 500.00, '2024-01-12', 'South'),
    (13, 103, 'Charlie', 'Electronics', 'Camera', 1, 400.00, 400.00, '2024-01-13', 'East'),
    (14, 104, 'David', 'Clothing', 'Sweater', 2, 60.00, 120.00, '2024-01-14', 'West'),
    (15, 105, 'Eve', 'Furniture', 'Bed', 1, 800.00, 800.00, '2024-01-15', 'North'),
    (16, 106, 'Frank', 'Electronics', 'Monitor', 1, 200.00, 200.00, '2024-01-16', 'South'),
    (17, 107, 'Grace', 'Clothing', 'Scarf', 3, 25.00, 75.00, '2024-01-17', 'East'),
    (18, 108, 'Hank', 'Furniture', 'Desk', 1, 350.00, 350.00, '2024-01-18', 'West'),
    (19, 109, 'Ivy', 'Electronics', 'Speaker', 2, 100.00, 200.00, '2024-01-19', 'North'),
    (20, 110, 'Jack', 'Clothing', 'Shoes', 1, 90.00, 90.00, '2024-01-20', 'South'),
    (21, 111, 'Kevin', 'Electronics', 'Mouse', 3, 25.00, 75.00, '2024-01-21', 'East'),
    (22, 112, 'Laura', 'Furniture', 'Couch', 1, 700.00, 700.00, '2024-01-22', 'West'),
    (23, 113, 'Mike', 'Clothing', 'Hat', 4, 15.00, 60.00, '2024-01-23', 'North'),
    (24, 114, 'Nancy', 'Electronics', 'Smartwatch', 1, 250.00, 250.00, '2024-01-24', 'South'),
    (25, 115, 'Oscar', 'Furniture', 'Wardrobe', 1, 1000.00, 1000.00, '2024-01-25', 'East')

--task 1:
SELECT sale_id, customer_id, customer_name, order_date, total_amount,
       SUM(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS RunningTotal
FROM sales_data;


--task 2:
SELECT product_category, COUNT(*) AS OrderCount
FROM sales_data
GROUP BY product_category;

--task 3:
SELECT product_category, MAX(total_amount) AS MaxTotalAmount
FROM sales_data
GROUP BY product_category;

--task 4:
SELECT product_category, MIN(unit_price) AS MinUnitPrice
FROM sales_data
GROUP BY product_category;

--task 5:
SELECT sale_id, order_date, total_amount,
       AVG(total_amount) OVER (ORDER BY order_date ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS MovingAvg3Days
FROM sales_data;


--task 6:
SELECT region, SUM(total_amount) AS TotalSales
FROM sales_data
GROUP BY region;


--task 7:
SELECT customer_id, customer_name,
       SUM(total_amount) AS TotalPurchase,
       RANK() OVER (ORDER BY SUM(total_amount) DESC) AS PurchaseRank
FROM sales_data
GROUP BY customer_id, customer_name;


--task 8:
SELECT sale_id, customer_id, order_date, total_amount,
       total_amount - LAG(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS DiffFromPrev
FROM sales_data;


--task 9:
SELECT *
FROM (
    SELECT *,
           DENSE_RANK() OVER (PARTITION BY product_category ORDER BY unit_price DESC) AS rnk
    FROM sales_data
) t
WHERE rnk <= 3;


--task 10:
SELECT region, order_date, total_amount,
       SUM(total_amount) OVER (PARTITION BY region ORDER BY order_date) AS CumulativeSales
FROM sales_data;


--task 11:
SELECT product_category,
       order_date,
       SUM(total_amount) OVER (PARTITION BY product_category ORDER BY order_date) AS CumulativeRevenue
FROM sales_data;


--task 12:
SELECT sale_id,
       order_date,
       total_amount,
       SUM(total_amount) OVER (ORDER BY order_date ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING) AS SumOfPrev
FROM sales_data;

--task 13:
SELECT 
    Value,
    SUM(Value) OVER (ORDER BY Value ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING) + Value AS [Sum of Previous]
FROM OneColumn;


--task 14:
SELECT customer_id, customer_name
FROM sales_data
GROUP BY customer_id, customer_name
HAVING COUNT(DISTINCT product_category) > 1;


--task 15:
SELECT customer_id, customer_name, region, SUM(total_amount) AS total_spent
FROM sales_data
GROUP BY customer_id, customer_name, region
HAVING SUM(total_amount) > (
    SELECT AVG(total_amount)
    FROM sales_data s2
    WHERE s2.region = sales_data.region
);


--task 16:
SELECT 
    customer_id,
    customer_name,
    region,
    SUM(total_amount) AS total_spent,
    RANK() OVER (PARTITION BY region ORDER BY SUM(total_amount) DESC) AS region_rank
FROM sales_data
GROUP BY customer_id, customer_name, region;


--task 17:
SELECT 
    customer_id,
    customer_name,
    order_date,
    total_amount,
    SUM(total_amount) OVER (
        PARTITION BY customer_id 
        ORDER BY order_date
        ROWS UNBOUNDED PRECEDING
    ) AS cumulative_sales
FROM sales_data;


--task 18:
SELECT 
    FORMAT(order_date, 'yyyy-MM') AS month,
    SUM(total_amount) AS monthly_sales,
    LAG(SUM(total_amount)) OVER (ORDER BY FORMAT(order_date, 'yyyy-MM')) AS prev_month_sales,
    (SUM(total_amount) - LAG(SUM(total_amount)) OVER (ORDER BY FORMAT(order_date, 'yyyy-MM')))
        / NULLIF(LAG(SUM(total_amount)) OVER (ORDER BY FORMAT(order_date, 'yyyy-MM')), 0) * 100 AS growth_rate
FROM sales_data
GROUP BY FORMAT(order_date, 'yyyy-MM')
ORDER BY month;


--task 19:
SELECT *
FROM (
    SELECT 
        customer_id,
        customer_name,
        order_date,
        total_amount,
        LAG(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS prev_amount
    FROM sales_data
) t
WHERE total_amount > ISNULL(prev_amount, 0);


--task 20:
SELECT *
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);


--task 21:
SELECT 
    Id,
    Grp,
    Val1,
    Val2,
    CASE 
        WHEN ROW_NUMBER() OVER (PARTITION BY Grp ORDER BY Id) = 1 
        THEN SUM(Val1 + Val2) OVER (PARTITION BY Grp)
    END AS GroupTotal
FROM MyData
ORDER BY Grp, Id;

--task 22:
CREATE TABLE TheSumPuzzle (
    ID INT, Cost INT, Quantity INT
);
INSERT INTO TheSumPuzzle VALUES
(1234,12,164), (1234,13,164), (1235,100,130), (1235,100,135), (1236,12,136);

SELECT 
    ID,
    SUM(Cost) AS Cost,
    SUM(Quantity) AS Quantity
FROM TheSumPuzzle
GROUP BY ID;


--task 23:
CREATE TABLE Seats 
( 
SeatNumber INTEGER 
); 

INSERT INTO Seats VALUES 
(7),(13),(14),(15),(27),(28),(29),(30), 
(31),(32),(33),(34),(35),(52),(53),(54); 

WITH Numbered AS (
    SELECT SeatNumber,
           LAG(SeatNumber) OVER (ORDER BY SeatNumber) AS PrevSeat
    FROM Seats
)
SELECT 
    PrevSeat + 1 AS GapStart,
    SeatNumber - 1 AS GapEnd
FROM Numbered
WHERE SeatNumber - PrevSeat > 1

UNION ALL

SELECT 1, MIN(SeatNumber) - 1
FROM Seats
WHERE MIN(SeatNumber) > 1

UNION ALL

SELECT MAX(SeatNumber) + 1, NULL
FROM Seats
WHERE 1 = 0  
























