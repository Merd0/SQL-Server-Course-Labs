/*
 * Module: Filtering Data
 */

-- 1. WHERE and AND
SELECT * FROM production.products
WHERE model_year = 2017 AND list_price > 2000;

-- 2. BETWEEN (Range Filtering)
SELECT * FROM sales.orders
WHERE order_date BETWEEN '2017-01-01' AND '2017-01-31';

-- 3. LIKE (Pattern Matching)
-- Find customers whose first name starts with 'Ar'
SELECT * FROM sales.customers
WHERE first_name LIKE 'Ar%';

-- 4. IN (List of values)
SELECT * FROM production.products
WHERE category_id IN (1, 2, 5);
