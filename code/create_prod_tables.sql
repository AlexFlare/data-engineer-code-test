CREATE SCHEMA IF NOT EXISTS prod;

CREATE TABLE IF NOT EXISTS prod.loans
(
 loan_number varchar(10) NOT NULL,
 customer_number varchar(10) NOT NULL,
 effective_date date NOT NULL,
 amount numeric NOT NULL,
 term numeric NOT NULL, 
 interest_rate FLOAT, 
 period_cost NUMERIC, 
 currency CHAR(3), 
 grade CHAR(1),
 constraint pk_loans primary key (loan_number, effective_date, customer_number)
);

CREATE TABLE IF NOT EXISTS prod.customers
(
	customer_number varchar(10) NOT NULL,
	name varchar(100),
	city varchar(100),
	dob date,
	constraint pk_customers primary key (customer_number)
);

DROP VIEW IF EXISTS prod.loans_fact_vw;
CREATE VIEW prod.loans_fact_vw
as
SELECT customer_number, effective_date, SUM(amount) as total_loan_amount
FROM prod.loans
GROUP BY customer_number, effective_date;