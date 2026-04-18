/*
================================================================================
Module  : 08-Complex-Reporting
Script  : 03-Level-3-Executive-Dashboard.sql
Purpose : Identify high-value churn-risk customers using CTE segmentation.
================================================================================
*/

SET NOCOUNT ON;

DECLARE @as_of_date DATE = '2018-12-31';

WITH CustomerStats AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        c.email,
        MAX(o.order_date) AS last_purchase_date,
        COUNT(o.order_id) AS total_order_count,
        SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS lifetime_value
    FROM sales.customers AS c
    INNER JOIN sales.orders AS o
        ON c.customer_id = o.customer_id
    INNER JOIN sales.order_items AS oi
        ON o.order_id = oi.order_id
    GROUP BY c.customer_id, c.first_name, c.last_name, c.email
), CustomerSegments AS (
    SELECT
        cs.*,
        CASE
            WHEN cs.lifetime_value > 5000 THEN 'Gold'
            WHEN cs.lifetime_value BETWEEN 1000 AND 5000 THEN 'Silver'
            ELSE 'Bronze'
        END AS customer_segment
    FROM CustomerStats AS cs
)
SELECT
    first_name,
    last_name,
    email,
    customer_segment,
    lifetime_value,
    last_purchase_date,
    DATEDIFF(MONTH, last_purchase_date, @as_of_date) AS months_inactive
FROM CustomerSegments
WHERE customer_segment = 'Gold'
  AND last_purchase_date < DATEADD(MONTH, -6, @as_of_date)
ORDER BY lifetime_value DESC;
GO
