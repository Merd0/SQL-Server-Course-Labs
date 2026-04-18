/*
================================================================================
Module  : 06-Advanced-Set-Operators
Script  : 02-Exists-Any-All.sql
Purpose : Demonstrate EXISTS, ANY, and ALL with business-friendly examples.
================================================================================
*/

SET NOCOUNT ON;

-- 1) EXISTS: customers who placed at least one order in 2017
SELECT
    c.customer_id,
    c.first_name,
    c.last_name
FROM sales.customers AS c
WHERE EXISTS (
    SELECT 1
    FROM sales.orders AS o
    WHERE o.customer_id = c.customer_id
      AND YEAR(o.order_date) = 2017
);

-- 2) ANY: products priced above at least one product in category 1
SELECT
    p.product_id,
    p.product_name,
    p.list_price
FROM production.products AS p
WHERE p.list_price > ANY (
    SELECT p2.list_price
    FROM production.products AS p2
    WHERE p2.category_id = 1
);

-- 3) ALL: products priced above every product in category 1
SELECT
    p.product_id,
    p.product_name,
    p.list_price
FROM production.products AS p
WHERE p.list_price > ALL (
    SELECT p2.list_price
    FROM production.products AS p2
    WHERE p2.category_id = 1
);
GO
