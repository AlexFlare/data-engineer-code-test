import psycopg2

conn = psycopg2.connect(dbname='codetest', user='codetest', password='password', host='localhost')
cursor = conn.cursor()

#create staging area
fd = open('code\create_staging_tables.sql', 'r')
create_stg_sql = fd.read()
fd.close()
cursor.execute(create_stg_sql)

#ingest files
customers_file_name = 'data\customers.csv'
sql = "COPY staging.customers FROM STDIN DELIMITER ',' CSV HEADER NULL '' ENCODING 'UTF8'"
cursor.copy_expert(sql, open(customers_file_name, "r"))

loans_file_name = 'data\loans.csv'
sql = "COPY staging.loans FROM STDIN DELIMITER ',' CSV HEADER NULL '' ENCODING 'UTF8'"
cursor.copy_expert(sql, open(loans_file_name, "r"))

#create views for transformation if needed
fd = open('code\create_views.sql', 'r')
create_views_sql = fd.read()
fd.close()
cursor.execute(create_views_sql)

#create fact and dimession tables
fd = open('code\create_prod_tables.sql', 'r')
create_prod_tables_sql = fd.read()
fd.close()
cursor.execute(create_prod_tables_sql)

#load
fd = open('code\load_prod.sql', 'r')
load_prod_sql = fd.read()
fd.close()
cursor.execute(load_prod_sql)

#create date dimension table
fd = open('code\date_dimension_table.sql', 'r')
date_dim_sql = fd.read()
fd.close()
cursor.execute(date_dim_sql)

cursor.close()

conn.commit()
conn.close()