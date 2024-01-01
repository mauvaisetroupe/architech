---
title: "Apache Hadoop and Hive"
tags: [Architecture, Data, Lakehouse, Hadoop]
date: 2023-12-30
categories: [English]
---


## Qu'est-ce que Hadoop ?

Hadoop, un écosystème de logiciels open source, a révolutionné la manière dont nous stockons, traitons et analysons de grandes quantités de données. Dans cet article, nous plongerons dans les bases de Hadoop et explorerons son importance croissante dans le monde de la gestion des données.


[Hadoop](https://hadoop.apache.org/) est un framework puissant conçu pour le stockage et le traitement distribué de données massives. Il a été initialement développé par Apache Software Foundation et est largement utilisé dans des applications nécessitant une manipulation efficace de données à grande échelle.

![Hadoop ECosystem](/blog/2023/2023-12-30/01-hadoop-ecosystem.png)

### Hadoop Distributed File System (HDFS)

[HDFS](https://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-hdfs/HdfsUserGuide.html) est le système de fichiers distribué de Hadoop, conçu pour stocker des données sur des clusters de serveurs. Il divise les fichiers en blocs et les répartit sur plusieurs nœuds, offrant ainsi une redondance et une tolérance aux pannes.

Le besoin à l'origine de la création de HDFS était de répondre au défi posé par le stockage et la gestion de vastes ensembles de données sur des clusters distribués. Les systèmes de fichiers traditionnels atteignent rapidement leurs limites face à la croissance exponentielle des données dans l'ère du Big Data. HDFS a été conçu pour fournir une solution extensible, tolérante aux pannes et capable de gérer efficacement de grandes quantités de données sur des clusters de machines.

#### Concept de blocks

HDFS gère ses propres blocs de données, et la taille de ces blocs est une considération spécifique au fonctionnement de HDFS plutôt qu'au système de fichiers du système d'exploitation sous-jacent. La taille des blocs dans HDFS est souvent choisie en fonction des besoins de performance et de traitement parallèle des données. Plutôt que de stocker un fichier dans son intégralité sur un seul nœud, HDFS divise les fichiers en blocs de taille fixe (par exemple, 128 Mo ou 256 Mo) et les répartit sur plusieurs nœuds du cluster. Cette approche présente plusieurs avantages (Parallélisme, répartition de Charge, tolérance aux Pannes)

#### Concept de Maître-Esclave
HDFS suit un modèle maître-esclave, composé de deux entités principales :

- **NameNode (Maître) :** Il est responsable de la gestion du système de fichiers, de la métadonnée et de la navigation vers les blocs de données. Le NameNode conserve un enregistrement de la hiérarchie des fichiers et des métadonnées associées.

- **DataNode (Esclave) :** Ces nœuds stockent réellement les blocs de données. Ils écoutent les commandes du NameNode et sont responsables du stockage et de la récupération des données.

Cette architecture maître-esclave assure la séparation des responsabilités entre la gestion des métadonnées et le stockage réel des données, permettant une extensibilité et une disponibilité élevées.

### MapReduce

[MapReduce](https://hadoop.apache.org/docs/current/hadoop-mapreduce-client/hadoop-mapreduce-client-core/MapReduceTutorial.html) est un modèle de programmation utilisé pour traiter et analyser des données massives en parallèle. Il se divise en deux phases, la phase de map et la phase de reduce, permettant ainsi une exécution distribuée des tâches.

### YARN (Yet Another Resource Negotiator)

[YARN](https://hadoop.apache.org/docs/current/hadoop-yarn/hadoop-yarn-site/YARN.html) est le gestionnaire de ressources de Hadoop. Il alloue les ressources nécessaires aux applications en cours d'exécution sur le cluster, assurant ainsi une utilisation efficace des ressources  (cpu, memory, disk, network) 

### Autres composants

#### Apache Sqoop

Apache Sqoop est un outil open-source qui facilite le transfert bidirectionnel de données entre Hadoop et des bases de données relationnelles. Il propose des connecteurs pour différentes bases de données, s'intègre avec l'écosystème Hadoop (Hive, HBase, etc.) et gère les détails d'accès aux données, permettant ainsi un échange efficace de données entre les environnements relationnel et distribué.

#### HBase

HBase est une base de données NoSQL distribuée et évolutive, intégrée à l'écosystème Hadoop. Elle utilise un modèle de données clé-valeur, stocke ses données sur HDFS, offre un accès rapide aux données, et est adaptée aux cas d'utilisation nécessitant une faible latence pour les opérations de recherche, notamment pour des données non structurées ou semi-structurées.


## Hive : Simplifier l'Analyse des Données avec le Langage SQL

### Qu'est-ce que Hive ?

[Hive](https://hive.apache.org/), développé par Facebook, puis par la Fondation Apache, est  un système d'entrepôt de données (**data warehouse**) qui permet de traiter des données structurées et semi-structurées dans Hadoop

### Fonctionnmenet de Hive

- Apache Hive est principalement utilisé dans des scénarios d'**OLAP** (Online Analytical Processing) en raison de ses capacités de traitement analytique sur de grandes quantités de données, et non pour le traitement de donées transactionnelles (OLTP)
- Hive utilise un langage SQL-like appelé HiveQL ou **HQL** pour permettre aux analystes et aux développeurs de tirer des insights des données sans avoir besoin de compétences approfondies en programmation.
- Il stocke les schémas dans une base de donnée relationnelle **Hive Metastore**, mais les données traitées sont stockées dans HDFS

![Hive Exceution](/blog/2023/2023-12-30/hadoop-hive-execution.drawio.png)


### Hive Metastore

#### Gestion des Métadonnées

Le Metastore Hive stocke les métadonnées associées aux tables, aux partitions et aux schémas de données. Ces métadonnées comprennent des informations telles que le nom de la table, les colonnes, les types de données, les propriétés de stockage, etc.

#### Catalogue Centralisé

Le Metastore Hive fournit un catalogue centralisé qui permet aux utilisateurs d'enregistrer et de consulter des informations sur les données stockées dans Hive. 

#### Indépendant du Stockage

Le Metastore est indépendant du système de stockage sous-jacent (HDFS, S3, etc.). Cela signifie que même si les données sont stockées dans un système de fichiers distribué tel que HDFS, les métadonnées sont gérées de manière centralisée par le Metastore.

Par défaut, le Metastore utilise **Apache Derby**, qui est une base de données Java intégrée recommandé uniquement pour des déploiements de développement ou des installations de petite envergure. Dans des environnements de production, il est courant de configurer le Hive Metastore pour utiliser des bases de données relationnelles plus robustes et extensibles telles que **MySQL, PostgreSQL, Oracle Database ou Microsoft SQL Server**

### Hive Data Model

Dans un data warehouse traditionnel, multi dimensionnel (modèle en étoile ou flocon) basé sur des cubes de données, certaines requ6etes peuvent prnedre des heures voire des jours. Grâce à son modèle de donnée distribué, Hive et Hadoop répondent à ce besoin

![Hadoop ECosystem](/blog/2023/2023-12-30/hadoop-data-model.drawio.png)

Le modèle de données de Hive organise les données de la manière suivante :
- Tables, ce sont les namesapce pour les tables
- Partitions, des sous-répertoire
- Buckets, des fichiers

Dans Hive, la base de données est considérée comme un catalogue ou un espace de noms pour les tables.

Au sein d'une base de données particulière, les données dans les tables sont sérialisées, et chaque table a un répertoire HDFS correspondant. 

Chaque table peut être subdivisée en partitions qui déterminent comment les données sont distribuées au sein de sous-répertoires du répertoire de la table. 

Les données au sein des partitions peuvent être encore divisées en buckets.

#### Partitions

Pour créer une partition dans Hive, on peut utiliser la clause `PARTITIONED BY` lors de la création d'une table. 

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

-- Autres insertions dans d'autres partitions...
```

Cela créera une structure de répertoires dans le système de fichiers Hadoop, où chaque département aura son propre sous-répertoire sous le répertoire principal de la table. Cela permettra d'optimiser les requêtes qui filtrent ou agrègent des données basées sur le département.

> ![Hadoop Web UI - Partitions](/blog/2023/2023-12-30/hadoo-web-ui-partitions.png)

#### Bucket

À l'intérieur de chaque partition, les données peuvent être divisées en buckets en fonction du hachage d'une colonne spécifiée dans la table. Ce processus est appelé le "bucketing".

```SQL
-- Création de la table avec partition et buckets
CREATE TABLE employee3 (
    emp_id INT,
    emp_name STRING,
    emp_salary DOUBLE
)
PARTITIONED BY (emp_department STRING)
CLUSTERED BY (emp_id) INTO 4 BUCKETS;

-- Insertion de données dans la table avec spécification de la partition et du bucket
INSERT INTO TABLE employee3 PARTITION (emp_department='IT') VALUES (1, 'John Doe', 50000.0);
INSERT INTO TABLE employee3 PARTITION (emp_department='HR') VALUES (2, 'Jane Smith', 60000.0);
-- Et ainsi de suite...

-- Requête qui exploite les partitions et les buckets
SELECT * FROM employee3 WHERE emp_department='IT' TABLESAMPLE(BUCKET 1 OUT OF 4 ON emp_id);
```

## Hive Hands-on

Want to try ? 
- [How to do a implement MapReduce in Jave using Docker]({{< ref "./hands-on/mapreduce-hands-on.md" >}})
- [How to do a Hive hands-on using Docker]({{< ref "./hands-on/hive-hands-on.md" >}})













#### Sources
- https://hadoop.apache.org/
- https://cwiki.apache.org/confluence/display/hive/design
- [Youtube big data playlist](https://www.youtube.com/playlist?list=PLlFvk4v0wHXAJvIuahEGosanT4HocmOLv)

