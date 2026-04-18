/*
================================================================================
Module  : 05-Stored-Procedures
Script  : 03-Control-Flow-If-Else.sql
Purpose : Show clean branching logic with IF...ELSE based on revenue target.
================================================================================
*/

SET NOCOUNT ON;

DECLARE @sales_amount MONEY = 12000000;
DECLARE @target MONEY = 10000000;

IF @sales_amount >= @target
    PRINT CONCAT('Great! Target achieved. Sales: ', CONVERT(VARCHAR(30), @sales_amount));
ELSE
    PRINT CONCAT('Below target. Sales: ', CONVERT(VARCHAR(30), @sales_amount));
GO
