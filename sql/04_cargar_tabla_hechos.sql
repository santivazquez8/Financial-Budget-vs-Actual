-- 04 - Cargar Tabla de Hechos

INSERT INTO fact_financial_transactions (
    transaction_id,
    date_id,
    department_id,
    category_id,
    region_id,
    payment_method_id,
    budget_amount,
    actual_amount
)
SELECT
    f.transaction_id,
    d.date_id,
    dep.department_id,
    c.category_id,
    r.region_id,
    pm.payment_method_id,
    f.budget_amount,
    f.actual_amount
FROM financial_transactions_raw f
JOIN dim_date d
    ON f.date = d.date
JOIN dim_department dep
    ON f.department = dep.department
JOIN dim_category c
    ON f.category = c.category
JOIN dim_region r
    ON f.region = r.region
JOIN dim_payment_method pm
    ON f.payment_method = pm.payment_method;