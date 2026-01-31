/*
 * Module: DDL - Database Management
 * Description: Creating and deleting databases.
 */

-- 1. Create a Test Database
CREATE DATABASE TestDb;
GO

-- 2. Verify creation using System Views
SELECT name 
FROM master.sys.databases
WHERE name = 'TestDb';
GO

-- 3. Drop the database
USE master;
DROP DATABASE IF EXISTS TestDb;
GO
