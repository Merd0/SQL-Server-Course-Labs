/*
================================================================================
Module  : 07-Cursors-and-Triggers
Script  : 01-Cursors-Lifecycle.sql
Purpose : Demonstrate full cursor lifecycle with safe cleanup.
================================================================================
*/

SET NOCOUNT ON;

DECLARE
    @product_name NVARCHAR(255),
    @list_price   DECIMAL(10,2);

DECLARE cursor_product CURSOR LOCAL FAST_FORWARD FOR
    SELECT p.product_name, p.list_price
    FROM production.products AS p
    ORDER BY p.product_name;

OPEN cursor_product;

FETCH NEXT FROM cursor_product INTO @product_name, @list_price;
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT CONCAT(@product_name, ' - ', CONVERT(VARCHAR(32), @list_price));
    FETCH NEXT FROM cursor_product INTO @product_name, @list_price;
END;

CLOSE cursor_product;
DEALLOCATE cursor_product;
GO
