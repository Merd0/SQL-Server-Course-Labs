/*
 * Module: Advanced Analytics & Reporting
 * Description: Real-world business scenarios combining Joins, Aggregations, and CTEs.
 */

USE BikeStores;
GO

-- SCENARIO 1: Customer Lifetime Value (CLV) Report
-- Who are our top 10 customers based on total spending, and when did they last buy?
-- Concepts: JOINs + GROUP BY + SUM() + MAX() + TOP
SELECT TOP 10
    c.customer_id,
    c.first_name + ' ' + c.last_name AS full_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    MAX(o.order_date) AS last_purchase_date,
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_spent
FROM sales.customers c
INNER JOIN sales.orders o ON c.customer_id = o.customer_id
INNER JOIN sales.order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC;
GO

-- SCENARIO 2: Product Performance by Category
-- Which products generate the most revenue within each category?
-- Concepts: JOINs + GROUP BY + Window Function (RANK)
WITH ProductSales AS (
    SELECT 
        cat.category_name,
        p.product_name,
        SUM(oi.quantity * oi.list_price) AS revenue
    FROM production.products p
    INNER JOIN production.categories cat ON p.category_id = cat.category_id
    INNER JOIN sales.order_items oi ON p.product_id = oi.product_id
    GROUP BY cat.category_name, p.product_name
)
SELECT * FROM (
    SELECT 
        category_name,
        product_name,
        revenue,
        RANK() OVER (PARTITION BY category_name ORDER BY revenue DESC) as rank_in_category
    FROM ProductSales
) AS RankedProducts
WHERE rank_in_category <= 3; -- Top 3 products per category
GO

-- SCENARIO 3: Monthly Sales Growth (Year over Year)
-- How are sales performing compared to the same month last year?
-- Concepts: Date Functions + Aggregation
SELECT 
    YEAR(o.order_date) AS sales_year,
    MONTH(o.order_date) AS sales_month,
    COUNT(o.order_id) AS total_orders,
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS monthly_revenue
FROM sales.orders o
INNER JOIN sales.order_items oi ON o.order_id = oi.order_id
GROUP BY YEAR(o.order_date), MONTH(o.order_date)
ORDER BY sales_year DESC, sales_month DESC;
GO

-- SCENARIO 4: Staff Performance Review
-- Which staff member completed the most orders and what is their total revenue generated?
SELECT 
    s.first_name + ' ' + s.last_name AS staff_name,
    st.store_name,
    COUNT(o.order_id) AS orders_completed,
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_sales_generated
FROM sales.staffs s
INNER JOIN sales.stores st ON s.store_id = st.store_id
INNER JOIN sales.orders o ON s.staff_id = o.staff_id
INNER JOIN sales.order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 4 -- Completed Orders
GROUP BY s.staff_id, s.first_name, s.last_name, st.store_name
ORDER BY total_sales_generated DESC;
GO
