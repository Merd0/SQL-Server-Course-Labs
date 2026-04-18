/*
================================================================================
Module  : 05-Stored-Procedures
Script  : 01-Create-Stored-Procedure.sql
Purpose : Create an idempotent stored procedure for reusable product listing.
================================================================================
*/

SET NOCOUNT ON;
GO

CREATE OR ALTER PROCEDURE dbo.uspProductList
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        p.product_id,
        p.product_name,
        p.list_price,
        p.model_year
    FROM production.products AS p
    ORDER BY p.product_name;
END;
GO

EXEC dbo.uspProductList;
GO
