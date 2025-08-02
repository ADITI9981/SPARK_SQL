-- Databricks notebook source
-- MAGIC %md
-- MAGIC # UPSERT - MERGE

-- COMMAND ----------

-- MAGIC %python
-- MAGIC df = spark.read.table("sparksql_cata.sparksql_schema.order_man")

-- COMMAND ----------

-- MAGIC %python
-- MAGIC df.createOrReplaceTempView("order_source")

-- COMMAND ----------

-- MAGIC %python
-- MAGIC spark.sql('''SELECT * FROM {orders_temp}''',orders_temp=df).display()

-- COMMAND ----------

MERGE INTO sparksql_cata.sparksql_schema.order_ext trg
using order_source src
on trg.order_id = src.order_id
when matched then update set *
when not matched then insert *

-- COMMAND ----------

