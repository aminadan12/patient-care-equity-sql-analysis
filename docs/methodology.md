# Methodology

## Dataset Scope
This project uses hospital data from January to December 2023.

The dataset includes:
- 3 hospital branches: Central Hospital, Westside Clinic, and Eastside Clinic
- 50 patients
- 10 doctors
- 200 appointments

## Variables Used
The analysis uses:
- patient demographics such as age and gender
- service-use data such as appointments and treatments
- billing and payment fields

## Limitations
The dataset does not include:
- ethnicity
- household income
- patient outcomes
- qualitative appointment or patient experience notes

Because of this, the analysis can identify patterns but cannot fully explain the causes behind them.

## Metric Definitions

### Metric 1: Delayed Access to Care
Measured as the number of days between registration date and the patient’s first completed appointment.

### Metric 2: Drop-Off and No-Shows
Measured using:
- no-show rates
- repeat no-show rates
- the share of patients with no completed appointment in the recorded pathway

### Metric 3: Financial Friction
Measured using failed payment rates among bills with a final payment status, excluding pending payments.
