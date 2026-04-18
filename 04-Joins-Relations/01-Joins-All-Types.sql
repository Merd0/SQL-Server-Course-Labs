/*
================================================================================
Module  : 04-Joins-Relations
Script  : 01-Joins-All-Types.sql
Purpose : Demonstrate INNER, LEFT, and FULL OUTER JOIN behavior.
================================================================================
*/

SET NOCOUNT ON;

-- 1) INNER JOIN: products with matching category
SELECT
    p.product_id,
    p.product_name,
    c.category_name
FROM production.products AS p
INNER JOIN production.categories AS c
    ON p.category_id = c.category_id;

-- 2) LEFT JOIN: products with no related order item
SELECT
    p.product_id,
    p.product_name,
    i.order_id
FROM production.products AS p
LEFT JOIN sales.order_items AS i
    ON p.product_id = i.product_id
WHERE i.order_id IS NULL;

-- 3) FULL OUTER JOIN demo with standalone sample tables
IF OBJECT_ID('dbo.pm_members', 'U') IS NOT NULL DROP TABLE dbo.pm_members;
IF OBJECT_ID('dbo.pm_projects', 'U') IS NOT NULL DROP TABLE dbo.pm_projects;

CREATE TABLE dbo.pm_projects (
    project_id INT PRIMARY KEY,
    title      VARCHAR(50) NOT NULL
);

CREATE TABLE dbo.pm_members (
    member_id   INT PRIMARY KEY,
    member_name VARCHAR(50) NOT NULL,
    project_id  INT NULL
);

INSERT INTO dbo.pm_projects (project_id, title)
VALUES (1, 'New CRM'),
       (2, 'ERP Migration');

INSERT INTO dbo.pm_members (member_id, member_name, project_id)
VALUES (1, 'John', 1),
       (2, 'Jane', NULL);

SELECT
    m.member_name,
    p.title AS project_title
FROM dbo.pm_members AS m
FULL OUTER JOIN dbo.pm_projects AS p
    ON m.project_id = p.project_id
ORDER BY project_title, member_name;
GO
