/*
================================================================================
Module  : 08-Complex-Reporting
Script  : 02-Level-2-Window-Functions.sql
Purpose : Build window-function reports for cumulative revenue and ranking.
================================================================================
*/

SET NOCOUNT ON;

-- REPORT 1: Monthly revenue + yearly cumulative revenue
SELECT
    YEAR(o.order_date) AS sales_year,
    MONTH(o.order_date) AS sales_month,
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS monthly_revenue,
    SUM(SUM(oi.quantity * oi.list_price * (1 - oi.discount))) OVER (
        PARTITION BY YEAR(o.order_date)
        ORDER BY MONTH(o.order_date)
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_revenue
FROM sales.orders AS o
INNER JOIN sales.order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY YEAR(o.order_date), MONTH(o.order_date)
ORDER BY sales_year, sales_month;
GO

-- REPORT 2: Top 3 products by sales per category
WITH ProductSales AS (
    SELECT
        c.category_name,
        p.product_name,
        SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS sales_amount
    FROM production.products AS p
    INNER JOIN production.categories AS c
        ON p.category_id = c.category_id
    INNER JOIN sales.order_items AS oi
        ON p.product_id = oi.product_id
    GROUP BY c.category_name, p.product_name
), RankedProducts AS (
    SELECT
        category_name,
        product_name,
        sales_amount,
        DENSE_RANK() OVER (
            PARTITION BY category_name
            ORDER BY sales_amount DESC
        ) AS rank_in_category
    FROM ProductSales
)
SELECT
    category_name,
    product_name,
    sales_amount,
    rank_in_category
FROM RankedProducts
WHERE rank_in_category <= 3
ORDER BY category_name, rank_in_category, product_name;
GO
