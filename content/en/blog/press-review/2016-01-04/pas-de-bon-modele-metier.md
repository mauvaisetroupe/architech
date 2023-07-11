---
date: 2016-01-04
title: Il n'y a pas de bon modèle métier
---

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
