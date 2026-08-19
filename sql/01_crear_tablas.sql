-- 01 - Crear Tablas

-- TABLA RAW
CREATE TABLE financial_transactions_raw (
    date DATE,
    department VARCHAR(50),
    category VARCHAR(50),
    region VARCHAR(50),
    budget_amount NUMERIC(15,2),
    actual_amount NUMERIC(15,2),
    payment_method VARCHAR(50),
    transaction_id VARCHAR(50)
);


-- DIMENSION DEPARTMENT
CREATE TABLE dim_department (
    department_id INT PRIMARY KEY,
    department VARCHAR(50) NOT NULL UNIQUE
);


-- DIMENSION CATEGORY
CREATE TABLE dim_category (
    category_id INT PRIMARY KEY,
    category VARCHAR(50) NOT NULL UNIQUE
);


-- DIMENSION REGION
CREATE TABLE dim_region (
    region_id INT PRIMARY KEY,
    region VARCHAR(50) NOT NULL UNIQUE
);


-- DIMENSION PAYMENT METHOD
CREATE TABLE dim_payment_method (
    payment_method_id INT PRIMARY KEY,
    payment_method VARCHAR(50) NOT NULL UNIQUE
);


-- DIMENSION DATE
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    date DATE NOT NULL UNIQUE,
    year INT NOT NULL,
    month INT NOT NULL,
    month_name VARCHAR(20) NOT NULL,
    quarter INT NOT NULL
);


-- TABLA DE HECHOS
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