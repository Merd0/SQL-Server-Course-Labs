/*
 * Module: Triggers
 * Description: Automating actions (Audit Log & Stock Updates).
 */

-- 1. Logging Trigger (Audit deleted orders)
CREATE TABLE sales.deleted_orders (
    order_id INT,
    customer_id INT,
    deleted_at DATETIME DEFAULT GETDATE()
);
GO

CREATE TRIGGER sales.trg_LogDeletedOrders
ON sales.orders
AFTER DELETE
AS
BEGIN
    INSERT INTO sales.deleted_orders (order_id, customer_id)
    SELECT order_id, customer_id
    FROM deleted;
END;
GO

-- 2. Stock Management Trigger
-- Automatically decreases stock when an order is placed
CREATE TRIGGER trg_UpdateStocks
ON sales.order_items
AFTER INSERT
AS
BEGIN
    UPDATE s
    SET quantity = s.quantity - i.quantity
    FROM production.stocks s
    INNER JOIN inserted i ON s.product_id = i.product_id
    WHERE s.store_id = 1; -- Example store logic
END;
GO
