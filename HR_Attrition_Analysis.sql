-- =========================================================
-- HR ATTRITION ANALYSIS
-- MySQL Analysis
-- =========================================================

-- 1. Total Employees
SELECT COUNT(*) AS total_employees
FROM hr_employees;


-- 2. Attrition Count
SELECT COUNT(*) AS attrition_count
FROM hr_employees
WHERE Attrition = 'Yes';


-- 3. Attrition Rate
SELECT
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM hr_employees;


-- 4. Average Age
SELECT
    ROUND(AVG(Age), 2) AS average_age
FROM hr_employees;


-- 5. Attrition by Department
SELECT
    Department,
    COUNT(*) AS attrition_count
FROM hr_employees
WHERE Attrition = 'Yes'
GROUP BY Department
ORDER BY attrition_count DESC;


-- 6. Attrition by Job Role
SELECT
    JobRole,
    COUNT(*) AS attrition_count
FROM hr_employees
WHERE Attrition = 'Yes'
GROUP BY JobRole
ORDER BY attrition_count DESC;


-- 7. Attrition by Gender
SELECT
    Gender,
    COUNT(*) AS attrition_count
FROM hr_employees
WHERE Attrition = 'Yes'
GROUP BY Gender
ORDER BY attrition_count DESC;


-- 8. Attrition by OverTime
SELECT
    OverTime,
    COUNT(*) AS attrition_count
FROM hr_employees
WHERE Attrition = 'Yes'
GROUP BY OverTime
ORDER BY attrition_count DESC;


-- 9. Average Monthly Income: Stayed vs Left
SELECT
    Attrition,
    ROUND(AVG(MonthlyIncome), 2) AS avg_monthly_income
FROM hr_employees
GROUP BY Attrition;


-- 10. Average Monthly Income by Job Role
SELECT
    JobRole,
    ROUND(AVG(MonthlyIncome), 2) AS avg_monthly_income
FROM hr_employees
GROUP BY JobRole
ORDER BY avg_monthly_income DESC;


-- 11. Attrition Rate by Department
SELECT
    Department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM hr_employees
GROUP BY Department
ORDER BY attrition_rate DESC;


-- 12. Attrition Rate by OverTime
SELECT
    OverTime,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM hr_employees
GROUP BY OverTime
ORDER BY attrition_rate DESC;


-- 13. Attrition Rate by Job Role
SELECT
    JobRole,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM hr_employees
GROUP BY JobRole
ORDER BY attrition_rate DESC;


-- 14. Attrition Rate by Gender
SELECT
    Gender,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM hr_employees
GROUP BY Gender
ORDER BY attrition_rate DESC;


-- 15. Attrition Rate by Age Group
SELECT
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS age_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM hr_employees
GROUP BY age_group
ORDER BY attrition_rate DESC;


-- 16. Employees Working Overtime
SELECT
    OverTime,
    COUNT(*) AS employee_count
FROM hr_employees
GROUP BY OverTime
ORDER BY employee_count DESC;


-- 17. Average Income by Attrition
SELECT
    Attrition,
    COUNT(*) AS employee_count,
    ROUND(AVG(MonthlyIncome), 2) AS avg_monthly_income
FROM hr_employees
GROUP BY Attrition;


-- 18. Job Satisfaction vs Attrition
SELECT
    JobSatisfaction,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM hr_employees
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;


-- 19. Top 10 Job Roles by Attrition Count
SELECT
    JobRole,
    COUNT(*) AS attrition_count
FROM hr_employees
WHERE Attrition = 'Yes'
GROUP BY JobRole
ORDER BY attrition_count DESC
LIMIT 10;


-- 20. Overall HR Summary
SELECT
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate,
    ROUND(AVG(Age), 2) AS average_age,
    ROUND(AVG(MonthlyIncome), 2) AS average_monthly_income
FROM hr_employees;
