---
date: 2016-01-04
title: Il n'y a pas de bon modèle métier
tags: [Architecture, DDD, Devoxx]
categories: [French, Conference Review]
---

Devoxx 2012 - Grégory Weinbach - Il n y a pas de bon modèle métier


On vous le répète : une application répond bien aux besoins de ses utilisateurs si elle reflète bien leur métier. Les approches du développement orientées Utilisateur sont d'ailleurs faites pour ça : le DDD d'Eric Evans comme le BDD de Dan North concentrent leurs efforts sur la modélisation du "Coeur du Domaine".
En pratique, comment faire un "bon" Modèle Métier ?
Traditionnellement, on dit qu'il faut représenter au mieux la réalité de ce métier : faire "coller" le code au plus près du monde réel pour garantir l'adéquation au besoin.

Malheureusement, cette approche naïve est mauvaise ! Pourquoi ? Parce qu'un logiciel ne représente pas le monde réel, il informatise des services rendus.

Parce qu'un Modèle de Domaine n'est pas un Modèle du Métier, c'est un modèle de conception répondant à des exigences de codage.

Et je vous montrerai, à partir d'exemples, pourquoi il ne doit pas être construit en observant le monde réel mais à partir des besoins de présentation ou de services.

https://www.youtube.com/watch?v=qN43Dy6fGkk


## Domain Driven Design

Souvent application ne répond pas aux utilisateurs:
- parce que besoin mal exprimé
- parce que difficile de traduire ce besoin en software

Concevoir pour l’utilisateur. Pourquoi vous voulez un logiciel? Quel sont ses objectifs métier? Agile pour diminuer le perte dínformations dans la communication.

DDD, livre de Eric Evans : 
- la connaissance du domaine, une vue sur le domaine, le modèle domaine 
- l’originalité dans DDD, le modèle est un modèle de conception :
    - il vit en parallèle du code, c’est un équivalent du code; 
    - les deux ont un cycle de vit commun
    - quand on modélise, on code 
- Le modèle et le code partagent un langage comme, ubiquitous language, partagé entre les utilisateurs, les concepteurs, les développeurs
- c’est un vrai modèle objet (donnée, structure, comportement)

## Comment bien construire ce modèle métier?

Construire un modèle métier c'est compliqué :
- En voulant répondre à tous les besoins, on a répondu à aucun besoin
- Il n’y a pas un modèle, il y a des modèles

Eric Evans, sur son bouquin insiste sur un point, la notion de contexte

- Un modèle n’est valable que dans un contexte donné
- C’est un point de vue métier
- C’est qui est difficile et important, c’est identifier ces contextes
- Mais aussi de bien les cerner les frontière (context boundaries)
- Un livre qui passe de l’éditeur à l’imprimeur, il doit y avoir quelques informations qui passent d’un contexte à l’autre (souvent, à part l’identifiant, il y en a très peu)
- On doit donc être capable de traduire une partie des informations qui sont visible dans un contexte vers un autre contexte, grâce à une translation map translation map = transcodification basé sur un partage d’identité
- Donc première chose à faire identifier les contexte et définir les limites et comment on va passer de l’un à l’autre
- Pour simplifier, un contexte = 1 domaine

[Mes notes en pdf](/blog/il-n-y-a-pas-de-bon-modele-metier.pdf).

