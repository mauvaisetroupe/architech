
---
title: "02. Spark’s interactive shell"
tags: [Architecture, Data, Lakehouse, Hadoop]
date: 2024-01-02
categories: [English]
type: docs
weight: 20
---

#### Write a File

Launch a terminal a bash session to create data like files

```bash
$ docker run -it apache/spark:3.5.0 bash
spark@da63f96a9274:/opt/spark/work-dir$ 
$ cat << EOF > my-text.txt
The integration between Apache Spark and HDFS goes beyond mere compatibility. Spark leverages HDFS as its primary storage layer, enabling fault-tolerant and scalable data processing across a distributed network of nodes. HDFS's block-based storage architecture ensures efficient data retrieval and resilience, making it an ideal companion for Spark's high-performance computations.
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac elit nec ex tincidunt malesuada. Integer id bibendum justo. Vestibulum id tortor aliquet, tristique nunc in, efficitur augue. Nunc euismod, libero eu dapibus eleifend, quam nisl gravida est, et ultrices quam metus vel turpis.
Within the Hadoop ecosystem, Apache Hive stands as a powerful data warehouse solution that simplifies data querying through a SQL-like language. It stores metadata in a relational database and organizes data in a structured format within HDFS. Spark seamlessly interfaces with Hive, allowing users to transition between Spark SQL and HiveQL effortlessly, creating a cohesive analytics environment.
Fusce nec ultricies libero. Vivamus auctor massa non quam volutpat, nec eleifend velit convallis. Suspendisse potenti. Quisque bibendum, odio vel malesuada semper, felis odio laoreet neque, ac tincidunt leo quam nec leo. Maecenas vel nunc eu ex ultricies efficitur. Curabitur in dui at libero ullamcorper feugiat eu eget justo.
Spark's DataFrame API, an abstraction built on top of RDDs, further enhances its data manipulation capabilities. DataFrames provide a more intuitive and optimized interface for structured data processing, integrating seamlessly with Spark SQL. This unification simplifies complex data workflows, allowing users to switch between SQL queries and programmatic data transformations effortlessly.
Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla facilisi. Integer eget diam vitae velit luctus hendrerit vel id elit. Donec auctor justo at ante aliquet tincidunt. Duis rhoncus justo vel augue fringilla bibendum. In hac habitasse platea dictumst.
As organizations increasingly adopt big data technologies, the combination of Spark, HDFS, and Hive emerges as a potent solution for managing and analyzing vast datasets. Spark's in-memory processing, HDFS's distributed storage, and Hive's SQL querying together offer a comprehensive framework for scalable, real-time analytics, supporting a wide range of applications across industries.
Cras auctor facilisis dui, eu bibendum velit pharetra in. Nunc vel sagittis odio. Sed vulputate vel sapien id aliquet. Aliquam ut semper lacus. Vivamus fermentum, quam sit amet fermentum vestibulum, felis libero fermentum orci, id fermentum eros libero sit amet ipsum. Curabitur vel odio a orci pharetra volutpat vel in ligula.
Spark's extensibility through libraries like MLlib for machine learning and GraphX for graph processing further broadens its applicability. This extensibility, combined with HDFS's ability to store diverse data formats, positions Spark as a versatile tool capable of addressing various data processing challenges, from ETL tasks to advanced analytics.
Aenean aliquet turpis a dui facilisis tempus. Proin bibendum ipsum vel facilisis eleifend. Suspendisse potenti. Sed et urna eget ligula lacinia tincidunt. Fusce non urna sed justo dapibus efficitur eu vel arcu. Nullam vitae vulputate tortor. Aenean ut nisl vitae arcu malesuada convallis.
The integration of Hive with Spark not only preserves existing investments in Hive but also enables the use of Spark's advanced analytics capabilities on Hive-managed data. This interoperability facilitates a smooth transition for organizations looking to migrate from Hive to Spark, unlocking new possibilities for data exploration and analysis.
Phasellus nec metus ac mauris iaculis malesuada. Nam vel arcu nec justo fermentum consectetur. Ut venenatis velit sed lacus dapibus, vitae euismod nisl vestibulum. Suspendisse potenti. Mauris fermentum tristique tellus, nec gravida tortor tincidunt et. Sed ullamcorper, dolor sit amet commodo malesuada, justo felis feugiat elit, non malesuada justo augue at erat.
In conclusion, the collaborative strengths of Apache Spark, HDFS, and Hive create a robust ecosystem for big data analytics. Whether handling massive datasets stored in HDFS, querying structured data with Hive, or performing complex computations with Spark, this trio of technologies provides a holistic solution for organizations seeking efficient, scalable, and flexible data processing.
EOF
```

### Launch Scala shell

Launch Spark’s shell in Scala

```bash
$ /opt/spark/bin/spark-shell
```

### Read a file and manipulate it.

```scala
val textFile = spark.read.textFile("/opt/spark/work-dir/my-text.txt")
textFile.count() // Number of items in this Dataset
textFile.first()
textFile.filter(line => line.contains("Spark")).count()
```

### Haddop MapReduce implementation

Haddop MapReduce can be implemented easily:
```scala
// transform a Dataset of lines to a Dataset of words
// combine by key 
// compute the per-word counts 
val wordCounts = textFile.flatMap(line => line.split(" ")).groupByKey(identity).count()
// Then collect
wordCounts.collect()
```

### Caching

```scala
linesWithSpark.cache()
```


#### Sources
- https://spark.apache.org/docs/latest/quick-start.html