CREATE VIEW staging.loans_vw as
SELECT 
loan_number, 
customer_number, 
effective_date::date, 
amount::numeric, 
term::numeric, 
interest_rate::float, 
period_cost::numeric, 
currency::char(3), 
grade::char(1)
FROM staging.loans;

CREATE VIEW staging.customers_vw as 
SELECT 
customer_number, 
name, 
city, 
dob::date 
FROM staging.customers;