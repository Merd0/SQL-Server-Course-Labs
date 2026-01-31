/*
 * Level 1: Summary Reports (Aggregation & Grouping)
 * Focus: Revenue analysis by Brand and Store.
 */

USE BikeStores;
GO

-- REPORT 1: Best Selling Brands by Revenue
-- Which brands are generating the most money?
SELECT 
    b.brand_name,
    COUNT(DISTINCT o.order_id) as total_orders,
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_revenue
FROM production.brands b
JOIN production.products p ON b.brand_id = p.brand_id
JOIN sales.order_items oi ON p.product_id = oi.product_id
JOIN sales.orders o ON oi.order_id = o.order_id
GROUP BY b.brand_name
ORDER BY total_revenue DESC;
GO

-- REPORT 2: Store Performance vs. Staff Count
-- Do stores with more staff sell more?
SELECT 
    s.store_name,
    COUNT(DISTINCT st.staff_id) as staff_count,
    COUNT(DISTINCT o.order_id) as orders_completed,
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_revenue
FROM sales.stores s
LEFT JOIN sales.staffs st ON s.store_id = st.store_id
LEFT JOIN sales.orders o ON s.store_id = o.store_id
LEFT JOIN sales.order_items oi ON o.order_id = oi.order_id
GROUP BY s.store_id, s.store_name
ORDER BY total_revenue DESC;
GO
