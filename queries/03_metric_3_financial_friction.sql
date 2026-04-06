-- Metric 3: Financial friction in healthcare bills

-- Overall friction rate (excluding Pending)
SELECT
  COUNTIF(payment_status IN ('Paid','Failed')) AS bills_included,
  COUNTIF(payment_status = 'Failed') AS failed_bills,
  COUNTIF(payment_status = 'Failed') / COUNTIF(payment_status IN ('Paid','Failed')) AS friction_rate
FROM `data-analytics-bootcamp-amina.hospital_management.billing`;

-- Friction rate by insurance provider
SELECT
  p.insurance_provider,
  COUNTIF(b.payment_status IN ('Paid','Failed')) AS bills_included,
  COUNTIF(b.payment_status = 'Failed') AS failed_bills,
  COUNTIF(b.payment_status = 'Failed') / COUNTIF(b.payment_status IN ('Paid','Failed')) AS friction_rate
FROM `data-analytics-bootcamp-amina.hospital_management.billing` b
JOIN `data-analytics-bootcamp-amina.hospital_management.patients` p
  ON b.patient_id = p.patient_id
GROUP BY p.insurance_provider
ORDER BY friction_rate DESC;

-- Friction rate by gender
SELECT
  p.gender,
  COUNTIF(b.payment_status IN ('Paid','Failed')) AS bills_included,
  COUNTIF(b.payment_status = 'Failed') AS failed_bills,
  COUNTIF(b.payment_status = 'Failed') / COUNTIF(b.payment_status IN ('Paid','Failed')) AS failed_payment_rate
FROM `data-analytics-bootcamp-amina.hospital_management.billing` b
JOIN `data-analytics-bootcamp-amina.hospital_management.patients` p
  ON b.patient_id = p.patient_id
GROUP BY p.gender
ORDER BY failed_payment_rate DESC;

-- Friction rate by age group
WITH base AS (
  SELECT
    DATE_DIFF(DATE '2023-07-01', p.date_of_birth, YEAR) AS age_2023,
    b.payment_status
  FROM `data-analytics-bootcamp-amina.hospital_management.billing` b
  JOIN `data-analytics-bootcamp-amina.hospital_management.patients` p
    ON b.patient_id = p.patient_id
)
SELECT
  CASE
    WHEN age_2023 < 18 THEN '0-17'
    WHEN age_2023 BETWEEN 18 AND 34 THEN '18-34'
    WHEN age_2023 BETWEEN 35 AND 49 THEN '35-49'
    WHEN age_2023 BETWEEN 50 AND 64 THEN '50-64'
    ELSE '65+'
  END AS age_group,
  COUNTIF(payment_status IN ('Paid','Failed')) AS bills_included,
  COUNTIF(payment_status = 'Failed') AS failed_bills,
  COUNTIF(payment_status = 'Failed') / COUNTIF(payment_status IN ('Paid','Failed')) AS friction_rate
FROM base
GROUP BY age_group
ORDER BY friction_rate DESC;
