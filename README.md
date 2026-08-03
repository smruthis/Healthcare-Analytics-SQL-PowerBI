# Healthcare Data Analytics

## 📌 Project Overview

This project analyzes healthcare data to understand patient demographics, healthcare utilization, encounter patterns, payer activity, and claim costs.

The project uses **Excel, MySQL, and Power BI** for data validation, analysis, visualization, and reporting.

---

## 🎯 Business Problem

The goal of this project was to analyze healthcare data and answer key questions such as:

- How many patients and encounters are recorded?
- Which encounter types have the highest volume and cost?
- Which payers have the highest encounter volume and claim costs?
- What are the major patient demographic patterns?
- Which conditions are most frequently associated with encounters?
- How do encounter volume and claim costs change over time?
- Are there any missing patient records?

---

## 🛠️ Tools Used

- **Excel** – Data validation and initial exploration
- **MySQL** – Data analysis and SQL queries
- **Power BI** – Data modeling, DAX, dashboards, and visualization

---

## 📂 Project Workflow

```text
Healthcare Dataset
       ↓
Excel Data Validation
       ↓
MySQL Analysis
       ↓
Power BI Data Modeling & DAX
       ↓
Interactive Dashboard
       ↓
Business Insights

🔍 Data Validation – Excel

Excel was used to review and validate the healthcare datasets before analysis.

The following checks were performed:

Reviewed columns, fields, and data structure
Checked for blank and missing values
Checked for duplicate records
Reviewed important IDs such as Patient ID, Encounter ID, and Payer ID
Reviewed categorical fields such as Gender and Encounter Class
Checked important numerical fields such as Claim Cost and Payer Coverage
Reviewed relationships between tables before SQL analysis and Power BI modeling

Excel was mainly used for data validation and exploration, not extensive data cleaning.

🧮 SQL Analysis – MySQL

MySQL was used to perform healthcare, patient, payer, and financial analysis.

Analysis Performed

Healthcare & Patient Analysis

Total patients and encounters
Unique patients vs. total encounters
Average encounters per patient
Encounters by gender
Encounters by year
Average length of stay

Financial Analysis

Total claim cost
Total payer coverage
Average claim cost
Claim cost by encounter type
Payer financial analysis

Payer Analysis

Payers by encounter volume
Payers ranked by total claim cost
Payer coverage analysis

Clinical Analysis

Top 10 encounter reasons
Encounter volume by encounter class

Data Quality Investigation

Compared Patient IDs between Patients and Encounters
Identified encounters linked to missing patient records
SQL Techniques Used
SELECT
WHERE
GROUP BY
ORDER BY
COUNT()
COUNT(DISTINCT)
SUM()
AVG()
ROUND()
JOIN
LEFT JOIN
CTEs
Window Functions
RANK()
YEAR()
TIMESTAMPDIFF()
LIMIT
