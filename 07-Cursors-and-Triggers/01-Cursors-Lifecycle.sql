/*
 * Module: Cursors
 * Description: Row-by-row processing logic.
 */

DECLARE 
    @product_name VARCHAR(MAX), 
    @list_price   DECIMAL;

-- 1. Declare Cursor
DECLARE cursor_product CURSOR FOR
    SELECT product_name, list_price 
    FROM production.products;

-- 2. Open Cursor
OPEN cursor_product;

-- 3. Fetch Data
FETCH NEXT FROM cursor_product INTO 
    @product_name, 
    @list_price;

-- 4. Loop through rows
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT @product_name + ' - ' + CAST(@list_price AS VARCHAR);
    
    FETCH NEXT FROM cursor_product INTO 
        @product_name, 
        @list_price;
END;

-- 5. Close and Deallocate
CLOSE cursor_product;
DEALLOCATE cursor_product;
