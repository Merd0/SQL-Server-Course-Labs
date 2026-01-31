/*
 * Module: Computed Columns
 * Description: Columns that automatically calculate values.
 */

-- Add 'full_name' as a computed column combining first and last name
ALTER TABLE sales.customers
ADD full_name AS (first_name + ' ' + last_name);
GO

-- Verification: Select logic without needing string concatenation in query
SELECT TOP 5 
    customer_id,
    full_name, 
    email 
FROM sales.customers;
GO
