/*
 * Setup Script: University Database
 * Description: Creates a separate database for academic examples.
 * Source: Lab PDF - Week 1/2
 */

CREATE DATABASE UniversityDB;
GO

USE UniversityDB;
GO

-- 1. Create Department Table
CREATE TABLE department (
    dept_name VARCHAR(20) PRIMARY KEY,
    building VARCHAR(15),
    budget NUMERIC(12,2)
);

-- 2. Create Instructor Table
CREATE TABLE instructor (
    ID VARCHAR(5) PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    dept_name VARCHAR(20),
    salary NUMERIC(8,2),
    FOREIGN KEY (dept_name) REFERENCES department(dept_name)
);

-- 3. Insert Sample Data
INSERT INTO department VALUES ('Biology', 'Watson', 90000);
INSERT INTO department VALUES ('Comp. Sci.', 'Taylor', 100000);
INSERT INTO department VALUES ('Elec. Eng.', 'Taylor', 85000);
INSERT INTO department VALUES ('Finance', 'Painter', 120000);
INSERT INTO department VALUES ('History', 'Painter', 50000);
INSERT INTO department VALUES ('Music', 'Packard', 80000);
INSERT INTO department VALUES ('Physics', 'Watson', 70000);
GO
