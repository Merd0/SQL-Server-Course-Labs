/*
 * Module: Aliases
 * Description: Renaming tables temporarily for readability.
 */

SELECT 
    c.first_name + ' ' + c.last_name AS FullName,
    o.order_date
FROM sales.customers AS c
INNER JOIN sales.orders AS o ON c.customer_id = o.customer_id;
