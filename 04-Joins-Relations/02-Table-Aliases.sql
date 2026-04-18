/*
================================================================================
Module  : 04-Joins-Relations
Script  : 02-Table-Aliases.sql
Purpose : Improve readability with table aliases in multi-table queries.
================================================================================
*/

SET NOCOUNT ON;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    o.order_id,
    o.order_date
FROM sales.customers AS c
INNER JOIN sales.orders AS o
    ON c.customer_id = o.customer_id
ORDER BY o.order_date DESC;
GO
