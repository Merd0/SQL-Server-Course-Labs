/*
================================================================================
Module  : 03-Basic-Queries-Filtering
Script  : 01-Select-Order-Top.sql
Purpose : Showcase foundational result-shaping patterns.
================================================================================
*/

SET NOCOUNT ON;

-- 1) ORDER BY with multiple sort keys
SELECT
    first_name,
    last_name,
    city
FROM sales.customers
ORDER BY city ASC, first_name DESC;

-- 2) TOP-N expensive products
SELECT TOP (10)
    product_name,
    list_price
FROM production.products
ORDER BY list_price DESC;

-- 3) DISTINCT values for quick profiling
SELECT DISTINCT
    state
FROM sales.customers
ORDER BY state;
GO
