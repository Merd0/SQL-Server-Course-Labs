/*
 * Module: Copying Data (Backup)
 * Description: Creating a new table from an existing one.
 */

CREATE SCHEMA marketing;
GO

-- Copy all customers from 'sales' schema to 'marketing' schema
SELECT *
INTO marketing.customers_backup
FROM sales.customers;
GO
