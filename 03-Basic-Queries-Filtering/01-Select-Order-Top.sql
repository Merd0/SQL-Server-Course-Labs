/*
 * Module: Basic Queries (DQL)
 */

-- 1. Order By (Sorting)
SELECT first_name, last_name, city
FROM sales.customers
ORDER BY city ASC, first_name DESC;

-- 2. Top (Limiting Results)
SELECT TOP 10 product_name, list_price
FROM production.products
ORDER BY list_price DESC;

-- 3. Distinct (Unique Values)
SELECT DISTINCT state
FROM sales.customers;
