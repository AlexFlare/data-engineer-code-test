DROP schema IF EXISTS staging CASCADE;

CREATE schema staging;

CREATE TABLE staging.customers (
	customer_number varchar(10) NOT NULL,
	name varchar(100) NULL,
	city varchar(100) NULL,
	dob varchar(10) NULL
);

CREATE TABLE staging.loans (
	loan_number varchar(10) NOT NULL,
	customer_number varchar(10) NOT NULL,
	amount varchar(10) NULL,
	term varchar(10) NULL,
	interest_rate varchar(10) NULL,
	period_cost varchar(10) NULL,
	currency varchar(10) NULL,
	grade varchar(10) NULL,
	effective_date varchar(10) NULL
);