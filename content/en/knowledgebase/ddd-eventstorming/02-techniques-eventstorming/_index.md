---
title: "02. Techniques de l'EventStorming"
tags: [DDD, EventStorming]
date: 2023-12-30
categories: [French]
type: docs
weight: 20
---


Dans le développement logiciel, la compréhension fine du métier est souvent le point de friction principal entre les experts métier et les équipes techniques. C’est là qu’intervient l’EventStorming, une méthode de modélisation collaborative puissante qui permet de visualiser, d’explorer et de structurer les processus métier complexes de manière efficace et intuitive.

## Les grands formats d’EventStorming

> Au fil des années, trois grands types d’ateliers ont émergé :
> - **Big Picture EventStorming** : cartographier tout un domaine ou un ensemble de processus métier.
> - **Process Modelling EventStorming** : se concentrer sur un processus spécifique.
> - **Software Design EventStorming** : modélisation orientée vers la conception logicielle, souvent couplée au DDD (Domain-Driven Design).

## Big Picture

Le format **Big Picture EventStorming** est le plus vaste. Il mobilise souvent **25 à 30 participants** issus de tous les niveaux de l’organisation. L’objectif est d’explorer **l’ensemble d’une ligne métier**, du début à la fin.

{{% pageinfo color="secondary" %}}
#### 💡 Tip : Scénario Global
Utilise un scénario "system-wide" pour aligner tous les participants et révéler les opportunités d'amélioration à travers les départements. Il doit couvrir tout un "customer journey".
{{% /pageinfo %}}

### Step 01 - Domain Events

Le déroulé est itératif : les participants racontent les événements majeurs qui jalonnent les processus de leur organisation, en les positionnant chronologiquement. Cela se traduit par des **Domain Events** (post-its oranges).

<div style="background-color: #FF9933; padding: 10px; width: 80%; margin: 20px auto; border: 1px solid #ddd;">
  Un <strong>Event</strong> ou <strong>Domain Event</strong> : un fait significatif qui s'est produit dans le système, formulé au passé, représentant un changement d'état. Il représente des faits qui se sont produits, indique des changements importants dans le domaine et forme l'épine dorsale de la narration métier.
</div>

![BigPicture - step 1](./image.png)

### Step 02 - Commands and Persons

On ajoute ensuite les **commandes** (post-its bleus).

<div style="background-color:#DAE8FC; padding: 10px; width: 80%; margin: 20px auto; border: 1px solid #ddd;">
Une <strong>commande</strong>, c'est une intention exprimée par un utilisateur ou un système, qui demande qu’une action soit exécutée. Chaque commande déclenche (souvent) un événement, si les conditions métier sont respectées.
</div>

![BigPicture - step 1](./image-1.png)

Et dans le même temps, les **acteurs** ou **personnes** (post-its jaunes) sur les commandes qu'ils déclenchent.

<div style="background-color:#FFFF66; padding: 10px; width: 80%; margin: 20px auto; border: 1px solid #ddd;">
  Un <strong>acteur</strong> ou <strong>personne</strong>, c'est quelqu'un qui agit sur le système et prend des décisions. En général, les personnes sont posées sur des commandes dont elles sont à l'origine.
</div>

![BigPicture - step 3](./image-2.png)

### Step 03 - External Systems

On peut ensuite ajouter les systèmes externes.

<div style="background-color:#FF99CC; padding: 10px; width: 80%; margin: 20px auto; border: 1px solid #ddd;">
  Les <strong>systèmes externes</strong> sont les systèmes maintenus par d'autres équipes ou organisations. Ces systèmes sont les logiciels qu'on ne modélise pas dans le processus actuel.
</div>

![BigPicture - step 4](./image-3.png)

## Process Modeling

Après le format **Big Picture EventStorming**, le second format s'appelle **Process Modeling**. Il vise un niveau de granularité plus fin. On y modélise un **processus spécifique**, de bout en bout, en y ajoutant **plus de rigueur méthodologique**.

Ici, on introduit une **grammaire précise** (événements, commandes, règles, acteurs…), dans un esprit de **jeu collaboratif structuré**, tout en restant du côté métier – on ne descend pas encore dans la conception logicielle.

Ce format permet :

- D’**analyser un processus existant** en profondeur,
- D’**explorer des variantes** ou des scénarios alternatifs,
- De **concevoir de nouveaux processus** à partir de l’expérience terrain,
- D’identifier les **goulots d’étranglement**, **risques**, ou **opportunités d’automatisation**.

Il est particulièrement utile dans les contextes de transformation opérationnelle ou d’amélioration continue.

### Step 04 - Policies

<div style="background-color:#CC99FF; padding: 10px; width: 80%; margin: 20px auto; border: 1px solid #ddd;">
  Une <strong>policy</strong> est une règle métier ou un comportement automatique déclenché par un événement. Elle agit comme une réaction logique à un événement, et peut conduire à une commande ou un autre événement.
</div>

![Process Modeling - step 04](./image-6.png)

Une policy peut également servir à introduire un comportement conditionnel dans la description du processus.

![Policy if then else](./image-10.png)

### Step 05 - Read model

<div style="background-color:#99FF99; padding: 10px; width: 80%; margin: 20px auto; border: 1px solid #ddd;">
  Un <strong>Read Model</strong> (ou <strong>information</strong>) est une vue optimisée pour la lecture, créée à partir des événements métier. Il sert à afficher les données dont un utilisateur ou un système a besoin, souvent via des écrans, APIs, dashboards, etc.
</div>

Ici, le read model **Order Summary** permet à l'utilisateur de vérifier sa commande avant d'exécuter le paiement.

![Process Modeling - step 5](./image-8.png)

## Software Design

Le dernier format s'appelle **Software Design EventStorming**. Il fait le lien entre les événements du métier et leur **implémentation logicielle** potentielle. On y introduit des éléments supplémentaires dans la grammaire comme :

- Les **agrégats** (Aggregates),
- Les **contextes bornés** (Bounded Contexts).

Cela permet d’augmenter la **précision de la discussion**, tout en conservant un fort ancrage métier.

Ce format est particulièrement pertinent pour :

- Concevoir une architecture logicielle alignée sur le métier,
- Identifier les **interfaces** entre domaines,
- Définir des **limites de responsabilité claires**,
- Éviter les couplages inutiles,
- Préparer la modélisation orientée DDD.

Il s’agit du format le plus technique, mais il garde une forte valeur collaborative en maintenant le **dialogue constant entre experts métier et développeurs**.

### Step 06 - Aggregates

<div style="background-color:#FFFFCC; padding: 10px; width: 80%; margin: 20px auto; border: 1px solid #ddd;">
  Un <strong>agrégat</strong> est un concept destiné à être transformé en code — sous forme de classes ou de fonctions. C’est essentiellement une <strong>machine à états</strong>, c’est-à-dire quelque chose qui suit un cycle de vie.
</div>

Dans notre scénario, voici les agrégats que nous pourrions ajouter :

| Aggregate         | Justification possible                                        |
|------------------|--------------------------------------------------------------|
| Payment          | Si le paiement devient un processus complexe à part entière  |
| Shipment         | Pour gérer finement les livraisons (multi-colis, tracking)   |
| ProductInventory | Pour intégrer la gestion de stock (en lecture/écriture)      |

Dans la vraie vie, un **aggregate** est une classe métier qui fait autorité sur un sous-domaine.
Pour les agrégats, on met l’accent sur le comportement, pas sur les données — dans l’esprit de la programmation orientée objet. Toutes les règles métier doivent être appliquées et garanties par cet agrégat.

![Software Design - step 06](./image-9.png)

## Résumé des post-its utilisés

![Software Legend](./legende.png)


En savoir plus : [organiser un workshop pour découper un monolithe en microservices](../03-monolith/)
