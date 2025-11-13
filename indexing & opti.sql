USE AcmeEcommerce_db;
-- basic index (single column)
CREATE INDEX idx_email
ON Customers (email);

SELECT * FROM Customers
WHERE email = 'nina@domain.com';
----------------------------------------------------------------------------------------------------
-- composite index (2 columns)
CREATE INDEX idx_country_city
ON Customers (country, city);

SELECT * FROM Customers
WHERE country = 'Brazil' AND city = 'São Paulo';

-- Unique index 
CREATE UNIQUE INDEX idx_email_unique
ON Customers (email);

-- How to show Indexing in table
SHOW INDEXES FROM Customers;

-- want to check how SQL run your query, whether using index or scan whole table 
EXPLAIN SELECT * FROM Customers
WHERE email = 'nina@domain.com';

-- If you want to drop Index
DROP INDEX idx_email ON Customers;