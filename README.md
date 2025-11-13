# Project: E-Commerce Store Database

This project simulates an online store system with products, customers, employees, and orders. Built using SQL.

## 📂 Project Files
- `schema.sql` — defines tables and constraints
- `inserts.sql` — populates sample data
- `queries.sql` — 15+ use-case queries
- `er-diagram.png` — visual layout

## 💡 Key Concepts Used
- Relational schema design
- Primary & foreign keys
- INNER/LEFT/RIGHT JOINs
- Aggregations & GROUP BY
- Subqueries & Views
- Indexes & performance tips

## 🚀 How to Run
1. Install MySQL / PostgreSQL
2. Run `schema.sql` in your SQL IDE (like DBeaver or MySQL Workbench)
3. Insert sample data using `insert.sql`
4. Execute queries from `queries.sql`

## ✅ Output Examples
![table_customers](images/table_customers.png)

## 🧠 Try This
- Add a new customer with 3 orders
- Query: Total orders per region
- Optimize: Add index to `customer_id`
