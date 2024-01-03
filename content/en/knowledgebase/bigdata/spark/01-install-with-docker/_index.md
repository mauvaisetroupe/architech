
---
title: "01. Install With docker"
tags: [Architecture, Data, Lakehouse, Hadoop]
date: 2024-01-02
categories: [English]
type: docs
weight: 10
---

### Docker install

The easiest way to start using Spark is through the Scala shell:

```bash
docker pull apache/spark:3.5.0
docker run -it apache/spark:3.5.0 /opt/spark/bin/spark-shell
```

Try the following command, which should return 1,000,000,000:

```scala
spark.range(1000 * 1000 * 1000).count()
res0: Long = 1000000000
```

#### Sources
- https://spark.apache.org/downloads.html
- https://hub.docker.com/r/apache/spark
- https://hub.docker.com/r/apache/spark-py