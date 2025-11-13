USE AcmeEcommerce_db;
-- To check table's storage engine (InnoDB/MyISAM)
SHOW TABLE STATUS WHERE Name = 'Order_Items';

-- To view all customers--
SELECT * FROM Customers;

-- To view specific columns (only shows first names & emails)--
SELECT first_name, email
FROM Customers;

-- Filtering data with WHERE--
SELECT * FROM Customers
WHERE country = 'India';

-- Filtering data combine multiple conditions--
-- Select customers from India and Mumbai--
SELECT * FROM Customers
WHERE country = 'India' AND city = 'Mumbai';

-- Find all customers in London or Mumbai--
SELECT * FROM Customers
WHERE city = 'London' OR city = 'Mumbai';

SELECT * FROM Products
WHERE price < 30 OR category = 'Accessories';

-- Find all emails from store--
SELECT * FROM Customers
WHERE email LIKE '%@store.com';

-- Find customers which name starting with 'A'--
SELECT * FROM Customers
WHERE first_name LIKE 'A%';

-- Find specific a customer name 'Lucas'--
SELECT * FROM Customers
WHERE first_name LIKE 'Lucas';

-- Sorting data with ORDER BY--
SELECT * FROM Products
ORDER BY price DESC;

-- Only show fixed numbers of rows using LIMIT--
SELECT * FROM Products
LIMIT 3;

-- Combinations: Top 3 cheapest products in Accessories category--
SELECT * FROM Products
WHERE category = 'Accessories'
ORDER BY price ASC
LIMIT 3;

SELECT * FROM products;

-- Show all products with price lower 50--
SELECT * FROM Products
WHERE price < 50;

-- Get all customers from Brazil--
SELECT * FROM Customers
WHERE country = 'Brazil';

-- List orders placed by customer ID 1--
SELECT * FROM Orders
WHERE customer_id = 1;

-- Show top 3 products with highest stock--
SELECT * FROM Products
ORDER BY stock_quantity DESC 
LIMIT 3;
--------------------------------------------------------------------------------------------------------------

-- Total no of products--
SELECT COUNT(*) AS total_products
FROM Products;

-- Total revenue from all orders--
SELECT SUM(total_amount) AS total_revenue
FROM Orders;

-- Average product's price--
SELECT AVG(price) AS avg_price
FROM Products;

-- Find Highest/Cheapest price of all products--
SELECT MAX(price) AS highest_price
FROM Products;

SELECT MIN(price) AS Cheapest_price
FROM Products;

-- Number of Customers by Country--
SELECT country, COUNT(*) AS customer_count
FROM Customers
GROUP BY country;

-- Average Order Value by Employee--
SELECT employee_id, AVG(total_amount) AS avg_order
FROM Orders
GROUP BY employee_id;

-- Total Stock by Product Category--
SELECT category, SUM(stock_quantity) AS total_stock
FROM Products
GROUP BY category;

-- Total Stock by Product Category with total stock less than 250--
SELECT category, SUM(stock_quantity) AS total_stock
FROM Products
GROUP BY category
HAVING total_stock < 260;
-- (meaning, defines what stocks need restoking)
-----------------------------------------------------------------------------------------------------------------
-- (JOIN table Customers and Orders)--
-- orders that have a known customer--
SELECT c.first_name, o.order_id, o.total_amount
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id;

-- all customers, even if they haven’t made a purchase yet
SELECT c.first_name, o.order_id
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;

-- all orders, even if the customer record is missing(deleted account)
SELECT c.first_name, o.order_id
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;

-- Full outer JOIN practise--
SELECT c.first_name, o.order_id
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
UNION
SELECT c.first_name, o.order_id
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;

-- Show all orders with customer names
SELECT o.order_id, c.first_name, c.last_name, o.total_amount
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id;

-- Show all items in a specific order
SELECT oi.order_id, p.product_name, oi.quantity, oi.item_price
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
WHERE oi.order_id = 1;

-- Revenue handled by each employee
SELECT e.name, e.role, SUM(o.total_amount) AS revenue_generated
FROM Orders o
JOIN Employees e ON o.employee_id = e.employee_id
GROUP BY e.name, e.role;

-- Total items sold per product
SELECT p.name, SUM(oi.quantity) AS total_sold
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.name;

-- Orders with more than 1 item
SELECT order_id FROM Order_Items
GROUP BY order_id
HAVING COUNT(*) > 1;

-- Create a view of order summaries (create virtual TABLES)
CREATE VIEW order_summary AS
SELECT o.order_id, c.first_name, c.country, o.total_amount
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id;

SELECT * FROM order_summary;

-- Find employee with no orders
SELECT e.name, o.order_id
FROM Employees e
LEFT JOIN Orders o ON e.employee_id = o.employee_id 
WHERE o.order_id IS NULL;

-- Revenue per product category
SELECT p.category, SUM(oi.item_price) AS revenue 
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.category;

--------------------------------------------------------------------------------------------------------------------------------
-- SUBQUERY--
-- Show Orders Above Overall Average Total--
SELECT order_id, total_amount
FROM Orders
WHERE total_amount > (
    SELECT AVG(total_amount)
    FROM Orders
);

-- Find Products Priced Above the Average--
SELECT product_name, price
FROM Products
WHERE price > (
    SELECT AVG(price)
    FROM Products
);

-- Pull data for comparison example--
-- Take out all Products, take out their prices and add overall avg_price column--
-- Show all products and their prices. Do comparison each with Avg price. use SUBQUERY s.SELECT
SELECT product_name, price,
  (SELECT AVG(price) FROM Products) AS avg_price
FROM Products; 

-- Top 3 countries by customer count paling banyak--
SELECT * FROM(
SELECT country, COUNT(*) AS customer_count FROM Customers
GROUP BY country
ORDER BY customer_count DESC
LIMIT 3
)
AS top_countries;

-- Find Customers Who Spent More Than $200--
SELECT customer_id, total_amount
FROM Orders
WHERE total_amount > 100;

-- Customers Who Spent More Than the Average Total. use subquery s.WHERE--
SELECT c.first_name, o.total_amount
FROM Orders o
JOIN Customers c ON c.customer_id = o.customer_id
WHERE o.total_amount > (
	SELECT AVG(total_amount) 
    FROM Orders
);

-- Show orders placed by top 3 spenders. use subquery s.FROM--
SELECT * FROM (
	SELECT c.first_name, o.order_id, o.total_amount 
    FROM Customers c
    JOIN Orders o ON c.customer_id = o.customer_id
    ORDER BY total_amount DESC 
    LIMIT 3
    )
    AS top_spenders;
    
    
    
    






















