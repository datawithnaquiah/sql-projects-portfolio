USE AcmeEcommerce_db;

-- Add Cutomers--
INSERT INTO Customers (first_name, last_name, email, country, city)
VALUES
('Amina', 'Shah', 'amina@email.com', 'India', 'Mumbai'),
('Lucas', 'Silva', 'lucas@store.com', 'Brazil', 'São Paulo'),
('Nina', 'Taylor', 'nina@domain.com', 'UK', 'London');

-- Add Products--
INSERT INTO Products (product_name, category, price, stock_quantity)
VALUES
('Wireless Mouse', 'Electronics', 25.99, 150),
('Laptop Stand', 'Accessories', 45.50, 80),
('USB-C Hub', 'Electronics', 29.99, 120),
('Laptop Bag', 'Accessories', 56.80, 200),
('Iphone Screen Protector', 'Accesories', 15.90, 190),
('Camera Stand', 'Accessories', 89.90, 160),
('Cable Holder', 'Accessories', 20.30, 200);

-- Add Emloyees--
INSERT INTO Employees (name, role, email, hired_at)
VALUES
('Sofia Zhang', 'Sales Agent', 'sofia@acme.com', '2024-01-15'),
('Ahmed Khan', 'Support Lead', 'ahmed@acme.com', '2023-10-10');

-- Add Orders--
INSERT INTO Orders (customer_id, employee_id, total_amount)
VALUES
(1, 1, 120.50),
(2, 2, 89.99),
(3, 2, 75.49);

-- Add Order Items--
INSERT INTO Order_Items (order_id, product_id, quantity, item_price)
VALUES
(1, 1, 1, 25.99),
(1, 2, 1, 45.50),
(2, 3, 2, 29.99);

----------------------------------------------------------------------------------------------------------------------
-- Update new customer into Customers table--
INSERT INTO Customers (first_name, last_name, email, country, city)
VALUES
('Shahrul', 'Shaari', 'shah@gmail.com', 'Malaysia', 'Shah Alam');



-----------------------------------------------------------------------------------------------------------------------------------------











  






