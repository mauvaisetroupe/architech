---
title: "Team Topologies"
date: 2023-02-21
tags: [Organization, DevOps, Electro Monkeys ]
categories: [French, Podcast Review]
---

Team topologies est un sujet important pour quiconque s’intéresse à construire la meilleure organisation possible pour ses équipes tout en conservant des valeurs comme l’autonomie, l’auto organisation et la responsabilité. Ce sera le coeur même du sujet du jour avec Julien Topçu.

https://podcasts-francais.fr/podcast/electro-monkeys/team-topologies


## Team Topologies
Les "Team Topologies" sont un modèle d'organisation des équipes, conçu pour aider les entreprises à optimiser leur structure et à améliorer leur agilité. Ce modèle a été développé par Matthew Skelton et Manuel Pais.

"Team Topologies" est très différent d'un organigramme, on modèlise les flux et comment les équipes créent ensemeble de la valeur.

## Cognitive Load

On y parle de charge cognitive (cognitive load). L'idée est de définir la taille des équipes en fonction de leur charge (et en particulier des applications sons leur responsabilité)

Petit parallèle avec DDD. 3 types de complexité :
- Complexité obligatoire : la complexité qui est nécessaire pour modéliser le domaine d'application de manière fidèle. Cela peut inclure la complexité des règles commerciales, la complexité des données et la complexité des interactions entre les différents acteurs du domaine.
- Complexité essentielle : la complexité qui est ajoutée au modèle pour améliorer l'efficacité ou la flexibilité. Cela peut inclure l'utilisation de patterns, la création de modèles de données abstraits ou la mise en place de mécanismes de cache.
- Complexité non essentielle : la complexité qui est ajoutée au modèle sans apporter de valeur ajoutée. Cela peut inclure l'utilisation de technologies ou de patterns non adaptés aux besoins, ou la création de modèles de données trop complexes

## Les 4 topologies d'équipes

### Stream-aligned team
- le but est de créer de la valeur métier 
- elle doivent avoir toutes les compétences pour être autonome  (PO. DEV, OPS)
- se concentrer sur la complexité essentielles

### Plateform team
- Ces équipes sont chargées de la mise en place et de la maintenance des outils, des plateformes et de l'infrastructure nécessaires pour le développement et le déploiement des logiciels.
- Pour supprimer dans les Stream-aligned Teams les charges cognitives qui ne créent pas de valuer métier (comme opérer un cluster Kubernetes)

### Les enabling teams
- Ces équipes sont responsables de la facilitation, de la conception des flux de travail, des pratiques et des politiques organisationnelles pour soutenir l'efficacité des équipes de flux, des équipes de sous-systèmes complexes et des équipes de plateforme.
- Aider à tackler les courbes d'apprentissages pour mener leurs objectifs
- Exemple : coaching pour savoir ce que c'est que des meicroservices
- Typiquement les équipes de crafts

### Complicated subsystem team
- Ces équipes sont spécialisées dans des sous-systèmes complexes et fournissent des services spécifiques aux équipes de flux.
- Souvent un composant du système qui demande une compétence très précise
- Avec des profils spécifiques, sur par exemple la détection de fraude, qui n'ont pas d'intérêt dans les autres équipes
- quand difficile de découper sur les 3 autres types d'équipes

