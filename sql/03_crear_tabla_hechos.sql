-- 03 - Crear Tabla de Hechos

-- FACT TABLE
CREATE TABLE fact_financial_transactions (
    transaction_id VARCHAR(50) PRIMARY KEY,
    date_id INT NOT NULL,
    department_id INT NOT NULL,
    category_id INT NOT NULL,
    region_id INT NOT NULL,
    payment_method_id INT NOT NULL,
    budget_amount NUMERIC(15,2) NOT NULL,
    actual_amount NUMERIC(15,2) NOT NULL
);