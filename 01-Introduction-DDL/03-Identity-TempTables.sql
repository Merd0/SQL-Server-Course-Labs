/*
 * Module: Identity, Synonyms & Temporary Tables
 */

-- 1. Create a Synonym (Alias for a table)
-- Instead of typing 'production.products', we can just use 'dbo.products'
CREATE SYNONYM dbo.products FOR production.products;
GO

-- 2. Select data into a Local Temporary Table (#Table)
-- Temp tables are stored in tempdb and deleted when the session ends.
SELECT 
    product_name, 
    list_price
INTO #ExpensiveProducts
FROM production.products
WHERE list_price > 1000;

-- Check temp table content
SELECT * FROM #ExpensiveProducts;
GO
