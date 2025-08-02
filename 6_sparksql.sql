-- Databricks notebook source
-- MAGIC %md
-- MAGIC # ROW LEVEL SECURITY

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Mapping Table

-- COMMAND ----------

CREATE TABLE sparksql_cata.sparksql_schema.map_table
(
  payment_category STRING,
  email STRING
)

-- COMMAND ----------

INSERT INTO sparksql_cata.sparksql_schema.map_table
VALUES
('Credit card','munmunyadav9981_gmail.com#ext#@munmunyadav9981gmail.onmicrosoft.com'),
('Debit card','munmunyadav9981_gmail.com#ext#@munmunyadav9981gmail.onmicrosoft.com'),
('PayPal','newuser@munmunyadav9981gmail.onmicrosoft.com'),
('UPI','newuser@munmunyadav9981gmail.onmicrosoft.com')

-- COMMAND ----------

SELECT * FROM sparksql_cata.sparksql_schema.map_table
WHERE email = current_user()
AND payment_category = 'Credit card'

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### converting Mapping Table Into Boolean

-- COMMAND ----------

SELECT EXISTS
(
  SELECT * FROM sparksql_cata.sparksql_schema.map_table
  WHERE email = current_user()
  AND payment_category = 'Credit card'
)

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### CONVERT INTO A BOOLEAN FUNCTION

-- COMMAND ----------

CREATE OR REPLACE FUNCTION sparksql_cata.sparksql_schema.rowlevel_security(payment_method STRING)
RETURNS BOOLEAN
LANGUAGE SQL
RETURN
(
  exists
  (
    select * from sparksql_cata.sparksql_schema.map_table
    where email = current_user()
    and payment_category = payment_method
  )
)

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### APPLYING RLS FUNCTION TO THE COLUMN

-- COMMAND ----------

ALTER TABLE sparksql_cata.sparksql_schema.order_ext
SET ROW FILTER sparksql_cata.sparksql_schema.rowlevel_security on (payment_method)


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### TESTTING

-- COMMAND ----------

SELECT * FROM sparksql_cata.sparksql_schema.order_ext

-- COMMAND ----------

