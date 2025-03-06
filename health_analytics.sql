-- 1. Count and Pct of F vs M that have OCD & -- Average Obsession Score by Gender
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

--2. Count of patients by Ethnicity and their respective Average Obsession Score

SELECT
     Ethnicity, 
	 COUNT('Patient ID') as patient_count,
	 ROUND(AVG("Y-BOCS Score (Obsessions)"),2) AS obs_score
FROM patient_data
GROUP BY Ethnicity
ORDER BY patient_count;

--3. Number of People diagnosed with OCD MoM

--ALTER TABLE patient_data
--ALTER COLUMN "OCD Diagnosis Date" TYPE DATE;

SELECT 
TO_CHAR("OCD Diagnosis Date", 'YYYY-MM-01 00:00:00') AS month,
--- "OCD Diagnosis Date"
COUNT("Patient ID") AS patient_count
FROM patient_data
GROUP BY 1
ORDER BY 1
;

-- 4. What is the most common Obsession Type (Count) & it's respective Average Obsession Score

SELECT 
"Obsession Type",
COUNT("Patient ID") AS patient_count,
ROUND(AVG("Y-BOCS Score (Obsessions)"),2) AS obs_score
FROM patient_data
GROUP BY 1
ORDER BY 2
;

-- 5. What is the most common Compulsion type (Count) & it's respective Average Obsession Score

SELECT 
"Compulsion Type",
COUNT("Patient ID") AS patient_count,
ROUND(AVG("Y-BOCS Score (Obsessions)"),2) AS obs_score
FROM patient_data
GROUP BY 1
ORDER BY 2
;