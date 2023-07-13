---
title : D'un hack au datamesh, l'évolution du data engineering... 
date: 2022-04-20
---

Conférence Devoxx 2022
D'un hack au datamesh, l'évolution du data engineering... (Simon Maurin et Stéphanie Baltus-Bergamo) 
chez leboncoin.fr

## 2006, le script shell

2006, shell script qui envoie un emial au gems dumarketing qui font un copie/coller dans un Excel

> ![image1](/blog/2022/2022-04-20/image1.png)


## 2012, stack de Business Intelligence "by the book". 

Un ETL qui fetch les données dans la source et qui les stocke dans un cache.

Nous transformons les données en un format optimal pour les analyses, puis nous les chargeons dans un data warehouse. Les marketeurs utilisent le data warehouse pour créer des tableaux de bord et prendre de meilleures décisions commerciales.

> ![image2](/blog/2022/2022-04-20/image2.png)

Les marketeurs sont contents de notre stack analytique, mais nous nous heurtons à des défis d'échelle et de stabilité. 
- La quantité de données que nous devons gérer est énorme.
- Les données sont très hétérogènes et doivent être nettoyées et normalisées avant de pouvoir être analysées.

Nous avons besoin de développer des outils et des processus pour gérer l'incrément et la stabilité de notre stack analytique

## 2015, Big Data

On met les objectifs se ce qu'on souhaite mettre en oeuvre

> ![image2](/blog/2022/2022-04-20/image3.png)

Nous avons réalisé que nous avions besoin de changer notre approche de l'analyse de données. 

- Notre stack analytique actuel était basé sur des outils traditionnels qui n'étaient pas à la hauteur de la tâche. Nous avions besoin d'une solution qui était distribuée, résiliente et élastique.

- on veut passer à une approche plateforme, on ne veut plus faire que de la BI, on beut produire des produits data driven (produit créé à partir de la data, soit du Machine learning, ou juste à partir de statistique). Pour cela il faut 
    - découpler, séparer les responsabilité pour découper notre gros monolithe, 
    - construire un data lake (stockage objet de data brut), on stocke l'ensemble de la donnée, pas juste celle utilisée à un moment t (pour les besoin du futur)

- augmenter la résilience. Nous avons choisi d'utiliser Apache Airflow, une plate-forme open source pour le flux de données et la gestion de l'orchestration. Airflow nous a permis de créer un flux de données distribué qui était résilient aux pannes et élastique pour répondre à la demande (airbnb)


> <img src="/blog/2022/2022-04-20/img_2023-07-13_17-53-13.png">

On a besoin d'observaility, classique avec datadog.

> <img src="/blog/2022/2022-04-20/img_2023-07-13_17-53-23.png">

On passe d'un système à J-1 (et donc consistante) à un système Eventual Consistent (différence de lag en fonction de la data) par contre à J+1 tout est chargé et donc consistant

> <img src="/blog/2022/2022-04-20/img_2023-07-13_17-53-37.png">

Airflow permet de rejouer nos flux de chargement (en cas de bug). La stratégie d'idempotence,  nous a permis de rejouer nos flux de données sans créer de données dupliquées. Cela nous a donné la tranquillité d'esprit de savoir que nos données étaient toujours cohérentes.

> <img src="/blog/2022/2022-04-20/img_2023-07-13_17-53-56.png">

On versionne les objet et on fait des update au lieu de create dans les ordres SQL

> <img src="/blog/2022/2022-04-20/img_2023-07-13_17-55-46.png">

Notre architecture change :
- on continue de faire des extracts dans le data sources, sans business rules, et on stocke dans le data lake (AWS S3)
- ces extractions sont orchestrés via airflow qui lance des scripts SQL et des tâches sur Spark (framework de calcul distribué qui va permttre de distribuer les transfos), monitoré par Datadog
- on a notre solution BI, qui est passé de PostgreSQL à Redshift (AWS). Les marketeurs se pluggent dessus avec Tableau et les Data Scientist requêtes Redshift avec Jupyter notebook 
- on a nos premier produits data-driven : 
    - des stats pour le CRM,  pour les télévendeurs qui sait combien le client a déjà déposé d'annonces
    - de l'emailing plus ciblé sur le comportement de l'utilisateur
> <img src="/blog/2022/2022-04-20/img_2023-07-13_17-56-27.png">


## 2017, Fetures teams & microservices

L'organisation nus rattrape, on grossit et on arrive à la limite du cycle en V. On passe aussi du monolithe à une archi microservices. Jusqu`à présent, on se source directement dans la DB du monolithe ce qui imposait une contrainte aux dévelopeurs du monolithe qui ne devait pas casser les extractions

> <img src="/blog/2022/2022-04-20/img_2023-07-13_18-41-36.png">

Avec le passage à l'échelle, il faut mettre un contract explicite (et non plus implicite)... On veut passer par un bus d'event. On met les data et backend dans une salle pour négicier les contrats.

> <img src="/blog/2022/2022-04-20/img_2023-07-13_18-43-59.png">

L'architecture devient cela :

> <img src="/blog/2022/2022-04-20/img_2023-07-13_18-44-14.png">


# 2018, la direction veut un retour sur investissement

On se fait rattraper par la direction qui veut de l'IA, de la valeur ajoutée... (service de recommandation d'annonces)

Un peu de contexte, un data scientiste comment ca travaille :
1. on met de la donnée à disposition à travers redshift et S3
2. il/elle exploite la data pour voir commenet faire un modèle de recomandation et faire des petits test de modèles
3. quand c'est viable, on déploie en PROD et on monitore que ca fonctionne

> <img src="/blog/2022/2022-04-20/img_2023-07-13_18-48-59.png">

On intègre la partie pipeline avec Airglow qui va permettre d'entrainer tous les modèles des data scientist en ajoutant Tensorflow

> <img src="/blog/2022/2022-04-20/img_2023-07-13_18-51-52.png">

On ajoute un autre microservice sur kunernetes monitoré sur datadog et envoie des événnements dans Kafka pour les recos (c'est un service comme un autre)

> <img src="/blog/2022/2022-04-20/img_2023-07-13_18-51-58.png">

# 2019, Data Mesh

On se fait une fois de plus rattrapé par l'organisation.
Les effctifs ont doublé, les features teams permettent de gérer cela, mais au noveau Data on est resté en équipe centralisé (et ne sont donc pas scalable et deviennent bottleneck)

> <img src="/blog/2022/2022-04-20/img_2023-07-13_18-55-31.png">


> The term data mesh was first defined by Zhamak Dehghani in 2019[6] while she was working as a principal consultant at the technology company Thoughtworks.
> [How to Move Beyond a Monolithic Data Lake to a Distributed Data Mesh](https://martinfowler.com/articles/data-monolith-to-mesh.html)

L'architecture et l'organsiation en place chez leboncoin est très fréquent eta un problème d'échelle.
- on peut optimiser l'ingestion
- on peut avoir une équipe de spécialiste au milieu qui construise les produits au dessu sdu data lake
- mais pour faire circuler la donnée et les compétences au sein de l'entreprise, cela ne fonctionne pas

> <img src="/blog/2022/2022-04-20/img_2023-07-13_18-58-01.png">


Elle propose un contre modèle, qui propose de décentraliser cette approche (l'article est très bien écrit)

- Il faut remettre les compétences data engineering et le code de date à enginering dans les features team, pas de coupure technologique, et faire du Domain Driven Design de bout en bout. Les features  teams chez nous opèrent les services, applicatifs, les APIs, les flux d'events mais aussi les pipelines et les dataset
qui sont construits on top (qui peuvent être considérés comme des interfaces vers les autres équipes)
- cela sáppuie sur deux éléments
    - un socle standard qui permet l'intéropabilité (en haut)
    - une plateforme (en bas) qui en gros permet de servir toute la partie infre aui est un peu lourde à mettre en place (flux kafka, bucket S3, cluster Spark à la demande, l'orchestration)


> <img src="/blog/2022/2022-04-20/img_2023-07-13_19-03-53.png">

Le socle standard du haut, on l'a presque avec nos règles sur la facon de gérer nos interfaces au desssus du bus d'events, il suffit de les porter jusqu'au Data Lake (S3 et batch)

> <img src="/blog/2022/2022-04-20/img_2023-07-13_19-16-19.png">

Côté People, on descend les gens qui travaillainet sur le système de reco, pour en faire une vraie feature team, et on injecte des data engineers dans les équipes qui ont des vrais besoin (on ne peut pas faire de big bang). Et les data engineers qui restent centralisés construisent la data Infra as a platform 






