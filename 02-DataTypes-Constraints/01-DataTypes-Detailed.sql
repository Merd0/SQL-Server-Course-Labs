/*
================================================================================
Module  : 02-DataTypes-Constraints
Script  : 01-DataTypes-Detailed.sql
Purpose : Demonstrate precision/scale behavior and date-time extraction in T-SQL.
================================================================================
*/

SET NOCOUNT ON;

/*
1) DECIMAL precision/scale demo
   DECIMAL(p,s): p = total digits, s = digits after decimal point
*/
DECLARE @price DECIMAL(10, 2) = 149.99;

/*
2) Date/Time demo
   - GETDATE() returns datetime
   - Explicit casts show DATE and TIME usage clearly
*/
DECLARE @currentDate DATE = CAST(GETDATE() AS DATE);
DECLARE @currentTime TIME(0) = CAST(GETDATE() AS TIME(0));

SELECT
    @price       AS unit_price,
    @currentDate AS today_date,
    @currentTime AS current_time;
GO
