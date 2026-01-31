/*
 * Module: Joins
 * Description: INNER, LEFT, RIGHT, and FULL OUTER JOINS.
 */

-- 1. INNER JOIN (Returns matching records from both tables)
SELECT p.product_name, c.category_name
FROM production.products p
INNER JOIN production.categories c ON p.category_id = c.category_id;

-- 2. LEFT JOIN (Returns all from Left, matching from Right)
-- Useful to find products that have never been sold
SELECT p.product_name, i.order_id
FROM production.products p
LEFT JOIN sales.order_items i ON p.product_id = i.product_id
WHERE i.order_id IS NULL; 

-- 3. Setup for FULL OUTER JOIN Example (Project Management Context)
CREATE TABLE pm_projects (id INT, title VARCHAR(50));
CREATE TABLE pm_members (id INT, name VARCHAR(50), project_id INT);

INSERT INTO pm_projects VALUES (1, 'New CRM'), (2, 'ERP Migration');
INSERT INTO pm_members VALUES (1, 'John', 1), (2, 'Jane', NULL);

-- 4. FULL OUTER JOIN (Returns match in either Left or Right)
SELECT m.name, p.title
FROM pm_members m
FULL OUTER JOIN pm_projects p ON m.project_id = p.id;
