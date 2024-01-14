---
title: "Lakehouse, Iceberg & Delta"
tags: [Architecture, Data, Data Lake, Lakehouse, Hadoop]
date: 2024-01-14
categories: [English]
type: docs
weight: 50
---

## Datalake is not enough

In recent years, most companies have chosen to store their data, whether structured or not, in data lakes due to their cost-effective storage. According to some sources at Databricks, around 90% of enterprise data resides in data lakes. 

### Data swamp

For various reasons, such as a lack of governance, poor metadata management, and inadequate data quality performance, data lakes often transform into a [data swamp](../from-bigdata-to-lakehouse/#04-data-swamp), making both the data lake and the stored data unusable.

In his book "[Building the Data Lakehouse](https://www.databricks.com/resources/ebook/building-the-data-lakehouse)", Bill Inmon, widely recognized as the pioneer of data warehousing, explains that for meaningful analysis, a data lake needs to meet **two crucial conditions**:
1. The data must be related to each other.
2. The data must be organized within a structured analytical infrastructure designed to be accessible to end-users.

Unless these two conditions are satisfied, the data lake is at risk of becoming a data swamp.

### Data Lake infrastructure complexity


Initially, the idea was to process this data, perform ETL operations, implement machine learning models, and enable self-service data exploration, directly in the data lake. However, to deliver projects to end users, it becomes necessary to copy this data (via ETL processes). Often, there are multiple copies of data because each operational unit may have its own data lake. Moreover, data scientists who draw from data lakes often create results from their work that must be integrated into data warehouses.


![data lake infarstructure complexity](./lakehouse-data-infrastructure.drawio.png)

This entire process introduces complexities such as security management and synchronization between different systems. This situation creates genuine complexity and silos, leading to high costs for companies in terms of infrastructure, tools, and human resources.

We will delve into greater detail here on how the limitations of systems such as [Spark](../spark/) or [Apache Hive](../hadoop#hive--simplifier-lanalyse-des-données-avec-le-langage-sql) have contributed to the challenges with data lakes, and explore how emerging technologies like Iceberg or Delta Lake aim to address these issues.

## Building a data lakes whith Spark alone is still painfull

















#### Sources

- https://www.databricks.com/resources/ebook/building-the-data-lakehouse
- https://www.youtube.com/playlist?list=PL-gIUf9e9CCskP6wP-NKRU9VhofMHYjcd
- https://www.youtube.com/watch?v=YK_tli-jDPs
