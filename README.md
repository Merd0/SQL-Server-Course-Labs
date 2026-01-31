# 🚀 SQL Server & Database Management Systems Lab

This repository contains a comprehensive collection of SQL scripts, lab exercises, and notes from the **Database Management Systems** course. It demonstrates a complete progression from basic database concepts to advanced T-SQL programming using **Microsoft SQL Server**.

The exercises utilize two distinct datasets to simulate real-world scenarios:
1.  **BikeStores Database:** A retail system managing sales, inventory, and staff.
2.  **University Database:** An academic system managing departments, instructors, and courses.

## 📂 Repository Structure

The project is organized into modules corresponding to the course curriculum:

* **00-Database-Setup:** Installation scripts for BikeStores and University databases.
* **01-Introduction-DDL:** Database/Table creation, Identity columns, and Temporary Tables.
* **02-DataTypes-Constraints:** Data types (Decimal/Date), Constraints (PK/FK/Check), and Computed Columns.
* **03-Basic-Queries-Filtering:** `SELECT`, `ORDER BY`, `TOP`, `LIKE`, `BETWEEN`.
* **04-Joins-Relations:** `INNER`, `LEFT`, `RIGHT`, `FULL OUTER` Joins and Aliases.
* **05-Stored-Procedures:** Creating Procedures, Variables, and `IF...ELSE` logic.
* **06-Advanced-Set-Operators:** `UNION`, `INTERSECT`, `EXCEPT`, and `EXISTS`.
* **07-Cursors-and-Triggers:** Row-by-row processing (Cursors) and Automation Triggers (Audit/Stock).
  
### 🔹 08-Complex-Reporting (Business Intelligence)
This module demonstrates advanced SQL capabilities split into three levels of complexity:

* **Level 1 (Summary Reports):** Aggregating revenue by brands and evaluating store performance vs. staff count.
* **Level 2 (Window Functions):** Calculating Year-to-Date (YTD) cumulative sales and ranking top products per category without subqueries.
* **Level 3 (Executive Intelligence):** A complex Churn Risk Analysis using CTEs to identify high-value "Gold" customers who have become inactive, simulating a real-world CRM requirement.

## 🚀 How to Run
1.  Run scripts in `00-Database-Setup` to initialize the databases.
2.  Execute the scripts in sequential folders to follow the learning path.

---
*Created by [Mert Aydın] - 2026*
