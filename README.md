# SQL Server Course Labs — From Fundamentals to Business Reporting

This repository is a **structured SQL Server learning portfolio** that documents my end-to-end progression in T-SQL:

- Database setup and schema design (DDL)
- Data types, keys, and constraints
- Querying, filtering, and joins
- Procedural SQL with stored procedures
- Advanced set operators and subquery patterns
- Automation with cursors and triggers
- Multi-level business reporting with window functions and executive KPIs

The labs are intentionally organized like a mini curriculum so a reviewer can quickly understand both **technical depth** and **learning discipline**.

---

## Tech Stack

- **Database:** Microsoft SQL Server
- **Language:** T-SQL
- **Datasets:**
  - **BikeStores** (retail sales/inventory/staff operations)
  - **UniversityDB** (academic departments/courses/instructors)

---

## Portfolio Goals

This repo is designed to show that I can:

1. Build and manage relational database structures.
2. Write clean, readable, and testable SQL scripts.
3. Move from basic queries to production-style reporting logic.
4. Solve business problems (sales performance, churn risk, ranking, YTD trends) using SQL only.

---

## Repository Roadmap

```text
00-Database-Setup
01-Introduction-DDL
02-DataTypes-Constraints
03-Basic-Queries-Filtering
04-Joins-Relations
05-Stored-Procedures
06-Advanced-Set-Operators
07-Cursors-and-Triggers
08-Complex-Reporting
```

### 00 — Database Setup
Environment initialization scripts for the two training databases.

- BikeStores object creation, data load, and cleanup
- UniversityDB creation + practice queries

### 01 — Introduction to DDL
Core schema operations and table lifecycle practices.

- `CREATE/DROP DATABASE`
- `CREATE/ALTER TABLE`
- `IDENTITY`, temporary tables

### 02 — Data Types & Constraints
Data quality and integrity fundamentals.

- Numeric/date/string type strategy
- `PRIMARY KEY`, `FOREIGN KEY`, `CHECK`, `DEFAULT`
- Computed columns and `SELECT INTO`

### 03 — Basic Queries & Filtering
Query foundation and data slicing patterns.

- `SELECT`, `TOP`, `ORDER BY`
- `WHERE`, `LIKE`, `BETWEEN`, conditional filtering

### 04 — Joins & Relations
Relational thinking and multi-table analysis.

- `INNER`, `LEFT`, `RIGHT`, `FULL OUTER JOIN`
- aliasing and readable query composition

### 05 — Stored Procedures
Reusable SQL programming patterns.

- creating procedures
- input/output parameters
- variables and `IF...ELSE` control flow

### 06 — Advanced Set Operators
Comparative querying and result-set logic.

- `UNION`, `INTERSECT`, `EXCEPT`
- `EXISTS`, `ANY`, `ALL`

### 07 — Cursors & Triggers
Database-side automation and event-driven behavior.

- cursor lifecycle and controlled row-by-row operations
- trigger-based validation/auditing scenarios

### 08 — Complex Reporting (Showcase Module)
This module represents the most business-oriented part of the repo.

- **Level 1:** summary reporting and store/brand performance
- **Level 2:** window functions for YTD totals and ranking logic
- **Level 3:** executive dashboard query for churn-risk detection (including CTE-driven customer segmentation)

---

## How to Run (Recommended Order)

1. Execute scripts in **`00-Database-Setup/`** first.
2. Continue folder-by-folder from **`01`** to **`08`**.
3. Treat each script as a focused lab and run sections incrementally.

> Tip: For review/demo sessions, start with `08-Complex-Reporting` after setup to quickly show advanced capability.

---

## What a Reviewer Can Expect

- Clear progression from beginner concepts to advanced analysis
- Practical SQL patterns that mirror real-world business requests
- Evidence of problem-solving beyond syntax memorization
- A reusable set of scripts suitable for interview walkthroughs

---

## Next Professionalization Steps (Planned)

- Add inline “problem statement → solution” headers to each lab file
- Add expected output snapshots for key reports
- Add indexing/performance notes (`SET STATISTICS IO/TIME`) for advanced queries
- Add transaction/error-handling labs (`TRY...CATCH`, rollback strategy)

---

## Author

**Mert Aydın**  
SQL Server / Database Management Systems Practice Repository (2026)
