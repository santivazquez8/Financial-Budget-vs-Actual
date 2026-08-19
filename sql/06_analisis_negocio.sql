-- 06 - Análisis de Negocio

-- ¿Cuál es el Budget total, el Actual total y la Variance total?

SELECT
    SUM(budget_amount) AS total_budget,
    SUM(actual_amount) AS total_actual,
    SUM(actual_amount - budget_amount) AS variance
FROM fact_financial_transactions;

-- ¿Qué departamentos presentan la mayor desviación entre Actual y Budget?

SELECT
    d.department,
    SUM(f.budget_amount) AS total_budget,
    SUM(f.actual_amount) AS total_actual,
    SUM(f.actual_amount - f.budget_amount) AS variance
FROM fact_financial_transactions f
JOIN dim_department d
    ON f.department_id = d.department_id
GROUP BY d.department
ORDER BY variance DESC;


-- ¿Qué categorías presentan la mayor desviación entre Actual y Budget?

SELECT
    c.category,
    SUM(f.budget_amount) AS total_budget,
    SUM(f.actual_amount) AS total_actual,
    SUM(f.actual_amount - f.budget_amount) AS variance
FROM fact_financial_transactions f
JOIN dim_category c
    ON f.category_id = c.category_id
GROUP BY c.category
ORDER BY variance DESC;


-- ¿Qué departamentos tienen la mayor desviación porcentual respecto de su Budget?

SELECT
    d.department,
    SUM(f.budget_amount) AS total_budget,
    SUM(f.actual_amount) AS total_actual,
    SUM(f.actual_amount - f.budget_amount) AS variance,
    ROUND(
        SUM(f.actual_amount - f.budget_amount)
        / SUM(f.budget_amount) * 100,
        2
    ) AS variance_percentage
FROM fact_financial_transactions f
JOIN dim_department d
    ON f.department_id = d.department_id
GROUP BY d.department
ORDER BY variance_percentage DESC;


-- ¿Cómo evolucionan el Budget y el Actual a lo largo del tiempo?

SELECT
    d.year,
    d.month,
    d.month_name,
    SUM(f.budget_amount) AS total_budget,
    SUM(f.actual_amount) AS total_actual,
    SUM(f.actual_amount - f.budget_amount) AS variance
FROM fact_financial_transactions f
JOIN dim_date d
    ON f.date_id = d.date_id
GROUP BY
    d.year,
    d.month,
    d.month_name
ORDER BY
    d.year,
    d.month;

-- ¿Qué regiones presentan la mayor desviación entre Actual y Budget?

SELECT
    r.region,
    SUM(f.budget_amount) AS total_budget,
    SUM(f.actual_amount) AS total_actual,
    SUM(f.actual_amount - f.budget_amount) AS variance
FROM fact_financial_transactions f
JOIN dim_region r
    ON f.region_id = r.region_id
GROUP BY r.region
ORDER BY variance DESC;