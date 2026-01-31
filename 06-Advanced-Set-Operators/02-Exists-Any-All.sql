/*
 * Module: Advanced Subqueries
 */

-- EXISTS: Find customers who placed an order in 2017
SELECT customer_id, first_name
FROM sales.customers c
WHERE EXISTS (
    SELECT 1 FROM sales.orders o
    WHERE o.customer_id = c.customer_id
    AND YEAR(order_date) = 2017
);
