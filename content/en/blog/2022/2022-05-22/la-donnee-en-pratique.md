---
title: "La donnée en pratique avec Aurélien Allienne"
date: 2022-04-20
tags: [Architecture, Data, Datamesh, Data lake, Lakehouse, Electro Monkeys]
categories: [French, Podcast Review]
---

Electro Monkeys - La donnée en pratique avec [Aurélien Allienne (https://twitter.com/sn0rks) ]de la société SFEIR

Ces dernières années, on fait vraiment grand cas de la donnée. Mais ne vous êtes-vous jamais demandé de quoi était faite la donnée, ou en d'autres termes : qu'est-ce qui constitue la donnée ? Une fois les data points établis, que faire de la donnée ? Est-ce qu'elle est stockée, transformée, manipulée ou analysée ? Et si oui comment, par qui et à quelle fin ?

Pour répondre à toutes ces questions, je reçois . Aurélien est Head of Data pour  Lille, et ensemble nous allons brosser le tableau des pipelines de données, de l'ingestion à la restitution.

https://podcasts.audiomeans.fr/electro-monkeys-0c9902cdaea8/la-donnee-en-pratique-avec-aurelien-allienne-15a123ab


https://open.spotify.com/episode/1GcMa9uGMYrXlDULdcvZi0?si=zahd1QD_RnerznBSbInf3Q

## La data c'est de l'or

- La data est partout, et pour tout le monde, quand je clique sur un lien, quand j'écoute quelque chose en streaming
- il y a derrière du machine learning...

## Les data platform
- pour digérer les data
- principalement dans le cloud
- avec des services managés pour libérer les data engineers des problèmes IT et infra pour se concentrer sur la data, par de la dataviz (data visualization) et/ou du ML
- La partie stockage sur le cloud n’est pas la plus chère, c’est le processing


## L'ingestion 
- souvent du json
- aujourd'hui je conseille d'avoir une isolation parfaite entre la partie opérationnelle et la partie data platform analytics, on fait le lien avec des outils de stream comme Kafka.
- souvent du temps réel , avec un retour en tps réel qui apporte des problématiques (sur un jeu vidéo, le jeu doit continuer même sans réseau).  On va donc utiliser des chargements par batch, ce qu'on sait faire depuis 40 ans, mais avec des batchs plus petit. 
- exemple magasin de retail, des transactions sur un site en ligne, on fait une copie une fois par jour, une fois par heure, des données bruit vers le data lake. J'ai tout stocké sur ma data platform, depuis le début, je peux en faire ce weekend je veux, peu importe ce qui se passe sur le système opérationnelle 
- je peux analyser le comportement par les data scientists par exemple 
- on récupère la data un peu partout, par les logs, les fronts, les backs 
- on pourrait tous stocker, mais les logs pas intéressant de garder plus de 2 mois par exemple 


## Entre la date brut et la data exploitable
Il y a longtemps, on commence à stocker de la donnée, des petas, pour du **datawarehouse** (DWH), récupèrer toute la donnée opérationnelle pour la dataviz

On retrouve aujourd'hui 3 patterns.

### Data Lake / Dataware House

- On stocke du data brut dans le **data lake** (Avro, Json, etc.) 
- le **datawarehouse** ne devient qu'un moteur de calcul au dessus du data lake
- Data brut est stockée dans lake
- Raffinée si besoin dans le warehouse


### Data Lakehouse
- Avec le cloud, on n'a plus de limitation sur un datawarehouse qui était une machine physique que j'héberge on premise
- Cela a modifié la façon dont en pense les plateformes data 
- on va parler d'architecture de type **lakehouse**
- on va mélanger le dataware et le data lake dans une même solution qui va permettre d'interagir avec des fichiers plats
- On définit en général 3 layers :
    - la donnée brut (bronze)
    - la data raffiné de qualité, exemple uniformiser une colonne (silver)
    - gold , uniquement sur requirements métier
- c'est ce que permet par exemple **Databricks** 
- mais on peut le faire avec toutes les solutions data aujourd'hui 


### Datamesh

- Apparait aujourd'hui un nouveau concept, la **datamesh**
- Inspiré du mesh dans le monde des microservices
- La data n'est plus un moyen mais un but, on parle de [data as a product](https://martinfowler.com/articles/data-monolith-to-mesh.html)
- C'est avant tout un point organisationnelle, vue 360 du PO aussi sur la donnée (pour les grosses entreprises)
- Plis d'explication dans la présentation [D'un hack au datamesh, l'évolution du data engineering]({{< ref "../2022-04-20/du-hack-au-datamesh.md">}})
- La data est raffinée avant stockage



## Le besoin de processing de la data évolue

### 2012, SQL
- 2010 avec l'explosion du Web, on stocke beaucoup de données, on se rend compte que SQL n'est plus suffisant pour faire le processing

### Haddop & Spark
- Apparaît alors **Hadoop**, puis **Spark** qui est une refonte de Hadoop et qui permet de process la data
- Spark reste d'actualité pour faire du streaming, il y a d'autres libraires comme Apache Bean avec une approche plus unifié car avec une seule pipeline on peut faire du batch et du stream 

### 2022, le retour de SQL ?
- Mais je sens en 2022 que SQL n'est pas mort et qu'on va en entendre parler, il y a de plus en plus d'initiatives comme BigQuery qui permet d'adresser des petas avec du sa et des temps de réponse très court, et si tu optimise le stockage de ta donnée, la façon dont tu exprimes ton schema, les coûts sont relativement faible
- le SQL apparaît aussi dans des outils hors cloud provider, en 2020, on commence à parler de **DBT** (data build tool,,) qui est la possibilité d'orchestrer nos traitements de données en passant d'un **ETL** (Extract Transform Load) à un **ELT**, d'abord on Load, ensuite on Transforme via du SQL. DBT permet de faire cela via des fichiers YAML de configuration dem anière très simple avec une offre cloud alléchante.
- Il y a aussi **Dataform** (racheté par Goolge) qui permet déxprimer tous nos besoin de transformation Big Data en SQL
- **Databricks** a également un moteur SQL performant derrière c'est transformé en Spark, mais sans avoir besoin de connaitre Spark

> SQL est un langage facile, tout le monde connait, cela va libérer les usages (attention à GDPR)

## Un use case concret

- Chez Sfeir, on va proposer une stack autour de GCP (Google Cloud PLatfomr) car c'est le produit qu'onmaitrise le mieux.
- Les solutions seront différentes en fonction de la taille du client, mais j'oriente vers des solutions mangaées (comme Dataproc chez Google). Les clients ne veulent plus devoir opéré une platform Hadoop eux-même.

### BigQuery & Dataflow pour les petits client
- Pour les petis clients, je pousse l'usage de **BigQuery** qui est une double solutions optimisées pour celle qu'elle doivent faire:
    - solution de stockage **Colossus**, bien stocker les données, sans perte, pour un coût relativement faible
    - solution de processing qui s'appelle **Dremel**, permet d'intéragir avec la donnée en SQL, optimisé par Google
- les benchmarks montrent que en 5 ans, les temps de requêts ont été divisés par 10, sans surcoût
- le streaming avec BigQuery n'est pas possible avec Kafka, je conseille plutôt **DataFlow** sur GCP, qui est un runner de **Beam** (on reste sur de l'open source mais moteur optimisé par Google) pour faire de l'ingestion NRT dans BigQuery, le tout en serverless et donc faire un focus de Data Engineer et DataScientist sur le code pour éviter de perdre du temps sur l'infra, sans être dépendant des équipe platforme et infrastructure

### Data Engineer et Data Scientists
- les Data Engineers ne sauront pas exploiter la data car il faut la comprendre en profondeur
- c'est le rôle des Data Scientists, qui seront très spécialisés sur un métier (par exemple le marketing), pour faire parler la donnée.


## Exploitation de la donnée
- DataViz, science de l'exposition de la données
- Les deux gros pilliers d'exploitation de la données (pour lesquels on fait tout ce travail de rappatrier, sécuriser et raffiner la données) :
    - Les outils peuvent être **Looker** (qui permettent aussi d'exprimer les demandes en SQL) ou des outils plus traditionnels comme **Tableau** ou **Superset**, ont des connecteurs pour tout et peuvent exposer tout type de données (tableau, graphes, cartes, il n'y a plus de limitation dans l'expression). C'est avec ces outils qu'on expose l'existant de la donnée, l'historique (évolution des ventes) 
    - le machine learning c'est le contraire, on utilise la data pour prédire un comportement le futur

## Les clients de la Data
- un chef de produit
- un data scientist qui sait qui lui manque une donnée

## Le data Catalog
- pour ce DS qui cherche sa donnée, plutôt que d'intéragir avec les équipes Data Engineering, on lui met à disposition un outil de recherche (**Data Catalog**). A la "google", il peut faire une recherche pour par exemple trouver toutes les images des produits du catalogue en étant redirigés vers les bon datasets. Si l'outil est bien fait, il pourra demande accès à la donnée, il aura un scéma qui expique ce qu'il y a dans la donnée, toutes les informations sur la donnée.
- il y a un métier qui s'appelle **Data Steward** qui est censé connaitre la Data, il est porteur de la vérité de la donnée. Il doit enrichir la data avec les metadatas.
- Il y a des outils simple, qui ne répond pas à tous les besoins, par exemple **GCP Data Catalog**. On utilise des labels pour référencer par exemple des fichier, ou une donnée dans BigQuery
- Il y a des outils commerciales en dehors comme **Collibra Data Catalog** qui ne font pas que catalogue de donnée,  c'est un outil de gouvernance au sens large. Des personnes auront le rôle d'alimenter cet outil plus complexe à prendre en main, beaucoup plus complexes aussi pour ce qu'elles offrent aux utilisateurs
- Ou je construis le data catalog qui me convient, c'est ce que font les grosses entreprise aujourd'hui (exemple airbnb). Assez intéressant, parce qu'on peut gérer l'accès à la donnée de facon plus précise (les solutions open source ou commerciales vont répondre aux standards de march'comme GDPR, mais pas à des besoins plus fins de l'entreprise).

## Le data lineage
- Le data catalog, c'est le reflet de ce qu'on a actuellement, mais ce n'est pas lui qui porte la transformation de la data. Il permet par contre detrouver une donnée, le métier explique qu'il voudrait la données exposée différement, et cela ce gère dans un projet
- Il y a un a un autre concetp, le **data lineage**. 
- La data arrive à un endroit, brute, dans le data lake. Elle est exposée aux utilisateurs dans le datawarehouse, quel est le chemin que la donnée a suivi pour arriver de la source à la destination, les transformations établies, les stockages intérmédiaires, etc. 
- Certaines solutions de Data Catalog sont capables d'exposer le Data Lineage
- Si un analyste souhaite accèder aux données de vente, il va trouver grâce au catalogue le donnée, va remonter jusqu'au data lake grâce au lineage, et voir qu'il y a peut-être une donnée dans le lake présente pas exposée danl le DWH


## L'impact sur les applications
- si c'est bein fait pas d'impact:
    - on utilise par exemple du kafka 
    - ou on peut faire du CDC (Change Data Capture) sur la base de donnée snas impact sur les performances
- on a de l'isoaltion etre l'applicatif et le stack data, indépendament des langages, des technologies
    - par exemple avec Google analytics
    - avec d'autres open sources pour les front par exemple

## On réplique la data ou on transforne à la volée pour chaque besoin précis?
- on a un principe de single source of truth (la vérité est à cet endroit)
- dans un pattern data lake / dataware, 
    - c'est le datalake qui est la vérité 
    - tu les charges dans le dataware
    - et si fais bien les choses tu les exposes par des vues ou d'autres systèmes qui vont faire le compute quand tu en a besoin
- Avec un lakehouse
    - tu stocke dans une même solution, les données pourront être pré-processées tout de suite dans les différentes couches (bronze, silver, gold) parce qu'on sait que les utilisateurs vont en avoir besoin
    - Cele permet de mettre des systèmes de pseudo-cache plutôt que de faire le compute à chaque étape.
    - Avec Big Query par exemple, le pricing c'est quand on exécute une requête, si tu sais que tu as 100 utilisateurs qui vont faire la même requête toutes les heures, on peut cacher la requête 

## Le coût
- Lors d'une réponse, on essaye de proposer plusieurs solutions qui répondent au besoin
- on commence par une démarche d'audit, comprendre le besoin, les problématique de la data platforme si elle existe, ce qui se passe dans l'opérationnel
- le problème du chiffre c'est qu'il faut connaitre l'usage qui en sera fait, ce qui n'est pas simple en démarrant
- on propose souvent une approchen POC avec des outils simples, avec u ncout simple pour avoir un use case standard, et on est ensuite capable de fire une projection sur 1000 uses cases
- dans le cadre d'ne migartion vers du cloud, on sait ce qui est fait on premise, donc plus simple de metrre en place une calculatrice pour se projeter dans le cloud
- la plus grosse incertitude n'est pa sur la pletfomre, mais sur l'humain (interne, outsourcing,...), ce sont les coût de run, on rentre dans une démarceplus global **FinOps** qui consiste à piloter le budget par le produit. Plutôt que de dire à la fin du moins cela coûte autant, on essaye de comprendre et monitorer le billing par l'usage de la plateform en état proactif et comprendre pourquoi on sort des coût qu'on avait imaginer. On crée des dashboard à l'usage des financier.

## Demain
- on est dans une phase d'accélération
- avec le COVID, on a réinventé pas mal de business, beaucoup de digitalisation qui demande de nouveaux outils
- les 3 clouds grands proviedrs en Europoe (AWS, Azure et GCP) se partaget le marché. Mais des clients ne veulent pas mettre tous les eoufs dans le même panier 
    - ce qui pousse l'arrivée d'acteurs indépendant ([Databrick](https://www.databricks.com/), [Snowflake](https://www.snowflake.com/)) qui proposent des solutions multicloud qui évitent le vendor-locking
    - Apparaissent également pas mal de petites librairies (DBT, etc..)
- La qualité de la donnée doit s'industrialiser avec de l'open source
- Cela bouge très vite, il faut se former sans tomber dans le buzzword (datamesh c'est biem, mais pas pour tout et c'est encore récent). La data ressembel au javascript il y a quelques années avec des librairies qui apparaissent tout le temps

## Se lancer dans la data
- il n'y a pas une voie royale
- aujourd'hui la data, c'est beaucoup de python, de SQL et une tête bien faite, accessible à tous les développeurs
- le cloud, les librairies de processing, cela s'apprend sur le tas
- lorsqu'on a compris qhe le traitement pouvait être distribué, le reste c'est de l'adaptation de ce qu'on sait faire 