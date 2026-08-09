# ============================================================
# HR ATTRITION ANALYSIS
# Python - Pandas, Matplotlib
# ============================================================

import pandas as pd
import matplotlib.pyplot as plt

# ------------------------------------------------------------
# 1. Load Dataset
# ------------------------------------------------------------

df = pd.read_csv("hr_attrition_raw.csv")

print("Dataset Shape:", df.shape)


# ------------------------------------------------------------
# 2. Inspect Dataset
# ------------------------------------------------------------

print("\nFirst 5 Rows:")
print(df.head())

print("\nDataset Information:")
print(df.info())

print("\nAttrition Distribution:")
print(df["Attrition"].value_counts())

print("\nTotal Missing Values:")
print(df.isnull().sum().sum())


# ------------------------------------------------------------
# 3. Data Cleaning
# ------------------------------------------------------------

# Remove columns that contain the same value for every employee
df = df.drop(
    columns=[
        "EmployeeCount",
        "StandardHours",
        "Over18",
        "EmployeeNumber"
    ]
)

print("\nShape After Cleaning:", df.shape)


# ------------------------------------------------------------
# 4. Exploratory Data Analysis
# ------------------------------------------------------------

# Attrition by Department
dept_attrition = (
    df.groupby("Department")["Attrition"]
    .apply(lambda x: (x == "Yes").mean() * 100)
    .sort_values(ascending=False)
)

print("\nAttrition Rate by Department:")
print(dept_attrition)


# Attrition by OverTime
overtime_attrition = (
    df.groupby("OverTime")["Attrition"]
    .apply(lambda x: (x == "Yes").mean() * 100)
)

print("\nAttrition Rate by OverTime:")
print(overtime_attrition)


# Average Monthly Income: Stayed vs Left
income_attrition = (
    df.groupby("Attrition")["MonthlyIncome"]
    .mean()
)

print("\nAverage Monthly Income by Attrition:")
print(income_attrition)


# Attrition by Job Satisfaction
satisfaction_attrition = (
    df.groupby("JobSatisfaction")["Attrition"]
    .apply(lambda x: (x == "Yes").mean() * 100)
)

print("\nAttrition Rate by Job Satisfaction:")
print(satisfaction_attrition)


# Department × OverTime
department_overtime = pd.crosstab(
    df["Department"],
    df["OverTime"],
    values=df["Attrition"].eq("Yes"),
    aggfunc="mean"
) * 100

print("\nDepartment × OverTime Attrition:")
print(department_overtime)


# ------------------------------------------------------------
# 5. Visualizations
# ------------------------------------------------------------

# Department Attrition
dept_attrition.plot(
    kind="bar",
    title="Attrition Rate by Department"
)

plt.ylabel("Attrition Rate (%)")
plt.xlabel("Department")
plt.tight_layout()
plt.show()


# OverTime Attrition
overtime_attrition.plot(
    kind="bar",
    title="Attrition Rate by OverTime"
)

plt.ylabel("Attrition Rate (%)")
plt.xlabel("OverTime")
plt.tight_layout()
plt.show()


# Monthly Income by Attrition
income_attrition.plot(
    kind="bar",
    title="Average Monthly Income: Stayed vs Left"
)

plt.ylabel("Average Monthly Income")
plt.xlabel("Attrition")
plt.tight_layout()
plt.show()


# ------------------------------------------------------------
# 6. Feature Engineering
# ------------------------------------------------------------

# Age Groups
df["AgeGroup"] = pd.cut(
    df["Age"],
    bins=[18, 25, 35, 45, 60],
    labels=["18-25", "26-35", "36-45", "46-60"],
    include_lowest=True
)


# Income Bands
df["IncomeBand"] = pd.cut(
    df["MonthlyIncome"],
    bins=[0, 3000, 6000, 10000, 20000],
    labels=[
        "Low",
        "Medium",
        "High",
        "Very High"
    ],
    include_lowest=True
)


# Tenure Groups
df["TenureGroup"] = pd.cut(
    df["YearsAtCompany"],
    bins=[-1, 2, 5, 10, 40],
    labels=[
        "0-2 Years",
        "3-5 Years",
        "6-10 Years",
        "10+ Years"
    ]
)


# ------------------------------------------------------------
# 7. Check Final Dataset
# ------------------------------------------------------------

print("\nFinal Dataset Shape:", df.shape)

print("\nNew Feature Columns:")
print(
    df[
        [
            "AgeGroup",
            "IncomeBand",
            "TenureGroup"
        ]
    ].head()
)


# ------------------------------------------------------------
# 8. Export Cleaned Dataset
# ------------------------------------------------------------

df.to_csv(
    "hr_attrition_cleaned.csv",
    index=False
)

print("\nCleaned dataset exported successfully.")
