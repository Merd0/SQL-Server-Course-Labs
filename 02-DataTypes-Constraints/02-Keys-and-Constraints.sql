/*
 * Module: Constraints
 * Description: Implementing PK, FK, CHECK, UNIQUE, DEFAULT.
 */

CREATE SCHEMA test;
GO

CREATE TABLE test.membership (
    member_id INT PRIMARY KEY IDENTITY,
    email VARCHAR(255) UNIQUE,         -- No duplicate emails allowed
    discount_rate DECIMAL(4,2) CHECK (discount_rate > 0), -- Must be positive
    joined_date DATE DEFAULT GETDATE() -- Default value if null
);
GO
