# Equity and Efficiency in Patient Care with SQL

## Overview
This project analyses equity and efficiency in patient care using SQL on a 2023 hospital dataset. The analysis focuses on access delays, appointment no-shows, and financial friction in billing.

## Dataset
- Jan–Dec 2023
- 3 hospital branches
- 50 patients
- 10 doctors
- 200 appointments

## Tools Used
- SQL
- BigQuery
- GitHub

## Metrics Analyzed
1. Delayed access to care
2. Appointment drop-off and no-shows
3. Financial friction in billing

## Key Findings
- Average wait time to first completed appointment: 345 days
- Women experienced longer wait times than men
- Overall drop-off rate: 34%
- Men were more likely to be repeat no-shows
- Failed payment rate among finalized bills: 51.1%
- Failed payments were highest among older groups and varied by insurance provider

## Project Files
- `queries/01_metric_1_delayed_access.sql` – wait time analysis
- `queries/02_metric_2_noshows_dropoff.sql` – no-show and drop-off analysis
- `queries/03_metric_3_financial_friction.sql` – billing friction analysis
- `results/findings.md` – summary of insights and recommendations
- `docs/literature_review.md` – healthcare context and background
- `docs/methodology.md` – dataset scope, metric definitions, and limitations
- `docs/discussion.md` – interpretation of findings

## Conclusion
This project uses SQL to examine how inefficiency and inequity can appear together in patient care pathways.
