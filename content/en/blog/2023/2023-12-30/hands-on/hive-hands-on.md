---
title: "Apache Hive hands-on"
tags: [Architecture, Data, Lakehouse, Hadoop]
date: 2023-12-30
categories: [English]
toc_hide: true 
---

BDE typically stands for "Big Data Europe," which was a project funded by the European Commission under the Horizon 2020 program. The Big Data Europe project aimed to support the adoption of big data technologies across various industries and sectors by providing tools, methods, and infrastructure to handle large-scale data processing.

As part of the project, Docker images were created to simplify the deployment of big data technologies, including Apache Hadoop and Apache Hive. These Docker images are often prefixed with "bde" to indicate their association with the Big Data Europe project.

## Install and run Hadoop & Hive

##### 1. Download files docker-compose 

Download files `docker-compose.yml` and `hadoop-hive.env`  here : https://github.com/big-data-europe/docker-hive

```docker
version: "3"

services:
  namenode:
    image: bde2020/hadoop-namenode:2.0.0-hadoop2.7.4-java8
    volumes:
      - namenode:/hadoop/dfs/name
    environment:
      - CLUSTER_NAME=test
    env_file:
      - ./hadoop-hive.env
    ports:
      - "50070:50070"
  datanode:
    image: bde2020/hadoop-datanode:2.0.0-hadoop2.7.4-java8
    volumes:
      - datanode:/hadoop/dfs/data
    env_file:
      - ./hadoop-hive.env
    environment:
      SERVICE_PRECONDITION: "namenode:50070"
    ports:
      - "50075:50075"
  hive-server:
    image: bde2020/hive:2.3.2-postgresql-metastore
    env_file:
      - ./hadoop-hive.env
    environment:
      HIVE_CORE_CONF_javax_jdo_option_ConnectionURL: "jdbc:postgresql://hive-metastore/metastore"
      SERVICE_PRECONDITION: "hive-metastore:9083"
    ports:
      - "10000:10000"
  hive-metastore:
    image: bde2020/hive:2.3.2-postgresql-metastore
    env_file:
      - ./hadoop-hive.env
    command: /opt/hive/bin/hive --service metastore
    environment:
      SERVICE_PRECONDITION: "namenode:50070 datanode:50075 hive-metastore-postgresql:5432"
    ports:
      - "9083:9083"
  hive-metastore-postgresql:
    image: bde2020/hive-metastore-postgresql:2.3.0
  presto-coordinator:
    image: shawnzhu/prestodb:0.181
    ports:
      - "8080:8080"

volumes:
  namenode:
  datanode:
```

##### 2. Run docker-compose

```bash
docker-compose up -d
```

##### 3. Connect to Hadoop web interface

[http://localhost:50070](http://localhost:50070)

> ![Hadoop Web UI](/blog/2023/2023-12-30/hands-on/hadoop-web-ui.png)


## Create a new database with Employee table

#### Execute a Bash shell inside the 'hive-server' container.

```bash
docker-compose exec hive-server bash
$ /opt/hive/bin/beeline -u jdbc:hive2://localhost:10000
...
Beeline version 2.3.2 by Apache Hive
0: jdbc:hive2://localhost:10000> 

```

#### Create new database and table

```bash
0: jdbc:hive2://localhost:10000> CREATE DATABASE IF NOT EXISTS company_data;
0: jdbc:hive2://localhost:10000> USE company_data;
0: jdbc:hive2://localhost:10000> show tables
+----------------+
| database_name  |
+----------------+
| company_data   |
| default        |
+----------------+
```



```SQL
-- Create a New Database
CREATE DATABASE IF NOT EXISTS company_data;

-- Switch to the New Database
USE company_data;

-- Create an Employee Table in the New Database
CREATE TABLE employee (
    emp_id INT,
    emp_name STRING,
    emp_salary DOUBLE,
    emp_department STRING
);

-- Insert Data into the Employee Table
INSERT INTO employee VALUES
    (1, 'John Doe', 50000.0, 'IT'),
    (2, 'Jane Smith', 60000.0, 'HR'),
    (3, 'Bob Johnson', 55000.0, 'Finance'),
    (4, 'Alice Brown', 70000.0, 'IT'),
    (5, 'Charlie Davis', 48000.0, 'Marketing');

-- Query the Employee Table in the Current Database
SELECT * FROM employee;

```

#### Create Partitions

```sql
-- Création de la table avec une partition par département
CREATE TABLE employee2 (
    emp_id INT,
    emp_name STRING,
    emp_salary DOUBLE
)
PARTITIONED BY (emp_department STRING);

-- Insertion de données dans la table avec spécification de la partition
INSERT INTO TABLE employee2 PARTITION (emp_department='IT') VALUES
    (1, 'John Doe', 50000.0),
    (4, 'Alice Brown', 70000.0);

INSERT INTO TABLE employee2 PARTITION (emp_department='HR') VALUES
    (2, 'Jane Smith', 60000.0);

```

This will create a directory structure in the Hadoop file system, where each department will have its own subdirectory under the main directory of the table. This enables optimization of queries that filter or aggregate data based on the department.

> ![Hadoop Web UI - Partitions](/blog/2023/2023-12-30/hadoo-web-ui-partitions.png)

#### Other commands

```bash
# copy file in hdfs
hadoop fs -copyFromLocal localfile.csv /user/hadoop/hdfspath/
```

```bash
-- If the file is on HDFS
LOAD DATA INPATH '/path/to/yourfile.csv' INTO TABLE your_table;

-- If the file is on the local file system (not recommended for large files)
LOAD DATA LOCAL INPATH '/path/to/yourfile.csv' INTO TABLE your_table;
```