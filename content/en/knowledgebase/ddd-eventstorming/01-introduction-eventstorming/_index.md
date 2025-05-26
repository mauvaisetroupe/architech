---
title: "01. Introduction à l'EventStorming"
tags: [DDD, EventStorming]
date: 2023-12-30
categories: [French]
type: docs
weight: 10
---


Dans le développement logiciel, la compréhension fine du métier est souvent le point de friction principal entre les experts métier et les équipes techniques. C’est là qu’intervient l’EventStorming, une méthode de modélisation collaborative puissante qui permet de visualiser, d’explorer et de structurer les processus métier complexes de manière efficace et intuitive.

## Un peu d’histoire

EventStorming a été introduit en 2013 par Alberto Brandolini. Pour plus de détails sur son origine et son évolution, consultez l’article complet ici : [https://www.avanscoperta.it/en/eventstorming/](https://www.avanscoperta.it/en/eventstorming/).

## Qu’est-ce que l’EventStorming ?

L’EventStorming est une approche de modélisation orientée événements métiers (domain events), inventée par Alberto Brandolini. Elle repose sur une session collaborative impliquant toutes les parties prenantes – développeurs, experts métier, UX designers, product owners – afin de construire ensemble une vision partagée du système.

Plutôt que de partir d’une documentation technique ou de diagrammes UML, l’EventStorming commence par des post-its de couleurs différentes, collés sur un mur ou un tableau blanc, pour représenter les événements, commandes, agrégats, acteurs, règles métier, etc.

EventStorming repose sur quelques constats simples mais puissants :
- Les problèmes complexes ont besoin de visualisation.
- Les meilleures conversations naissent quand les outils s’effacent. Les tableaux blancs laissent place à l’exploration, là où les outils plus rigides comme BPMN ou UML freinent les idées et excluent ceux qui ne maîtrisent pas leur langage.

> L'EventStorming est une méthode rapide et visuelle qui favorise une vision partagée et permet de détecter précocement les zones grises dans un processus complexe.

## Les grands formats d’EventStorming

EventStorming se décline en plusieurs formats, adaptés à différents niveaux de profondeur. Tous reposent sur le **récit collectif** à l’aide de **post-its colorés** sur une grande surface de modélisation (généralement un long rouleau de papier).

> Au fil des années, trois grands types d’ateliers ont émergé :
> - [**Big Picture EventStorming**](../02-techniques-eventstorming/#big-picture) : cartographier tout un domaine ou un ensemble de processus métier.
> - [**Process Modelling EventStorming**](../02-techniques-eventstorming/#process-modeling) : se concentrer sur un processus spécifique.
> - [**Software Design EventStorming**](../02-techniques-eventstorming/#software-design) : modélisation orientée vers la conception logicielle, souvent couplée au DDD (Domain-Driven Design).

Plus de détails sur [la technique, les post-its à utiliser, les grandes étapes](../02-techniques-eventstorming/).

## Espace Problème / Solution

> En Domain-Driven Design (DDD), il est essentiel de distinguer :
> - l’espace du **problème** (ce que le domaine métier cherche à résoudre) ;
> - l’espace de la **solution** (la façon dont le logiciel le résout).

Le *Modeling Whirlpool* décrit le flux naturel de la modélisation en DDD. Il s’agit d’une oscillation continue entre l’espace du problème (compréhension métier) et l’espace de la solution (conception logicielle). Ce va-et-vient permet de raffiner progressivement le modèle jusqu’à ce qu’il réponde à la fois aux besoins métier et aux contraintes techniques.

![alt text](./image-whirlpool.png)

### Les étapes du tourbillon :

1. **Raconter une histoire** : parcourir des scénarios utilisateurs concrets pour ancrer la réflexion (ex. : activer le régulateur de vitesse).
2. **Proposer un modèle** : élaborer un premier modèle basé sur les scénarios (ex. : Service de régulation de vitesse, Service moteur).
3. **Découvrir de nouveaux éléments** : identifier des cas limites ou contraintes inattendues (ex. : reprise manuelle via la pédale).
4. **Retour à l’histoire** : affiner le modèle à partir des retours métier.

Ce processus est itératif : chaque passage dans le *whirlpool* améliore la pertinence du modèle en le confrontant à la réalité métier et aux contraintes techniques.

### Quel est le lien avec l'EventStorming ?

Voici un tableau qui les met en relation avec les espaces du DDD :

| Type d’EventStorming             | Espace DDD               | Explication |
|----------------------------------|--------------------------|-------------|
| Big Picture EventStorming        | Espace du problème       | Vision d’ensemble du métier, parties prenantes, objectifs. L’objectif est de comprendre, pas de concevoir. |
| Process Modelling EventStorming  | Espace du problème (majoritairement) | Zoom sur un processus métier spécifique. On s’approche de la solution, mais on reste dans la compréhension métier. |
| Software Design EventStorming    | Espace de la solution    | On modélise les agrégats, commandes, politiques, événements techniques, limites de contexte, etc. |

> Un dans un workshop d'EventStorming, par exemple visant à [découper un monolithe](../03-monolith/), on devra :
> 1. Travailler dans l’espace du **problème**, pour **comprendre ce qu’il faut modéliser** et aligner tous les participants autour d’une compréhension partagée.
> 2. Travailler dans l’espace de la **solution**, pour **faire émerger les microservices** qui remplaceront le monolithe.


## Conclusion

En combinant ces trois formats, il est possible d’orchestrer une approche holistique : commencer par un **Big Picture**, zoomer avec un **Process Modeling**, puis approfondir la conception avec un **Software Design**.

Un fil conducteur : la collaboration visuelle, au service de la compréhension et de l’action.

Plus de détails sur [la technique, les post-its à utiliser, les grandes étapes](../02-techniques-eventstorming/).
