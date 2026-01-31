/*
 * Module: DDL - Table Management
 * Description: Creating tables with Identity columns and altering structures.
 */

USE BikeStores;
GO

-- 1. Create 'visits' table with IDENTITY (Auto Increment)
CREATE TABLE sales.visits (
    visit_id INT PRIMARY KEY IDENTITY (1, 1),
    first_name VARCHAR (50) NOT NULL,
    last_name VARCHAR (50) NOT NULL,
    visited_at DATETIME,
    phone VARCHAR(20),
    store_id INT NOT NULL
    -- Note: Foreign key definition would go here normally
);
GO

-- 2. Alter Table: Add a new column
ALTER TABLE sales.visits
ADD notes VARCHAR(255);
GO

-- 3. Alter Table: Delete a column
ALTER TABLE sales.visits
DROP COLUMN notes;
GO
