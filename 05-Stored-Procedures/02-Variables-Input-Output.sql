/*
================================================================================
Module  : 05-Stored-Procedures
Script  : 02-Variables-Input-Output.sql
Purpose : Demonstrate input + output parameters with a practical price filter.
================================================================================
*/

SET NOCOUNT ON;
GO

CREATE OR ALTER PROCEDURE dbo.uspFindProductsByPrice
    @min_price      DECIMAL(10,2),
    @product_count  INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        p.product_id,
        p.product_name,
        p.list_price
    FROM production.products AS p
    WHERE p.list_price >= @min_price
    ORDER BY p.list_price DESC;

    SELECT @product_count = COUNT(*)
    FROM production.products
    WHERE list_price >= @min_price;
END;
GO

DECLARE @count INT;
EXEC dbo.uspFindProductsByPrice
    @min_price = 500,
    @product_count = @count OUTPUT;

SELECT @count AS matching_product_count;
GO
