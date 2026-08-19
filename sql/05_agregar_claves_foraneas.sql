-- 05 - Agregar Claves Foráneas

ALTER TABLE fact_financial_transactions
ADD CONSTRAINT fk_fact_date
FOREIGN KEY (date_id)
REFERENCES dim_date(date_id);


ALTER TABLE fact_financial_transactions
ADD CONSTRAINT fk_fact_department
FOREIGN KEY (department_id)
REFERENCES dim_department(department_id);


ALTER TABLE fact_financial_transactions
ADD CONSTRAINT fk_fact_category
FOREIGN KEY (category_id)
REFERENCES dim_category(category_id);


ALTER TABLE fact_financial_transactions
ADD CONSTRAINT fk_fact_region
FOREIGN KEY (region_id)
REFERENCES dim_region(region_id);


ALTER TABLE fact_financial_transactions
ADD CONSTRAINT fk_fact_payment_method
FOREIGN KEY (payment_method_id)
REFERENCES dim_payment_method(payment_method_id);