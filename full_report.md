# Equity and Efficiency in Patient Care

## Objective
Identify gaps in care delivery, treatment delays, and demographic disparities to promote equitable and efficient patient care across all populations.

## Dataset
Jan - Dec 2023; 3 hospital branches (Central/Westside/Eastside); 50 patients; 10 doctors; 200 appointments.

## Analysis Limitations
Lacking data on ethnicity, household income, patient outcomes, and qualitative insights.

## Contents
1. [Introduction](#1-introduction-why-equity-and-efficiency-are-inseparable-in-us-patient-care)
2. [Key Metrics](#2-key-performance-metrics)
   - [Delayed access to health care](#21-metric-1-delayed-access-to-health-care-registration-to-first-completed-appointment)
   - [Drop-off and disrupted attendance for hospital appointments](#22-metric-2-drop-off-and-disrupted-attendance-to-hospital-appointments)
   - [Financial friction in healthcare bills](#23-metric-3-financial-friction-in-healthcare-bills)
3. [Discussion](#3-discussion)
4. [References](#4-references)
5. Appendix

---

## 1. Introduction: Why equity and efficiency are inseparable in US patient care

Equity and efficiency in patient care are often discussed separately, but in practice they are tightly linked. When patients face barriers to access (financial, logistical, or social), care becomes less timely and less continuous, and health systems show inefficiency through missed appointments, delayed treatment, and fragmented care. Different patients face different barriers to care, showing inequity in access and health care provision. Comparative work such as *The Commonwealth Fund’s Mirror, Mirror 2024* report situates the US particularly as an outlier among peer nations in health care areas like access, efficiency, equity, and outcomes. This provides a useful backdrop for analysing care delays, missed appointments, and payment troubles within a single US hospital, and whether these issues apply more to certain demographics, signifying inequity.

This report analyses a hospital dataset covering January–December 2023 across three branches (Central Hospital, Westside Clinic, and Eastside Clinic). While the database includes patient demographics (age, gender), service use (appointments, treatments), and billing/payment fields, it does not include ethnicity, household income, or qualitative appointment notes. The wider literature briefly discussed in the following introduction therefore helps to give wider context of healthcare inequality in the US, and helps to inform the focus of three key performance metrics for this report.

A consistent finding across US health services research is that access barriers are not only about whether care exists, but whether patients can obtain it in a timely way. In the context of equity, “delay” is especially important because it can be distributed unevenly, with some patients experiencing financial delays or gender bias that other patients do not. Metric one will therefore focus on investigating delays in care segmented across different demographics to highlight inequity between groups.

Another focus of US healthcare research is missed appointments, often seen as patient non-compliance. However, health equity research emphasises that non-attendance often reflects structural barriers, such as being unable to afford out-of-pocket costs, having unpredictable work schedules, transport constraints, caregiving responsibilities, or prior negative experiences with care. Work summarised by KFF on Americans’ healthcare cost concerns consistently highlights that affordability worries are widespread, and that cost pressures can lead people to postpone or skip needed care. These pressures are also not evenly distributed across demographics. Therefore, Metric two will report on appointment completion rate, no-show rates, and repeat no-shows, again segmented by gender, age, and insurance provider.

A central theme in US equity research is that insurance coverage does not always make health care affordable for the patient in question. For example, the Commonwealth Fund reports that underinsurance can still create barriers, as insurance providers don’t fully cover the costs of necessary care. Even without household income data in this dataset, billing and payment patterns can function as signals of financial friction; for example, if certain groups have higher rates of failed payments. This does not prove that finances caused missed care, but it can imply it, especially when consistent with the broader literature, and help point to where further qualitative investigation is needed. Metric 3 will investigate payment friction, such as failed payments segmented by insurance providers and age groups, in order to understand financial issues as a barrier to health care.

To summarise, the literature points to three recurring, measurable points where inequity and inefficiency appear in real patient pathways, and can be used to analyse this hospital dataset:

1. Delayed access to health care  
2. Drop-off and disrupted attendance to hospital appointments  
3. Financial friction in healthcare bills  

The remainder of the report applies these metrics to the 2023 hospital dataset, segments results by details provided by the dataset, and presents patterns observed in the data with actionable improvement recommendations grounded in the findings.

---

## 2. Key Performance Metrics

### 2.1. Metric 1: Delayed access to health care (registration to first completed appointment)

Overall, time from registration to first attended care is very long (average 345 days). However, as this metric was calculated from the gap between registration and first completed appointment, it must be acknowledged that many patients may register well before engaging with the services. Therefore, it cannot be interpreted solely in terms of scheduling wait-times.

However, as acknowledged in the above discussion, different demographics have been shown to put off seeking care due to structural barriers. This makes the below averaged findings interesting:

- Women experience longer wait times than men (443 vs 309 days).
- Wait time for the 35–49 age group is significantly higher than the rest (433 days).

These insights highlight key trends that warrant further research, with a particular need for qualitative insights. Previous literature has suggested social stigma and financial barriers lead patients to delay seeking care, warranting further investigation to determine if this is the case here.

**Actionable recommendation:** More qualitative data to determine reasons for delay and long wait times.

### 2.2. Metric 2: Drop-off and disrupted attendance to hospital appointments

Missed care is a major efficiency problem in this pathway, with high no-show rates across finalised appointments and clear group differences:

- Men “no-show” slightly more than women (36.5% vs 32.1%) and are far more likely to repeatedly “no-show” (35.7% vs 15.8%).
- Older age groups show the highest non-attendance (notably 65+ at 50%).
- MedCare Plus insurance patients show a significantly higher no-show rate (42%).
- Overall drop-off rate = 34%, indicating that a large share of registered patients never reach attended care in the recorded pathway.

**Actionable recommendations:**

1. Targeted interventions for men flagged for repeat no-shows, and older age groups. Their high no-show rates may imply barriers to accessing care, so interventions in the form of extra appointment reminders, or offers of travel support for attending appointments, may be helpful.
2. The range in no-show rates for insurance providers suggests financial barriers, such as unaffordable or inadequate insurance. Offer support in finding suitable insurance providers or healthcare financing options.

### 2.3. Metric 3: Financial friction in healthcare bills

In accordance with insights from the literature discussed in the introductory section, financial issues appear prominent:

- Among bills with a final status (paid or failed, excluding pending), over half are failed (51.1%).
- Failure rates differ significantly by insurance provider (highest in HealthIndia 72.7% and lowest in PulseSecure 40.9%), which suggests inequities related to coverage adequacy or payment processes. This aligns with the Commonwealth Fund’s aforementioned observation that many Americans, despite paying for an insurance provider, are underinsured and their providers ultimately do not cover the full costs of their healthcare.
- Failed payments increase with age (especially 50–64 at 67.9% and 65+ at 61.5%), highlighting that financial friction may disproportionately affect groups already vulnerable to delayed or disrupted care.

Due to the privatised nature of health insurance providers, it is difficult to recommend actions to address Metric 3 insights immediately. We argue that the affordability crisis of healthcare in the US must be addressed by structural change on a wider political level, as discussed briefly below.

---

## 3. Discussion

We see that inequality shows up at different phases in different ways, and it is very important to understand the part that intersectionality plays. There are specific demographics that seem more vulnerable at different steps, such as older people having high no-show rates and high failed payment rates. Older groups also seem to experience more financial friction, placing them as a highly vulnerable group.

As discussed above, it is possible to infer certain barriers to care, such as financial, social, and logistical, and we have recommended actionable insights based on insights extracted from the data. However, we must again recommend the collection of further data to gain a holistic picture, including qualitative data that integrates the patients' views and experiences first-hand. This dataset also lacks direct socioeconomic indicators such as household income, as well as data on ethnicity, both of which have been shown to have substantial effects on equity and accessibility of health care.

Overall, this report presents a picture of an inadequate health care system in need of reform to a high level. This resonates with the wider picture, as the Commonwealth Fund’s *Mirror, Mirror* reports have consistently proved the US to be lagging behind in all categories of health care equity and efficiency. Leading countries ensure the safety and health of their citizens with Universal Healthcare, a structure that it is imperative the US strives toward to improve the equity and efficiency of its health care system.

---

## 4. References

- KFF: `https://www.kff.org/health-costs/americans-challenges-with-health-care-costs`
- Commonwealth Fund: `https://www.commonwealthfund.org/publications/surveys/2024/nov/state-health-insurance-coverage-us-2024-biennial-survey`
- Commonwealth Fund, *Mirror, Mirror 2024*: `https://www.commonwealthfund.org/publications/fund-reports/2024/sep/mirror-mirror-2024`

---

## 5. Appendix

The SQL queries used in this project are included in the `queries/` folder.
