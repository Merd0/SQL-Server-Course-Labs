/*
================================================================================
Module  : 02-DataTypes-Constraints
Script  : 04-Computed-Columns.sql
Purpose : Add and verify a computed column for customer full name display.
================================================================================
*/

SET NOCOUNT ON;

IF COL_LENGTH('sales.customers', 'full_name') IS NULL
BEGIN
    ALTER TABLE sales.customers
    ADD full_name AS (CONCAT(first_name, ' ', last_name));
END;
GO

SELECT TOP (10)
    customer_id,
    full_name,
    email
FROM sales.customers
ORDER BY customer_id;
GO
