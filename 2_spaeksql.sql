-- Databricks notebook source
SELECT * FROM sparksql_cata.sparksql_schema.order_ext;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Filtering

-- COMMAND ----------

SELECT * 
FROM sparksql_cata.sparksql_schema.order_ext
WHERE product_category='Fashion';

-- COMMAND ----------

-- MAGIC %python
-- MAGIC df_test = spark.sql('''SELECT * 
-- MAGIC FROM sparksql_cata.sparksql_schema.order_ext
-- MAGIC WHERE product_category="Fashion";''')

-- COMMAND ----------

