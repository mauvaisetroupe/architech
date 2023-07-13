---
title: "La donnée en pratique avec Aurélien Allienne"
date: 2022-04-20
tags: [Architecture, Data, Electro Monkeys]
categories: [French, Podcast Review]
---

Electro Monkeys - La donnée en pratique avec Aurélien Allienne

Ces dernières années, on fait vraiment grand cas de la donnée. Mais ne vous êtes-vous jamais demandé de quoi était faite la donnée, ou en d'autres termes : qu'est-ce qui constitue la donnée ? Une fois les data points établis, que faire de la donnée ? Est-ce qu'elle est stockée, transformée, manipulée ou analysée ? Et si oui comment, par qui et à quelle fin ?

Pour répondre à toutes ces questions, je reçois . Aurélien est Head of Data pour  Lille, et ensemble nous allons brosser le tableau des pipelines de données, de l'ingestion à la restitution.

https://podcasts.audiomeans.fr/electro-monkeys-0c9902cdaea8/la-donnee-en-pratique-avec-aurelien-allienne-15a123ab


Data, 3 architectures
- Data lake, warehouse, data brut dans lake, raffinée si besoin dans le warehouse
- Data Mesh, data raffinée avant stockage
- Entre les deux, LakeHouse , 3 layers :
    - donnée brut (bronze)
    - raffiné de qualité, exemple uniformiser une colonne (silver)
    - gold , uniquement sur requirements métier

La partie stockage sur le cloud n'est pas la plus chère, c'est le processing