/*
 * Level 2: Advanced Analytics (Window Functions)
 * Focus: Running Totals, Rankings, and Comparisons.
 */

-- REPORT 1: Cumulative Sales per Month (Running Total)
-- How does revenue accumulate throughout the year?
SELECT 
    YEAR(o.order_date) AS [Year],
    MONTH(o.order_date) AS [Month],
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS Monthly_Revenue,
    
    -- Window Function: Sum over preceding rows
    SUM(SUM(oi.quantity * oi.list_price * (1 - oi.discount))) 
        OVER (PARTITION BY YEAR(o.order_date) ORDER BY MONTH(o.order_date)) AS Cumulative_Revenue
FROM sales.orders o
JOIN sales.order_items oi ON o.order_id = oi.order_id
GROUP BY YEAR(o.order_date), MONTH(o.order_date)
ORDER BY [Year], [Month];
GO

-- REPORT 2: Top 3 Products per Category
-- Ranking products within their own categories based on sales.
WITH ProductSales AS (
    SELECT 
        c.category_name,
        p.product_name,
        SUM(oi.quantity * oi.list_price) as sales_volume
    FROM production.products p
    JOIN production.categories c ON p.category_id = c.category_id
    JOIN sales.order_items oi ON p.product_id = oi.product_id
    GROUP BY c.category_name, p.product_name
)
SELECT * FROM (
    SELECT 
        category_name,
        product_name,
        sales_volume,
        RANK() OVER (PARTITION BY category_name ORDER BY sales_volume DESC) as rank_in_cat
    FROM ProductSales
) t
WHERE rank_in_cat <= 3;
GO
