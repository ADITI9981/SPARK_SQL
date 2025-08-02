-- Databricks notebook source
-- MAGIC %md
-- MAGIC # DYNAMIC DATA MASKING

-- COMMAND ----------

SELECT * FROM sparksql_cata.sparksql_schema.order_ext

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### MASK FUNCTION
-- MAGIC
-- MAGIC

-- COMMAND ----------

CREATE OR REPLACE FUNCTION sparksql_cata.sparksql_schema.dynamic_mask(p_user_id STRING)
RETURN
CASE WHEN is_account_group_member('admins') THEN p_user_id ELSE '****' END;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### APPLYING MASK FUNCTIO TO THE COLUMN - user_id

-- COMMAND ----------

ALTER TABLE sparksql_cata.sparksql_schema.order_ext
ALTER COLUMN user_id SET MASK sparksql_cata.sparksql_schema.dynamic_mask;

-- COMMAND ----------

SELECT * FROM sparksql_cata.sparksql_schema.order_ext

-- COMMAND ----------

SELECT * FROM sparksql_cata.sparksql_schema.order_ext

-- COMMAND ----------

