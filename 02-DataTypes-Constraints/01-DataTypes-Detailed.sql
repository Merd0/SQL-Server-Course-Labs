/*
 * Module: Data Types
 * Description: Working with Decimal, Date, and Time.
 */

-- 1. Decimal vs Numeric (Fixed precision)
-- DECIMAL(p,s): p = total digits, s = decimal digits
DECLARE @price DECIMAL(10, 2);
SET @price = 149.99;

-- 2. Date and Time
DECLARE @currentDate DATE = GETDATE();
DECLARE @currentTime TIME = GETDATE();

-- Display values
SELECT @price AS Price, @currentDate AS Today, @currentTime AS Now;
GO
