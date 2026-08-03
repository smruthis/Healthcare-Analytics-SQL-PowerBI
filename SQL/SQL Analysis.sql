use hospital_db

#How many patients are in the database?
SELECT COUNT(*) AS total_patients
FROM patients;

#How many encounters are recorded?
SELECT COUNT(*) AS total_encounters
FROM encounters;

#How many organizations are in the database?
SELECT COUNT(*) AS total_organizations
FROM organizations;

#How many payers are there?
SELECT COUNT(*) AS total_payers
FROM payers;

#Total Claim Cost
SELECT SUM(TOTAL_CLAIM_COST) AS total_claim_cost
FROM encounters;

#Total Payer Coverage
SELECT SUM(PAYER_COVERAGE) AS total_payer_coverage
FROM encounters;

#Average Claim Cost
SELECT AVG(TOTAL_CLAIM_COST) AS avg_claim_cost
FROM encounters;

#Encounters by Encounter Class
SELECT 
    ENCOUNTERCLASS,
    COUNT(*) AS total_encounters
FROM encounters
GROUP BY ENCOUNTERCLASS
ORDER BY total_encounters DESC;

#Which encounter type generates the highest claim cost?
SELECT 
    ENCOUNTERCLASS,
    COUNT(*) AS total_encounters,
    ROUND(SUM(TOTAL_CLAIM_COST), 2) AS total_claim_cost,
    ROUND(AVG(TOTAL_CLAIM_COST), 2) AS avg_claim_cost
FROM encounters
GROUP BY ENCOUNTERCLASS
ORDER BY total_claim_cost DESC;

#Which payer has the highest number of encounters?
SELECT
    p.NAME AS payer_name,
    COUNT(*) AS total_encounters
FROM encounters e
JOIN payers p
    ON e.PAYER = p.Id
GROUP BY p.NAME
ORDER BY total_encounters DESC;

#Payer Financial Analysis
SELECT
    p.NAME AS payer_name,
    COUNT(*) AS total_encounters,
    ROUND(SUM(e.TOTAL_CLAIM_COST), 2) AS total_claim_cost,
    ROUND(SUM(e.PAYER_COVERAGE), 2) AS total_payer_coverage,
    ROUND(AVG(e.TOTAL_CLAIM_COST), 2) AS avg_claim_cost
FROM encounters e
JOIN payers p
    ON e.PAYER = p.Id
GROUP BY p.NAME
ORDER BY total_claim_cost DESC;

#Unique Patients vs Encounters
SELECT COUNT(DISTINCT PATIENT) AS unique_patients
FROM encounters;

SELECT DISTINCT e.PATIENT
FROM encounters e
LEFT JOIN patients p
    ON e.PATIENT = p.Id
WHERE p.Id IS NULL;

#How many encounters are affected?
SELECT 
    COUNT(*) AS missing_patient_encounters
FROM encounters
WHERE PATIENT = '204f8028-72f8-d6f8-761f-79ebf9f02311';

#Average Encounters per Patient
SELECT 
    ROUND(COUNT(*) / COUNT(DISTINCT PATIENT), 2) AS avg_encounters_per_patient
FROM encounters;

#Encounters by Gender
SELECT
    p.GENDER,
    COUNT(*) AS total_encounters,
    COUNT(DISTINCT e.PATIENT) AS unique_patients
FROM encounters e
JOIN patients p
    ON e.PATIENT = p.Id
GROUP BY p.GENDER
ORDER BY total_encounters DESC;

#Encounters by Year
SELECT
    YEAR(START) AS encounter_year,
    COUNT(*) AS total_encounters,
    ROUND(SUM(TOTAL_CLAIM_COST), 2) AS total_claim_cost
FROM encounters
GROUP BY YEAR(START)
ORDER BY encounter_year;

#Top 10 Encounter Reasons
SELECT
    REASONDESCRIPTION,
    COUNT(*) AS total_encounters
FROM encounters
WHERE REASONDESCRIPTION IS NOT NULL
  AND TRIM(REASONDESCRIPTION) <> ''
GROUP BY REASONDESCRIPTION
ORDER BY total_encounters DESC
LIMIT 10;

#Average Length of Stay
SELECT
    ENCOUNTERCLASS,
    COUNT(*) AS total_encounters,
    ROUND(AVG(TIMESTAMPDIFF(HOUR, START, STOP) / 24), 2) AS avg_length_of_stay_days
FROM encounters
WHERE STOP IS NOT NULL
GROUP BY ENCOUNTERCLASS
ORDER BY avg_length_of_stay_days DESC;

#Rank Payers by Total Claim Cost
WITH payer_summary AS (
    SELECT
        p.NAME AS payer_name,
        COUNT(*) AS total_encounters,
        SUM(e.TOTAL_CLAIM_COST) AS total_claim_cost
    FROM encounters e
    JOIN payers p
        ON e.PAYER = p.Id
    GROUP BY p.NAME
)

SELECT
    payer_name,
    total_encounters,
    ROUND(total_claim_cost, 2) AS total_claim_cost,
    RANK() OVER (ORDER BY total_claim_cost DESC) AS cost_rank
FROM payer_summary
ORDER BY cost_rank;

