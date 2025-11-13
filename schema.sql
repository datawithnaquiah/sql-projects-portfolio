CREATE DATABASE AcmeEcommerce_db;
USE AcmeEcommerce_db;
-- 1. CUSTOMER
-- **************************************************************************
CREATE TABLE Customers (
   customer_id INT AUTO_INCREMENT PRIMARY KEY,
   first_name VARCHAR(50),
   last_name VARCHAR(50),
   email VARCHAR(100) UNIQUE,
   country VARCHAR(50),
   city VARCHAR(50),
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. PRODUCT
-- ************************************************************************
CREATE TABLE Products (
   product_id INT AUTO_INCREMENT PRIMARY KEY,
   product_name VARCHAR(100),
   category VARCHAR(50),
   price DECIMAL(10,2),
   stock_quantity INT,
   added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Employees
-- ************************************************************************
CREATE TABLE Employees (
   employee_id INT AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(100),
   role VARCHAR(50),
   email VARCHAR(100),
   hired_at DATE
);

-- 4. Orders
-- *************************************************************************
CREATE TABLE Orders (
   order_id INT AUTO_INCREMENT PRIMARY KEY,
   customer_id INT,
   employee_id INT,
   order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   total_amount DECIMAL(10,2),
   FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
   FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

-- 5. Order items
-- **************************************************************************
CREATE TABLE Order_Items (
	order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    item_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
----------------------------------------------------------------------------------------------------------------------
-- Step 1: Drop the database
DROP DATABASE AcmeEcommerce_db;

-- Step 2: Recreate the database
CREATE DATABASE AcmeEcommerce_db;

-- Step 3: Use the new database
USE your_database_name;

-- Step 4: Rerun your schema creation scripts
-- (tables, indexes, constraints, etc.)