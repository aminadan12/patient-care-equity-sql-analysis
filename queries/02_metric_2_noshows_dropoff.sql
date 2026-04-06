-- Metric 2: Drop-off and no-shows

-- No-show rate by gender
SELECT
  p.gender,
  COUNT(*) AS appts_finalised,
  COUNTIF(a.status = 'No-show') AS no_shows,
  COUNTIF(a.status = 'No-show') / COUNT(*) AS no_show_rate
FROM `data-analytics-bootcamp-amina.hospital_management.appointments` a
JOIN `data-analytics-bootcamp-amina.hospital_management.patients` p
  ON a.patient_id = p.patient_id
WHERE a.status IN ('Completed', 'Cancelled', 'No-show')
GROUP BY p.gender
ORDER BY no_show_rate DESC;

-- No-show rate by insurance provider
SELECT
  p.insurance_provider,
  COUNT(*) AS appts_finalised,
  COUNTIF(a.status = 'No-show') AS no_shows,
  COUNTIF(a.status = 'No-show') / COUNT(*) AS no_show_rate
FROM `data-analytics-bootcamp-amina.hospital_management.appointments` a
JOIN `data-analytics-bootcamp-amina.hospital_management.patients` p
  ON a.patient_id = p.patient_id
WHERE a.status IN ('Completed', 'Cancelled', 'No-show')
GROUP BY p.insurance_provider
ORDER BY no_show_rate DESC;

-- No-show rate by age group
SELECT
  CASE
    WHEN DATE_DIFF(DATE '2023-07-01', p.date_of_birth, YEAR) < 18 THEN '0-17'
    WHEN DATE_DIFF(DATE '2023-07-01', p.date_of_birth, YEAR) BETWEEN 18 AND 34 THEN '18-34'
    WHEN DATE_DIFF(DATE '2023-07-01', p.date_of_birth, YEAR) BETWEEN 35 AND 49 THEN '35-49'
    WHEN DATE_DIFF(DATE '2023-07-01', p.date_of_birth, YEAR) BETWEEN 50 AND 64 THEN '50-64'
    ELSE '65+'
  END AS age_group,
  COUNT(*) AS appts_finalised,
  COUNTIF(a.status = 'No-show') AS no_shows,
  COUNTIF(a.status = 'No-show') / COUNT(*) AS no_show_rate
FROM `data-analytics-bootcamp-amina.hospital_management.appointments` a
JOIN `data-analytics-bootcamp-amina.hospital_management.patients` p
  ON a.patient_id = p.patient_id
WHERE a.status IN ('Completed', 'Cancelled', 'No-show')
GROUP BY age_group
ORDER BY no_show_rate DESC;

-- List patients with repeat no-shows (2+)
SELECT
  a.patient_id,
  p.gender,
  DATE_DIFF(DATE '2023-07-01', p.date_of_birth, YEAR) AS age_2023,
  p.insurance_provider,
  COUNTIF(a.status = 'No-show') AS no_show_count,
  COUNT(*) AS finalised_appt_count,
  COUNTIF(a.status = 'No-show') / COUNT(*) AS patient_no_show_rate
FROM `data-analytics-bootcamp-amina.hospital_management.appointments` a
JOIN `data-analytics-bootcamp-amina.hospital_management.patients` p
  ON a.patient_id = p.patient_id
WHERE a.status IN ('Completed', 'Cancelled', 'No-show')
GROUP BY a.patient_id, p.gender, age_2023, p.insurance_provider
HAVING no_show_count >= 2
ORDER BY no_show_count DESC, patient_no_show_rate DESC;

-- Repeat no-show rate by gender
SELECT
  gender,
  COUNT(*) AS patients_with_finalised_appts,
  COUNTIF(no_show_count >= 2) AS repeat_no_show_patients,
  COUNTIF(no_show_count >= 2) / COUNT(*) AS repeat_no_show_rate
FROM (
  SELECT
    a.patient_id,
    p.gender,
    COUNTIF(a.status = 'No-show') AS no_show_count
  FROM `data-analytics-bootcamp-amina.hospital_management.appointments` a
  JOIN `data-analytics-bootcamp-amina.hospital_management.patients` p
    ON a.patient_id = p.patient_id
  WHERE a.status IN ('Completed', 'Cancelled', 'No-show')
  GROUP BY a.patient_id, p.gender
)
GROUP BY gender
ORDER BY repeat_no_show_rate DESC;

-- Drop-off rate
WITH base AS (
  SELECT
    p.patient_id,
    MIN(CASE WHEN a.status = 'Completed' THEN a.appointment_date END) AS first_completed_date
  FROM `data-analytics-bootcamp-amina.hospital_management.patients` p
  LEFT JOIN `data-analytics-bootcamp-amina.hospital_management.appointments` a
    ON p.patient_id = a.patient_id
  GROUP BY p.patient_id
)
SELECT
  COUNT(*) AS patients_total,
  COUNTIF(first_completed_date IS NULL) AS patients_no_completed,
  COUNTIF(first_completed_date IS NULL) / COUNT(*) AS dropoff_rate
FROM base;
