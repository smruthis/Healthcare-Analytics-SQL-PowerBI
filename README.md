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
```

---

# 🔍 Data Validation & Initial Data Exploration – Excel

Before starting the SQL analysis, the healthcare datasets were reviewed in Excel to understand the structure of the data and identify potential data-quality issues.

## 1. Column & Dataset Structure Check
Reviewed each table to understand:
- Number of columns
- Column names
- Available fields
- Data types and formats
- Key identifiers such as Patient ID, Encounter ID, Payer ID, and Organization ID

The healthcare datasets included information related to:
- Patients
- Encounters
- Payers
- Organizations
- Other healthcare-related entities

---

## 2. Missing / Blank Value Check
Checked the columns across the datasets for:
- Blank cells
- Missing values
- Null-like values
- Fields with incomplete information

Special attention was given to important fields such as:
- Patient IDs
- Encounter IDs
- Payer IDs
- Dates
- Encounter class
- Claim cost
- Payer coverage
- Patient demographic fields

---

## 3. Duplicate Check
Checked datasets for duplicate records to understand whether:
- Patient records were duplicated
- Encounter records were duplicated
- Identifier fields contained repeated values where uniqueness was expected

Repeated Patient IDs in the Encounters table were also reviewed because a patient can have multiple healthcare encounters.

---

## 4. Identifier & Relationship Validation
Reviewed key IDs across related tables to understand how the datasets connect.

Examples included:
- Patient ID between Patients and Encounters
- Payer ID between Payers and Encounters
- Organization ID between Organizations and related records

This helped validate the relationships required for later SQL joins and the Power BI data model.

---

## 5. Data Consistency Check
Reviewed values across important categorical and numerical fields to identify potential inconsistencies before analysis.

Examples included:
- Gender categories
- Encounter classes
- Payer names
- Claim cost values
- Payer coverage values
- Date fields

---

## 6. Initial Data Understanding
Excel was also used to understand the overall structure and contents of the healthcare dataset before moving to MySQL.

This initial review helped determine:
- Which tables were relevant for analysis
- Which columns could be used for KPIs
- Which fields could be used for grouping and filtering
- Which tables could be joined for deeper analysis

### Outcome
The Excel validation stage provided an initial understanding of the dataset and helped identify data-quality and relationship considerations before performing SQL analysis and building the Power BI dashboard.

> Excel was used primarily for **data validation and exploration**, rather than extensive data cleaning or transformation.

---

# 🧮 SQL Analysis – MySQL

MySQL was used to perform exploratory and business-focused analysis across the healthcare datasets.

## 📊 Basic Data Overview
The analysis included:
- Total number of patients
- Total number of encounters
- Total number of organizations
- Total number of payers

---

## 💰 Financial Analysis
Analyzed healthcare financial performance using:
- Total claim cost
- Total payer coverage
- Average claim cost
- Claim cost by encounter type
- Payer financial performance
- Average claim cost by payer
- Total coverage by payer

---

## 🏥 Healthcare Utilization Analysis
Analyzed healthcare utilization through:
- Encounters by encounter class
- Encounters by year
- Average encounters per patient
- Average length of stay by encounter class

---

## 👥 Patient Analysis
Analyzed patient and encounter relationships through:
- Unique patients vs. total encounters
- Encounters by gender
- Number of unique patients by gender
- Average encounters per patient
- Investigation of encounters associated with missing patient records

---

## 💳 Payer Analysis
Analyzed payer performance through:
- Payers ranked by encounter volume
- Payers ranked by total claim cost
- Total payer coverage
- Average claim cost by payer

---

## 🩺 Clinical Analysis
Analyzed clinical patterns through:
- Top 10 encounter reasons based on encounter volume
- Encounter reasons with missing or blank descriptions excluded from ranking

---

## 📅 Time-Based Analysis
Analyzed healthcare activity over time using:
- Encounter volume by year
- Total claim cost by year

This analysis was later used to create the **Encounters & Claim Cost Trend** visualization in Power BI.

---

## 🔗 Data Relationship & Data Quality Investigation
A specific investigation was performed to compare patient records in the Patients and Encounters tables.

The analysis included:
- Counting distinct patients in the Encounters table
- Comparing encounter patient IDs against the Patients table
- Identifying encounter records associated with a missing patient record
- Counting the number of affected encounters

This helped identify a data relationship issue before building the final dashboard.

---

## 🧠 Advanced SQL Techniques Used
The analysis used:
- `SELECT`
- `WHERE`
- `GROUP BY`
- `ORDER BY`
- `COUNT()`
- `COUNT(DISTINCT ...)`
- `SUM()`
- `AVG()`
- `ROUND()`
- `JOIN`
- `LEFT JOIN`
- Common Table Expressions (CTEs)
- Window Functions
- `RANK() OVER()`
- `YEAR()`
- `TIMESTAMPDIFF()`
- `IS NULL`
- `TRIM()`
- `LIMIT`

The project included a **CTE + RANK()** analysis to rank payers based on total claim cost.

---

# 📊 Power BI Analysis & Dashboard

The validated healthcare datasets and SQL analysis were used to build an interactive Power BI dashboard.

The dashboard consists of **two pages**, designed to provide both an overall healthcare operations view and detailed patient and clinical insights.

---

## 📄 Page 1 – Healthcare Analytics Overview

### Focus
This page provides a high-level overview of:
- Patient activity
- Healthcare encounter volume
- Claim costs
- Payer coverage
- Encounter types
- Payer performance
- Cost trends over time

### 📌 KPIs

**Patients with Encounters**
Shows the number of unique patients associated with healthcare encounters.

**Total Encounters**
Shows the total number of recorded healthcare encounters.

**Total Claim Cost**
Shows the total claim cost across encounters.

**Total Coverage**
Shows the total amount covered by payers.

**Average Cost**
Shows the average claim cost per encounter.

### 📈 Visualizations

**Encounters & Claim Cost Trend**
A combined chart showing:
- Total encounters by year
- Total claim cost by year

This helps identify changes in healthcare utilization and claim costs over time.

**Encounters by Encounter Type**
Shows encounter volume across different encounter classes, including:
- Ambulatory
- Outpatient
- Urgent Care
- Emergency
- Wellness
- Inpatient

**Claim Cost by Encounter Type**
Compares total claim costs across encounter types to identify the categories contributing the most to overall healthcare expenditure.

**Encounters by Payer**
Shows the number of encounters associated with each payer and highlights payer-level utilization patterns.

### 🎛️ Page 1 Filters
Interactive slicers were added for:
- **Year**
- **Encounter Type**
- **Payer**

These filters allow users to dynamically explore specific periods, encounter categories, and payer groups.

---

## 📄 Page 2 – Patient & Clinical Insights

### Focus
This page focuses on:
- Patient demographics
- Age distribution
- Gender distribution
- Race distribution
- Clinical conditions
- Patient utilization

### 📌 KPIs

**Patients with Encounters**
Shows the number of unique patients associated with recorded encounters.

**Average Patient Age**
Shows the average age of patients included in the analysis.

**Male Patients**
Shows the number of male patients.

**Female Patients**
Shows the number of female patients.

**Average Encounters per Patient**
Shows the average number of healthcare encounters per patient.

### 📊 Visualizations

**Patients by Gender**
Compares the number of male and female patients.

**Patients by Age Group**
Shows patient distribution across different age groups and helps highlight the age profile of the patient population.

**Top Conditions by Encounters**
Displays the most frequently occurring conditions or encounter reasons based on encounter volume.

A Top N filter was used to focus the visualization on the most relevant conditions.

**Patients by Race**
Shows the distribution of patients across race categories.

### 🎛️ Page 2 Filters
Interactive slicers were added for:
- **Year**
- **Gender**
- **Race**

These filters allow users to explore patient and clinical patterns across different demographic groups and time periods.

---

## 🔢 Power BI Data Modeling & DAX

Power BI was used to create relationships between the healthcare tables and build measures for dashboard KPIs and visualizations.

DAX measures were created for key metrics such as:
- Patients with Encounters
- Total Encounters
- Total Claim Cost
- Total Payer Coverage
- Average Claim Cost
- Average Patient Age
- Male Patients
- Female Patients
- Average Encounters per Patient

The dashboard was designed so that slicer selections dynamically update the relevant KPIs and visualizations.

---

## 📊 Dashboard Preview

### Healthcare Analytics Overview
![image alt](https://github.com/smruthis/Healthcare-Analytics-SQL-PowerBI/blob/297ec33d29df78a5f69670670ee763192366c206/Power%20BI/Healthcare%20analytics%20overview.png)

### Patient & Clinical Insights
![image alt](https://github.com/smruthis/Healthcare-Analytics-SQL-PowerBI/blob/297ec33d29df78a5f69670670ee763192366c206/Power%20BI/Patients%20%26%20Clinical%20Insights.png)
