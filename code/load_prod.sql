INSERT INTO prod.loans
SELECT loan_number, customer_number, effective_date, amount, term, interest_rate, period_cost, currency, grade
from staging.loans_vw
WHERE NOT EXISTS (SELECT 1 FROM prod.loans WHERE loans.loan_number=loans_vw.loan_number AND loans.customer_number=loans_vw.customer_number AND loans.effective_date=loans_vw.effective_date)
;

INSERT INTO prod.customers
SELECT customer_number, name, city, dob 
from staging.customers_vw
WHERE NOT EXISTS (SELECT 1 FROM prod.customers WHERE customers.customer_number=customers_vw.customer_number)
;