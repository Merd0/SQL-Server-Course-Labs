# SQL Server Course Labs — Learning Roadmap

**English | [Türkçe](LEARNING_PATH.tr.md)** · [Back to English README](README.md)

Use this path to study the **existing SQL scripts**, not a translated copy of executable SQL. The language changes the explanation and navigation; the SQL examples themselves are shared.

## Prerequisites

Set up a local or test-only Microsoft SQL Server instance and use a T-SQL editor. Do not run `DROP`, data loads, triggers, or mutating scripts on production databases.

## Recommended sequence

| Stage | Folder | Competency |
| --- | --- | --- |
| 00 | [00-Database-Setup](00-Database-Setup/) | Set up BikeStores and UniversityDB |
| 01 | [01-Introduction-DDL](01-Introduction-DDL/) | CREATE/DROP/ALTER and temporary tables |
| 02 | [02-DataTypes-Constraints](02-DataTypes-Constraints/) | Keys, constraints, types, computed columns |
| 03 | [03-Basic-Queries-Filtering](03-Basic-Queries-Filtering/) | SELECT, WHERE, LIKE, TOP, ORDER BY |
| 04 | [04-Joins-Relations](04-Joins-Relations/) | INNER, LEFT, RIGHT, FULL OUTER JOIN |
| 05 | [05-Stored-Procedures](05-Stored-Procedures/) | Parameters, variables, IF/ELSE |
| 06 | [06-Advanced-Set-Operators](06-Advanced-Set-Operators/) | UNION, INTERSECT, EXCEPT, EXISTS |
| 07 | [07-Cursors-and-Triggers](07-Cursors-and-Triggers/) | Cursors and event-driven triggers |
| 08 | [08-Complex-Reporting](08-Complex-Reporting/) | Windows, YTD reports, customer segmentation |

**Study method:** Read each script, identify its expected tables and side effects, run it in a safe environment, verify the result, and record why each SQL construct was chosen.

For a portfolio walkthrough, complete database setup and then explore [the executive reporting module](08-Complex-Reporting/). Treat query results as sample-dataset demonstrations rather than verified real-world business insights.

[English README](README.md) · [Türkçe öğrenme yolu](LEARNING_PATH.tr.md)
