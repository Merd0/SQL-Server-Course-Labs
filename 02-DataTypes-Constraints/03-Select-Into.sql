/*
================================================================================
Module  : 02-DataTypes-Constraints
Script  : 03-Select-Into.sql
Purpose : Create a backup table from an existing source with SELECT INTO.
================================================================================
*/

SET NOCOUNT ON;

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'marketing')
    EXEC ('CREATE SCHEMA marketing');
GO

IF OBJECT_ID('marketing.customers_backup', 'U') IS NOT NULL
    DROP TABLE marketing.customers_backup;
GO

SELECT
    customer_id,
    first_name,
    last_name,
    phone,
    email,
    street,
    city,
    state,
    zip_code
INTO marketing.customers_backup
FROM sales.customers;
GO

SELECT COUNT(*) AS backup_row_count
FROM marketing.customers_backup;
GO
