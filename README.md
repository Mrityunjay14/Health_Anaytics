## 📌 Project Overview
This project is a **comprehensive data analysis** of healthcare data using **SQL, Power BI, and Excel**. The goal is to **extract meaningful insights** from patient records, diagnosis trends, and other key health metrics.

## 📊 Tools & Technologies Used
- **PostgreSQL (PGSQL)** for data extraction and transformation
- **Power BI** for interactive dashboards and visualization
- **Microsoft Excel** for data cleaning and additional reporting

## 📂 Project Workflow
1. **Data Collection & Cleaning**
   - Imported healthcare data into PostgreSQL
   - Performed data cleaning using SQL queries
   - Handled missing values and ensured data consistency

2. **Exploratory Data Analysis (EDA) using SQL**
   - Aggregated patient records by demographics, diagnosis, and treatments
   - Used `GROUP BY`, `JOIN`, `CTE`, and `WINDOW FUNCTIONS` for advanced analysis

3. **Data Visualization with Power BI**
   - Built **interactive dashboards** for healthcare trends
   - Designed KPIs for patient count, diagnosis rates, and demographic insights

4. **Reporting & Insights**
   - Generated Excel reports for stakeholders
   - Identified trends in patient demographics and disease spread

## 📌 Key SQL Queries Used
- **Patient Count by Gender**
  ```sql
WITH data AS (
    SELECT 
        Gender, 
        COUNT("Patient ID") AS patient_count,
        ROUND(AVG("Y-BOCS Score (Obsessions)")::NUMERIC, 2) AS avg_obs_score
    FROM patient_data
    GROUP BY Gender
    ORDER BY patient_count
)
SELECT 
    SUM(CASE WHEN Gender= 'Female' then patient_count else 0 END) as count_female,
    SUM(CASE WHEN Gender= 'Male' then patient_count else 0 END) as count_male,

    ROUND(SUM(CASE WHEN Gender= 'Female' then patient_count else 0 END)/
    (SUM(CASE WHEN Gender= 'Female' then patient_count else 0 END)+SUM(CASE WHEN Gender= 'Male' then patient_count else 0 END)) * 100,2)
AS pct_female,
	
	 ROUND(SUM(CASE WHEN Gender= 'Male' then patient_count else 0 END)/
    (SUM(CASE WHEN Gender= 'Female' then patient_count else 0 END)+SUM(CASE WHEN Gender= 'Male' then patient_count else 0 END)) * 100,2)
AS pct_male

FROM data;
  ```
- **Count of patients by Ethnicity and their respective Average Obsession Score**
  ```sql
 SELECT
     Ethnicity, 
	 COUNT('Patient ID') as patient_count,
	 ROUND(AVG("Y-BOCS Score (Obsessions)"),2) AS obs_score
FROM patient_data
GROUP BY Ethnicity
ORDER BY patient_count;
  ```, etc.

## 📊 Power BI Dashboard Preview
![Screenshot](D:\Desktop\Badlav\Health Analytics(Excel+SQL+PowerBI)\Health_Analytics.png)

## 📂 Files Included
-'health_analytics.sql' - SQL queries for generating insights from the dataset
-'Health_Analytics.pbix' - Powerbi file containing interactive dashboard and visualization
-'Health_Analytics.xlsx' - Excel file containing insights and dashboards
-'ocd_patient_dataset.csv' - Excel file containing raw data of patients
-'README.md' - Project documentation

## 🚀 How to Use This Repository
1. **Clone the Repository**:
   ```sh
   git clone https://github.com/Mrityunjay14/Health-Analytics-SQL-PowerBI-Excel.git
   ```
2. **Open SQL Scripts** in PostgreSQL or any SQL IDE
3. **Load the Data** into Power BI and Excel
4. **Explore Dashboards & Reports**

## 📌 Conclusion
This project demonstrates **real-world data analytics skills** by integrating SQL, Power BI, and Excel to generate healthcare insights. It is a valuable addition to any **Data Analyst Portfolio**.

---
🚀 **Connect with me on LinkedIn**: [Mrityunjay Gupta](https://www.linkedin.com/in/mrityunjay-gupta-663290263/)  
