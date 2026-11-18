# hospital-patients-sql-analysis
SQL project analysing hospital patient and doctor data: filtering, aggregation, CASE statements and joins (SQL Server).

# Hospital Patients SQL Analysis

A SQL project analysing hospital patient and doctor data, completed as part of the TWDP programme (Cohort 1, Ilorin Innovation Hub). Queries were written for Microsoft SQL Server.

## What it covers
- Filtering data with `WHERE`, `AND`, `OR`, `IN` and `BETWEEN`
- Sorting and aggregation with `ORDER BY`, `TOP`, `DISTINCT`, `COUNT`, `AVG` and `GROUP BY`
- String and date functions such as `UPPER`, `LOWER`, `CONCAT`, `YEAR` and `MONTH`
- Conditional analysis with `CASE WHEN` and `HAVING`
- Joining the Patients and Doctors tables

## Questions answered
- Which patients had the longest hospital stays?
- How many patients are there for each medical condition?
- What is the average length of stay for each admission type?
- Which doctor has treated the most patients?

## Files
- `hospital_queries.sql`: all the queries, with the questions as comments
- `data/Patients.csv` and `data/Doctors.csv`: practice datasets (linked by `Doctor_ID`)
- `screenshots/`: query results

## How to run
1. In SQL Server Management Studio, import both CSV files as tables named `Patients` and `Doctors`.
2. Open `hospital_queries.sql` and run the queries.

## Skills used
SQL, data filtering, aggregation, conditional logic, joins
