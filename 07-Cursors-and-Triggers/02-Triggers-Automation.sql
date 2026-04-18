/*
================================================================================
Module  : 07-Cursors-and-Triggers
Script  : 02-Triggers-Automation.sql
Purpose : Implement audit + stock update triggers with rerunnable setup.
================================================================================
*/

SET NOCOUNT ON;
GO

IF OBJECT_ID('sales.deleted_orders', 'U') IS NULL
BEGIN
    CREATE TABLE sales.deleted_orders (
        order_id    INT NOT NULL,
        customer_id INT NULL,
        deleted_at  DATETIME2(0) NOT NULL DEFAULT SYSDATETIME()
    );
END;
GO

CREATE OR ALTER TRIGGER sales.trg_LogDeletedOrders
ON sales.orders
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO sales.deleted_orders (order_id, customer_id)
    SELECT d.order_id, d.customer_id
    FROM deleted AS d;
END;
GO

CREATE OR ALTER TRIGGER sales.trg_UpdateStocks
ON sales.order_items
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE s
    SET s.quantity = s.quantity - i.quantity
    FROM production.stocks AS s
    INNER JOIN inserted AS i
        ON s.product_id = i.product_id
       AND s.store_id = i.store_id;
END;
GO
