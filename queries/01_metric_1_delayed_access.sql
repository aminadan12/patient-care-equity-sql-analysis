-- Metric 1: Delayed access to healthcare
-- Wait time = days from registration date to first completed appointment date

WITH base AS (
  SELECT
    p.patient_id,
    p.gender,
    DATE_DIFF(DATE '2023-07-01', p.date_of_birth, YEAR) AS age_2023,
    p.insurance_provider,
    p.registration_date,
    MIN(a.appointment_date) AS first_completed_date,
    DATE_DIFF(MIN(a.appointment_date), p.registration_date, DAY) AS wait_days
  FROM `data-analytics-bootcamp-amina.hospital_management.patients` p
  LEFT JOIN `data-analytics-bootcamp-amina.hospital_management.appointments` a
    ON p.patient_id = a.patient_id
   AND a.status = 'Completed'
  GROUP BY
    p.patient_id, p.gender, age_2023, p.insurance_provider, p.registration_date
)

-- Overall average wait time
SELECT
  AVG(wait_days) AS avg_wait_days
FROM base
WHERE wait_days IS NOT NULL;

-- Average wait time by gender
SELECT
  gender,
  COUNT(*) AS patients_total,
  COUNTIF(wait_days IS NOT NULL) AS patients_with_completed,
  ROUND(AVG(wait_days)) AS avg_wait_days
FROM base
GROUP BY gender
ORDER BY avg_wait_days DESC;

-- Average wait time by insurance provider
SELECT
  insurance_provider,
  COUNT(*) AS patients_total,
  COUNTIF(wait_days IS NOT NULL) AS patients_with_completed,
  ROUND(AVG(wait_days)) AS avg_wait_days
FROM base
GROUP BY insurance_provider
ORDER BY avg_wait_days DESC;

-- Average wait time by age group
SELECT
  CASE
    WHEN age_2023 < 18 THEN '0-17'
    WHEN age_2023 BETWEEN 18 AND 34 THEN '18-34'
    WHEN age_2023 BETWEEN 35 AND 49 THEN '35-49'
    WHEN age_2023 BETWEEN 50 AND 64 THEN '50-64'
    ELSE '65+'
  END AS age_group,
  COUNT(*) AS patients_total,
  COUNTIF(wait_days IS NOT NULL) AS patients_with_completed,
  ROUND(AVG(wait_days)) AS avg_wait_days
FROM base
GROUP BY age_group
ORDER BY avg_wait_days DESC;

-- Top 10 patients with the longest waits
SELECT
  patient_id,
  gender,
  age_2023,
  insurance_provider,
  registration_date,
  first_completed_date,
  wait_days
FROM base
WHERE wait_days IS NOT NULL
ORDER BY wait_days DESC
LIMIT 10;
