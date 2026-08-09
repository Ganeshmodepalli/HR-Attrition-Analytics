# HR Attrition Analytics Dashboard

## 📌 Project Overview

An end-to-end HR analytics project focused on understanding employee attrition, workforce patterns, overtime, job roles, and compensation.

The project analyzes a dataset of **1,470 employees** and transforms raw HR data into actionable business insights using Python, SQL, and Power BI.

---

## 🎯 Business Problem

Employee attrition can increase recruitment costs, reduce productivity, and affect workforce stability.

The objective of this project is to analyze employee data and answer questions such as:

- Which departments have higher employee attrition?
- Which job roles experience higher attrition?
- Is overtime associated with employee attrition?
- Do employees who leave have lower average monthly income?
- How does compensation differ across job roles?
- What workforce patterns can HR identify from the data?

---

## 📊 Dataset

The dataset contains information about **1,470 employees** and includes **35 original columns**.

Important fields include:

- Age
- Attrition
- BusinessTravel
- Department
- Education
- EducationField
- Gender
- JobLevel
- JobRole
- JobSatisfaction
- MonthlyIncome
- OverTime
- PerformanceRating
- RelationshipSatisfaction
- TotalWorkingYears
- YearsAtCompany
- YearsInCurrentRole
- YearsWithCurrManager

### Data Cleaning

Four constant/unnecessary columns were removed:

- EmployeeCount
- StandardHours
- Over18
- EmployeeNumber

Three analytical features were created:

- AgeGroup
- IncomeBand
- TenureGroup

The final cleaned dataset contains **1,470 rows and 34 columns**.

---

## 🐍 Python Analysis

Python was used for data cleaning, exploratory data analysis, visualization, and feature engineering.

### Libraries Used

- Pandas
- Matplotlib

### Python Tasks

1. Loaded the raw HR dataset.
2. Inspected the dataset structure.
3. Checked missing values.
4. Analyzed attrition distribution.
5. Removed unnecessary columns.
6. Performed exploratory data analysis.
7. Analyzed attrition by department.
8. Analyzed attrition by overtime.
9. Compared monthly income for employees who stayed and left.
10. Analyzed job satisfaction and attrition.
11. Created AgeGroup, IncomeBand, and TenureGroup.
12. Exported the cleaned dataset for further analysis.

---

## 🗄️ SQL Analysis

MySQL was used to perform analytical queries on the cleaned HR dataset.

The SQL analysis includes:

- Total employee count
- Attrition count
- Attrition rate
- Average age
- Attrition by department
- Attrition by job role
- Attrition by gender
- Attrition by overtime
- Attrition rate by department
- Attrition rate by overtime
- Attrition rate by job role
- Attrition rate by gender
- Attrition rate by age group
- Average monthly income by attrition
- Average monthly income by job role
- Job satisfaction vs attrition

---

## 📈 Power BI Dashboard

The final dashboard is titled:

**HR Attrition Analytics Dashboard**

### KPIs

- Total Employees
- Attrition Count
- Attrition Rate
- Average Age

### Visualizations

1. Attrition by Department
2. Attrition by Job Role
3. Attrition by Gender
4. Attrition by OverTime
5. Avg Monthly Income: Stayed vs Left
6. Avg Monthly Income by Job Role

### Interactive Slicers

- Department
- Job Role
- OverTime
- Gender

---

## 🔍 Key Insights

The analysis identified several important HR patterns:

### Attrition

The overall attrition rate is approximately **16.12%**, with **237 employees** having left the organization.

### Overtime

Employees working overtime show substantially higher attrition than employees who do not work overtime.

### Compensation

Employees who left have a lower average monthly income than employees who stayed.

### Department

Attrition varies across departments, allowing HR to identify areas requiring closer investigation.

### Job Role

Attrition also differs significantly between job roles, helping HR identify roles with higher employee turnover.

---

## 💡 Business Recommendations

Based on the analysis, HR could:

- Investigate workload and overtime policies.
- Review compensation for roles with higher attrition.
- Identify departments and job roles with unusually high turnover.
- Improve employee satisfaction and engagement.
- Monitor attrition regularly using HR dashboards.
- Use data-driven workforce planning to reduce unnecessary turnover.

---

## 🔄 Project Workflow

```text
Raw HR Dataset
       ↓
Python
(Data Cleaning + EDA + Feature Engineering)
       ↓
Cleaned Dataset
       ↓
MySQL
(SQL Analysis)
       ↓
Power BI
(KPIs + Visualizations + Slicers)
       ↓
HR Insights & Recommendations
