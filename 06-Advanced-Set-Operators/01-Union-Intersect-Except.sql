/*
 * Module: Set Operators
 */

-- 1. UNION (Combines results, removes duplicates)
SELECT first_name, last_name FROM sales.staffs
UNION
SELECT first_name, last_name FROM sales.customers;

-- 2. INTERSECT (Returns rows present in BOTH sets)
-- Example: Cities where both customers and stores are located
SELECT city FROM sales.customers
INTERSECT
SELECT city FROM sales.stores;

-- 3. EXCEPT (Returns rows in First set BUT NOT in Second)
-- Example: Products that exist but have no sales
SELECT product_id FROM production.products
EXCEPT
SELECT product_id FROM sales.order_items;
