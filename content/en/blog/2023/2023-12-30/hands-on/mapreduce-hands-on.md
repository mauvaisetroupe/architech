---
title: "Hadoop MapReduce hands-on"
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
      - /home/lionel/docker/data/hadoop-dive/namenode:/hadoop/dfs/name
    environment:
      - CLUSTER_NAME=test
    env_file:
      - ./hadoop-hive.env
    ports:
      - "50070:50070"
  datanode:
    image: bde2020/hadoop-datanode:2.0.0-hadoop2.7.4-java8
    volumes:
      - /home/lionel/docker/data/hadoop-dive/datanode:/hadoop/dfs/data
    env_file:
      - ./hadoop-hive.env
    environment:
      SERVICE_PRECONDITION: "namenode:50070"
    ports:
      - "50075:50075"
  hive-server:
    image: bde2020/hive:2.3.2-postgresql-metastore
    volumes:
      - /home/lionel/docker/data/hadoop-dive/my-data:/my-data
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
```

##### 2. Run docker-compose

```bash
docker-compose up -d
```

##### 3. Connect to Hadoop web interface

[http://localhost:50070](http://localhost:50070)

> ![Hadoop Web UI](/blog/2023/2023-12-30/hands-on/hadoop-web-ui.png)


## MapReduce

#### Create input/output files & folders

```bash
docker-compose exec hive-server bash
```

```bash
root@956bee11e4ec:/my-data/java# hadoop fs -mkdir /user/lco
root@956bee11e4ec:/my-data/java# hadoop fs -mkdir /user/lco/wordcount/     
root@956bee11e4ec:/my-data/java# hadoop fs -mkdir /user/lco/wordcount/input
```

#### Compile java file

```java
import java.io.IOException;
import java.util.StringTokenizer;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

public class WordCount {

  public static class TokenizerMapper
       extends Mapper<Object, Text, Text, IntWritable>{

    private final static IntWritable one = new IntWritable(1);
    private Text word = new Text();

    public void map(Object key, Text value, Context context
                    ) throws IOException, InterruptedException {
      StringTokenizer itr = new StringTokenizer(value.toString());
      while (itr.hasMoreTokens()) {
        word.set(itr.nextToken());
        context.write(word, one);
      }
    }
  }

  public static class IntSumReducer
       extends Reducer<Text,IntWritable,Text,IntWritable> {
    private IntWritable result = new IntWritable();

    public void reduce(Text key, Iterable<IntWritable> values,
                       Context context
                       ) throws IOException, InterruptedException {
      int sum = 0;
      for (IntWritable val : values) {
        sum += val.get();
      }
      result.set(sum);
      context.write(key, result);
    }
  }

  public static void main(String[] args) throws Exception {
    Configuration conf = new Configuration();
    Job job = Job.getInstance(conf, "word count");
    job.setJarByClass(WordCount.class);
    job.setMapperClass(TokenizerMapper.class);
    job.setCombinerClass(IntSumReducer.class);
    job.setReducerClass(IntSumReducer.class);
    job.setOutputKeyClass(Text.class);
    job.setOutputValueClass(IntWritable.class);
    FileInputFormat.addInputPath(job, new Path(args[0]));
    FileOutputFormat.setOutputPath(job, new Path(args[1]));
    System.exit(job.waitForCompletion(true) ? 0 : 1);
  }
}
```

```bash
cd /my-data/java/
export HADOOP_CLASSPATH=${JAVA_HOME}/lib/tools.jar
hadoop com.sun.tools.javac.Main WordCount.java
jar cf wc.jar WordCount*.class

```

#### Copy local file to HDFS

```bash
root@956bee11e4ec:/my-data/java/# hadoop fs -copyFromLocal /my-data/input/file01 /user/lco/wordcount/input/file01
root@956bee11e4ec:/my-data/java/# hadoop fs -copyFromLocal /my-data/input/file02 /user/lco/wordcount/input/file02
root@956bee11e4ec:/my-data/java/# hadoop fs -ls /user/lco/wordcount/input 
Found 2 items
-rw-r--r--   3 root supergroup         22 2024-01-01 16:49 /user/lco/wordcount/input/file01
-rw-r--r--   3 root supergroup         28 2024-01-01 16:49 /user/lco/wordcount/input/file02
root@956bee11e4ec:/my-data/java/# hadoop fs -cat /user/lco/wordcount/input/file01
Hello World Bye World
```

#### Run the application

```bash
hadoop jar wc.jar WordCount /user/lco/wordcount/input /user/lco/wordcount/output
...
root@956bee11e4ec:/my-data/java/# hadoop fs -cat /user/lco/wordcount/output/part-r-00000
Bye	1
Goodbye	1
Hadoop	2
Hello	2
World	2
```


## Source

https://hadoop.apache.org/docs/r2.7.4/hadoop-mapreduce-client/hadoop-mapreduce-client-core/MapReduceTutorial.html