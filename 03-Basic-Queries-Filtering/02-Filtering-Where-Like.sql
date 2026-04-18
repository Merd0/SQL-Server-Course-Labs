/*
================================================================================
Module  : 03-Basic-Queries-Filtering
Script  : 02-Filtering-Where-Like.sql
Purpose : Demonstrate practical filtering with WHERE, BETWEEN, LIKE, and IN.
================================================================================
*/

SET NOCOUNT ON;

-- 1) AND condition filtering
SELECT
    product_id,
    product_name,
    model_year,
    list_price
FROM production.products
WHERE model_year = 2017
  AND list_price > 2000;

-- 2) BETWEEN date range filtering (inclusive)
SELECT
    order_id,
    customer_id,
    order_date,
    order_status
FROM sales.orders
WHERE order_date BETWEEN '2017-01-01' AND '2017-01-31'
ORDER BY order_date;

-- 3) LIKE pattern filtering
SELECT
    customer_id,
    first_name,
    last_name,
    email
FROM sales.customers
WHERE first_name LIKE 'Ar%';

-- 4) IN list filtering
SELECT
    product_id,
    product_name,
    category_id,
    list_price
FROM production.products
WHERE category_id IN (1, 2, 5)
ORDER BY category_id, list_price DESC;
GO
