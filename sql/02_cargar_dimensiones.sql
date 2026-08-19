-- 02 - Cargar Dimensiones

-- DEPARTMENT
INSERT INTO dim_department (department_id, department)
SELECT
    ROW_NUMBER() OVER (ORDER BY department),
    department
FROM (
    SELECT DISTINCT department
    FROM financial_transactions_raw
) d;


-- CATEGORY
INSERT INTO dim_category (category_id, category)
SELECT
    ROW_NUMBER() OVER (ORDER BY category),
    category
FROM (
    SELECT DISTINCT category
    FROM financial_transactions_raw
) c;


-- REGION
INSERT INTO dim_region (region_id, region)
SELECT
    ROW_NUMBER() OVER (ORDER BY region),
    region
FROM (
    SELECT DISTINCT region
    FROM financial_transactions_raw
) r;


-- PAYMENT METHOD
INSERT INTO dim_payment_method (payment_method_id, payment_method)
SELECT
    ROW_NUMBER() OVER (ORDER BY payment_method),
    payment_method
FROM (
    SELECT DISTINCT payment_method
    FROM financial_transactions_raw
) p;


-- DATE
INSERT INTO dim_date (
    date_id,
    date,
    year,
    month,
    month_name,
    quarter
)
SELECT DISTINCT
    TO_CHAR(date, 'YYYYMMDD')::INT,
    date,
    EXTRACT(YEAR FROM date)::INT,
    EXTRACT(MONTH FROM date)::INT,
    TRIM(TO_CHAR(date, 'Month')),
    EXTRACT(QUARTER FROM date)::INT
FROM financial_transactions_raw
ORDER BY date;