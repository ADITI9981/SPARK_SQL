-- Databricks notebook source
-- MAGIC %md
-- MAGIC # DELTA LAKE WITH SPARK SQL

-- COMMAND ----------

SELECT * FROM sparksql_cata.sparksql_schema.order_man

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### DML OPERARION

-- COMMAND ----------

UPDATE sparksql_cata.sparksql_schema.order_man 
SET product_category ='GENG fashion'
WHERE product_category='Fashion'

-- COMMAND ----------

select * from sparksql_cata.sparksql_schema.order_man

-- COMMAND ----------

DESCRIBE EXTENDED sparksql_cata.sparksql_schema.order_man

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### DATA VERSIONING

-- COMMAND ----------

DELETE FROM sparksql_cata.sparksql_schema.order_man
WHERE order_id ='1001'

-- COMMAND ----------

DESCRIBE HISTORY sparksql_cata.sparksql_schema.order_man

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### TIME TRAVEL

-- COMMAND ----------

RESTORE sparksql_cata.sparksql_schema.order_man TO VERSION AS OF 3

-- COMMAND ----------

