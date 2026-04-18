/*
================================================================================
Module  : 02-DataTypes-Constraints
Script  : 02-Keys-and-Constraints.sql
Purpose : Demonstrate primary/unique/check/default constraints in one table.
================================================================================
*/

SET NOCOUNT ON;

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'test')
    EXEC ('CREATE SCHEMA test');
GO

IF OBJECT_ID('test.membership', 'U') IS NOT NULL
    DROP TABLE test.membership;
GO

CREATE TABLE test.membership (
    member_id     INT IDENTITY(1,1) PRIMARY KEY,
    email         VARCHAR(255) NOT NULL UNIQUE,
    discount_rate DECIMAL(4,2) NOT NULL CHECK (discount_rate > 0),
    joined_date   DATE NOT NULL DEFAULT CAST(GETDATE() AS DATE)
);
GO

-- Sample data for verification
INSERT INTO test.membership (email, discount_rate)
VALUES ('member1@example.com', 5.00),
       ('member2@example.com', 10.50);

SELECT member_id, email, discount_rate, joined_date
FROM test.membership
ORDER BY member_id;
GO
