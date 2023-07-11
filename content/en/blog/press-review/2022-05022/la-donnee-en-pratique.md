---
title: "Electro Monkeys - La donnée en pratique avec Aurélien Allienne"
date: 2022-04-20
tags: [Architecture, Data]
categories: [French, Podcast Review]
---

La donnée en pratique avec Aurélien Allienne - Data Leader chez SFEIR

https://podcasts.audiomeans.fr/electro-monkeys-0c9902cdaea8/la-donnee-en-pratique-avec-aurelien-allienne-15a123ab


Data, 3 architectures
- Data lake, warehouse, data brut dans lake, raffinée si besoin dans le warehouse
- Data Mesh, data raffinée avant stockage
- Entre les deux, LakeHouse , 3 layers :
    - donnée brut (bronze)
    - raffiné de qualité, exemple uniformiser une colonne (silver)
    - gold , uniquement sur requirements métier

La partie stockage sur le cloud n'est pas la plus chère, c'est le processing