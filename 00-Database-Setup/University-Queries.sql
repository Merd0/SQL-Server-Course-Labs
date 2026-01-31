/*
 * University Queries
 * Description: Basic analysis on the academic dataset.
 */

USE UniversityDB;
GO

-- 1. Find departments with high budgets (> 85k)
SELECT * FROM department
WHERE budget > 85000;

-- 2. Find instructors in the Computer Science department
SELECT name, salary 
FROM instructor 
WHERE dept_name = 'Comp. Sci.';
GO
