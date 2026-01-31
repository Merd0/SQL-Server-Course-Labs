/*
 * Level 3: Executive Intelligence (CTEs & Complex Logic)
 * Focus: Customer Segmentation (RFM Analysis) & Churn Risk.
 */

-- REPORT 1: High Value Customer Churn Risk
-- Find "Gold" customers who haven't purchased in the last 6 months.
-- (Assuming '2018-12-31' is the current date for this dataset)

WITH CustomerStats AS (
    -- Step 1: Calculate total spend and last purchase date for each customer
    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        c.email,
        MAX(o.order_date) as last_purchase_date,
        COUNT(o.order_id) as total_order_count,
        SUM(oi.quantity * oi.list_price * (1 - oi.discount)) as lifetime_value
    FROM sales.customers c
    JOIN sales.orders o ON c.customer_id = o.customer_id
    JOIN sales.order_items oi ON o.order_id = oi.order_id
    GROUP BY c.customer_id, c.first_name, c.last_name, c.email
),
CustomerSegments AS (
    -- Step 2: Segment customers based on spending (Gold/Silver/Bronze)
    SELECT 
        *,
        CASE 
            WHEN lifetime_value > 5000 THEN 'Gold'
            WHEN lifetime_value BETWEEN 1000 AND 5000 THEN 'Silver'
            ELSE 'Bronze'
        END AS customer_segment
    FROM CustomerStats
)
-- Step 3: Identify Gold customers at risk (No purchase in > 6 months)
SELECT 
    first_name, 
    last_name, 
    email, 
    customer_segment, 
    lifetime_value,
    last_purchase_date,
    DATEDIFF(month, last_purchase_date, '2018-12-31') as months_inactive
FROM CustomerSegments
WHERE customer_segment = 'Gold' 
  AND last_purchase_date < DATEADD(month, -6, '2018-12-31')
ORDER BY lifetime_value DESC;
GO
