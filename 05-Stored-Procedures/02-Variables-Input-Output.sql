/*
 * Module: SP Parameters & Variables
 */

CREATE PROCEDURE uspFindProductsByPrice
    @min_price DECIMAL(10,2)
AS
BEGIN
    SELECT product_name, list_price
    FROM production.products
    WHERE list_price >= @min_price;
END;
GO

-- Example: Find products more expensive than $500
EXEC uspFindProductsByPrice 500;
