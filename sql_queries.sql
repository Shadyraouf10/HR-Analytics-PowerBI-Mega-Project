-- 1. Current Headcount
SELECT COUNT(*) AS total_employees
FROM employees
WHERE termination_date IS NULL;

-- 2. Turnover Rate
SELECT 
    ROUND(COUNT(termination_date) * 1.0 / COUNT(*), 2) AS turnover_rate
FROM employees;

-- 3. Average Tenure
SELECT 
    AVG(DATEDIFF(CURRENT_DATE, hiredate) / 365) AS avg_tenure_years
FROM employees
WHERE termination_date IS NULL;

-- 4. Distribution by City
SELECT 
    city,
    COUNT(*) AS employees_count
FROM employees
GROUP BY city
ORDER BY employees_count DESC;

-- 5. Gender Distribution
SELECT 
    gender,
    COUNT(*) AS count
FROM employees
GROUP BY gender;

-- 6. High Risk Employees (Tenure < 1 year)
SELECT 
    first_name,
    city,
    education_level,
    DATEDIFF(CURRENT_DATE, hiredate) / 365 AS tenure
FROM employees
WHERE DATEDIFF(CURRENT_DATE, hiredate) / 365 < 1;