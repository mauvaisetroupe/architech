---
date: 2017-12-19
title: L'API ne fait pas le moine
tags: [Architecture, API, WOA]
categories: [French, Conference Review]
---

Compte-rendu du petit-déjeuner “L’API ne fait pas le moine” chez Octo, Paris, 19 décembre 2017

## API essentials

- Octo travaille sur les API depuis plusieurs années.
- Ils le font chez de nombreux clients, en mode agile. Ils parlent de « squad » ou « tribu » qui est le premier pas vers la « feature team »
- API devient aujourd’hui « mainstream », tout le monde en parle, tout le monde en fait. Par contre peu de chose déjà en PROD


## Pourquoi les APIs


### Complexité d’internet, des devices, multi-canal

- C’est la raison principale rencontré chez les clients d’OCTO
- Pour répondre à la transformation du web, les smartphones, IOT
- On parle de ATAWAD :  Any Time, Any Where, Any Device  
- On définit un service sans idée préconçue de ce à quoi il pourra servir, la manière exacte dont il va être utilisé.

### Ouverture du SI

En 2002, Jeff Bezoz, PDG d’Amazon, disait déjà : « tout service doit être ouvert en dehors de l’entreprise ». Pour créer de nouveau modèle d’affaire (business case) et out-sourcer l’innovation

Peu de clients encore chez Octo dans cette catégorie. Pourquoi ? Il y a plusieurs freins :
1. La sécurité
2. Il s’agit souvent d’un projet IT. Il faut un sponsor métier pour que ça marche.

Du coup,
-  on fait des API, parce que c’est un modèle efficace et rapide de développer (peu de métrique cela dit sur ce point, même si le speaker y croit)
- mais un peu comme de la SOA, sans pousser les services vers l’extérieur.

![alt_text](/blog/2017/2017-12-19/image0.png "image_tooltip")


## API : Définition

La définition de wikipedia est trop IT. Chez Octo on donne cette définition : **Industrialisation du processus des ressources de l’entreprise sur le web**


![alt_text](/blog/2017/2017-12-19/image1.png "image_tooltip")



- Le web : HTTP et REST
- Rapide, industriel
    - Cela doit être rapide (industriel) de mettre en PROD un nouveau service API
    - On ne doit pas créer (expérience vécue dans une banque) à chaque nouveau partenaire un projet de 4 mois, définir un contrat, tester, « non, le contrat ce n’est pas ça »... ça prend trop de temp
    - Chez OCTO, il parle de TTFAC (Time To First API Call) de 15 minutes


## API : le bon design

- Standard http, niveau 3 de maturité http (Richardson maturity level)
- S’inspirer des géants du web
- Simple et externalisable (pas d’acronyme, en anglais)
- Bonne affordance (en ergonomie : capacité d’un objet à suggérer sa propre utilisation)


## Architecture

API = au cœur de l’architecture aujourd’hui


![alt_text](/blog/2017/2017-12-19/image2.png "image_tooltip")
 (les chiffres sont tirés de facebook)


- tous ces applications appel **<span style="text-decoration:underline;">sur internet</span>** api.mycompany.com
- les développeurs s’enregistre sur developpers.mycompany.com (ce portail est l’outil qui permet l’industrialisation)
- Derrière une gateway (pas obligatoire) point d’entrée unique de toutes les requêtes
- Gestion de la sécurité (OAUTH2 OIC comme protocole standard)
- Resources provider (on le voit de + en + ces dernièères années), systèems techniques, applications, responsable de leur API ou ressources sur un périmètre  fonctionnel donné

 
On rencontre souvent dans les entreprises des services, ou microservices. Mais pour être une API, cela doit être externalisable.


### REST vs SOAP

- Sujetadressé tout le temps
- Soap est un zombi. Il restera, dans l’entreprise.
- Exposer des services SOAP en reste avec un outillage automatique ne sert à rien, car pas affordance, pas prévu pour être externalisable
- Aujourd’hui tous les grands font du REST, sauf Paypal ! Dans les entreprises, les clients partent sur REST. Peu intègre du SOAP dans le portal


## API Management


### C’est quoi ?

- Reflexe un peu français de vouloir tout régler en achetant un progiciel
- Oui, il faut une solution d’API management.
- Ca peut être un produit open source, ou commercial.
- Entre le SI et les consommateurs


![alt_text](/blog/2017/2017-12-19/image3.png "image_tooltip")


API mangement couvre les features suivantes :

- Gateway, c’est technique, c’est un point d’entrée unique (pas obligatoire, il existe des architecture sans...),
- Sécurité. Le produit ne fait souvent pas grand-chose, il y a quasiment toujours un impact sur le backend. Complexité de OAUTH2 et OIC, douleur à mettre en place
- Portail développeur : marche bien dans les produits. Enrôler les développeurs internes et externes, récupérer une clé et d’exposer la documentation
- API portal : marche bien dans les produits ; console de supervision que les API manager (technique ou business) vont utiliser pour manager l’API voir ce qui se passe, gérer des aplications, publier des ressources
- API façade : brique de transcodage. Par exemple transcoder MQ en REST. Use with caution ! Ne pas tomber dans le pattern ESB qui nous a fait du mal (gros bloc monolithique)(souvent c’est du transcodage, donc pas une recommandations d’utiliser ce genre d’outil) ; peu de clients partent sur cette stratégie là.

 


### Buy vs Build



![alt_text](/blog/2017/2017-12-19/image4.png "image_tooltip")


- « Buildez,  craftez votre API » => valeur ajoutée
- « Achetez un produit ou utilisez de l’open source pour votre portail et votre sécurité »


## Architecture Big Picture : de la SOA en SOAP à la WOA

![alt_text](/blog/2017/2017-12-19/image5.png "image_tooltip")

## Patterns d’intégration – fAçADE OR NOT FAçADE

### Façade API monolithique (ESB)

![alt_text](/blog/2017/2017-12-19/image6.png "image_tooltip")
- ESB amélioré ou API management, c’est souvent la même chose, API construite par cette brique
- Pas préconisé (performance, ...)

![alt_text](/blog/2017/2017-12-19/image8.png "image_tooltip")


### Services / Microservices API 

![alt_text](/blog/2017/2017-12-19/image7.png "image_tooltip")
- Vu chez nos clients, préconisé
- Cela ne veut pas dire qu’il n’y a pas de façade, si pas possible de le faire directement dans backend, on fait une petite façade (c’est du code, c’est ça la différence)
- Par contre pas au début directement, car cela signifie que tous les gens du back font du REST. On commence par MVP...

![alt_text](/blog/2017/2017-12-19/image9.png "image_tooltip")


[https://blog.octo.com/strategie-d-architecture-api/#bigpic](https://blog.octo.com/strategie-d-architecture-api/#bigpic)


## Stratégie pour mettre en place des APIs


### Commencer petit, faites des MVP

Le point organisationnel est crucial : les squad, petites équipes agiles, auto-organisées, pluri-disciplinaires et responsables de leur produit.

> API doit être vu comme un produit

### Microservices, ou pas ?

- Pas forcément de bon retours d’expériences chez les clients OCTO
- Si cela apporte une solution à un problème, OK, sinon, prudence
- On a tellement souffert de l’ESB monolithe, qu’aujourd’hui on part complétement à l’opposé.
- Si on part vers des microservices :
    - Maturité sur l’agilité
    - Maturité sur DEVOPS

 

[https://blog.octo.com/strategie-d-architecture-api/#buildvsbuy](https://blog.octo.com/strategie-d-architecture-api/#buildvsbuy)


## Take Away

![alt_text](/blog/2017/2017-12-19/image10.png "image_tooltip")


## Sécuriser son API en 30 minutes

### Démonstration live coding

Avec produit **AUTH0** autour du protocole OpenID connect, on implémente le flow « <span style="text-decoration:underline;">Open ID implicit grant</span> » :
1. On sécurise l’API en javascript avec une fonction checkToken()
2. A ce moment, l’API ,’est plus accessible ; on a une erreur 401
3. On introduit alors un système de redirect (window.location=URL de Auth0)
4. Le user entre ses credentials
5. Redirect vers l’API : localhost :8080 ?auth_token=...
6. Fonction Javascript qui extrait le token et le stocke dans le browser


### Les flows openid


#### Scope et privilège :

1. Un **scope** est une tranche de privilèges
2. L’utilisateur ne peut pas donner à l’application un privilège qu’il ne possède pas : on parle de **délégation de privilèges**


#### 3 types d’applications :

1. Public, tout est publique, y compris le code qui ne peut donc pas contenir de secret
2. Externe, hébergé par un serveur ; le code n’est pas visible ; secret dans le code possible
3. Interne ou dite « de confiance » ; on maitrise le code en interne


#### Les flows

2 flows dans openID connect

4 flows dans OAuth2

 


##### **L’autorisation implicite (Implicit Grant)**

Pour les applications publiques



![alt_text](/blog/2017/2017-12-19/image11.png "image_tooltip")


 


##### **L’autorisation via un code (Authorization Code Grant)**

C’est le flux par défaut ; autorisation tripartite


![alt_text](/blog/2017/2017-12-19/image12.png "image_tooltip")
 


##### **L’autorisation serveur à serveur (Client Credentials Grant)**




![alt_text](/blog/2017/2017-12-19/image13.png "image_tooltip")
 


##### **L’autorisation via mot de passe (Resource Owner Password Credentials Grant)**

OAUTH2, pas connectID

L’application voit tout, il faut lui faire confiance !



![alt_text](/blog/2017/2017-12-19/image14.png "image_tooltip")
 


### Openid connect ou Oauth2

OpenID connect est plus récent que oauth2... c’est l’avenir ?

Pour info, France Connect de l’administration française utilise Openid connect

 


## **Retour d’expériences – Club Med, Linxo et AXA**


### Club Med

<span style="text-decoration:underline;">La démarche</span> :

1. Volonté de développer un site web responsive, et pour gérer la multiplicité des canaux et device, ils ont décidé de concentrer leur plus-value business dans des API
2. OCTO propose effectivement une approche API-first, car le développement des fronts est éphémère, changeant et suivant le marché : il ne faut donc pas trop investir dans le front
3. On met en place le Socle technique API (gateway, sécurité, etc)
4. On met en place le pattern « façade », c’est-à-dire qu’on développe de façon centralisé les API dans une couche « façade » qui se connecte vers les back-end
5. On prévoit ensuite de découper et redescendre ces API dans les team backend

 

<span style="text-decoration:underline;">Organisation</span> :

- Il étaient organisé en component team
- Il monte une future team pour le time to market car refonte complète du « booking engine » et « epace client »
- En 2017, projet terminé, on rebascule sur l’organisation précédente

 

<span style="text-decoration:underline;">Bilan</span> :

- Gros impact sur l’organisation
- Faut tester, et un MVP avec un pattern façade, c’est parfait pour cela
- Attention au monolithes, il faut ensuite démonter la façade pour remettre les API sous la responsabilité des différents backs ; Ce n’est aujourd’hui toujours pas fait !

 


### Linxo




![alt_text](/blog/2017/2017-12-19/image15.png "image_tooltip")

- Ambition de servir de moyen de connexion (avoir un bouton « se connecter avec Linxo »)
- Développement basé sur une customisation de Kong (un API manager open source www.getkong.org/) 
- « on les a aidé à aller vers une trajectoire microservices »
- API à l’état de l’art, car c’était l’ambition de Linxo :
    - Pas de solution toute faite
    - C’est compliqué
    - Il faut « crafter »
- Dernière marche (ouverture sur internet) toujours pas fait
- Pas de portail « tout fait » d’outil « auto-magique »

 


### Axa Partner



![alt_text](/blog/2017/2017-12-19/image16.png "image_tooltip")


- C’est en PROD, le portail pour les développeurs qui voudraient utiliser l’API est ici :[ http://developers.axa-assistance.com](http://developers.axa-assistance.com/)
- **On a mis en place le socle technique : gateway, sécurisation, portail développeur et supervision ;**
**« ça il faut le faire une fois pour toute, après il n’y a pas grand-chose à faire »**
- Ils ont fait, en MVP, un projet pour mettre en place des API d’assistance médical. Petit projet (MVP)
- API via pattern façade (« c’est sale ») pour service salesforce
- Avec le produits :
    - 3scale de Red Hat ([www.3scale.net](http://www.3scale.net/)) en SAAS
    - De leur côté (puisque API manager était en SAAS) : Nginx  ([www.nginx.org](http://www.nginx.org/))
    - Redis ([www.redis.io](http://www.redis.io/)) pour performance, car salesforce ne répondait pas assez vite
    - Sur EC2 (Amazon Elastic Compute Cloud)
- Stack technique complétement différent de celui du SI ; et pourtant cela s’est fait sans douleur
- 3 OCTO pour de très bons développeurs interne. OCTO est resté 3 mois, l’équipe a ensuite continué seule.
- Aucune contrainte sur l’infrastructure
- Scrum minimaliste : Post-it, pas de Jira
- Développement d’un application démo : pb avec API, c’est headless, pas facile de convaincre sans frontend
- API entraîne un problème des identités différentes dans différents référentiels ; **<span style="text-decoration:underline;">il faut de l’IAM</span>** ; sans cela, on ne peut pas faire grand-chose
- API-fier son SI c’est long !

![alt_text](/blog/2017/2017-12-19/image17.png "image_tooltip")


![alt_text](/blog/2017/2017-12-19/image18.png "image_tooltip")


## 7 convictions sur l’API


### #1 Quelqu’un le fera à votre place

Si tu ne le fais pas, d’autres le feront à votre place

Il y a des solution de scapping :
- Apify ([https://www.apify.com/](https://www.apify.com/)  )
- Web Crawler API

 
Exemple :
- un service de scapping développé par l’administration elle-même au-dessus du site des finances, qui a permis de mettre de nouveaux services en place
- Linxo au niveau des données bancaires

### #2 sur internet

D’où vient cet réticence à ne pas y aller ?

Avant, une grosse forteresse en DMZ, et derrière, open-bar

Mais en fait, beaucoup de fraude en interne... Il faut redescendre la sécurité à la source

Et donc, moins besoin de château-fort !

 


### #3 C’est un sujet organisationnel et culturel

Loi de Conway, il faut des teams agiles, pizza-team ou squad ou tribus

 


### #4 L’API n’est pas un progiciel (d’API Management)


### #5 projet vs Produit

Stripe, une solution de paiement en ligne (valorisée 10 milliards), annonce dès sa page d’accueil sa “priorité aux développeurs”. Nous y voyons quelques lignes de code et les liens directs vers la documentation. Le TTFAC est de moins de 30 minutes, là où les solutions bancaires comptent plusieurs jours.


### #6 Façade API

Fait pour aller vite, mais doît disparaitre

 


### #7 L’hypermédia est à tester

 


## **FAQ**

Petite question sur GraphQL ([http://graphql.org](http://graphql.org/))

Très bonne chose, on y travaille, pas d’accod  en interne

C’est un détail, l’important c’est REST, omni-channel, agnostique de tout... bref le design des API

Si besoin de GraphQL, proxy devant API en REST, on parle de BFF (Backend For Front – cf.[ http://samnewman.io/patterns/architectural/bff/](http://samnewman.io/patterns/architectural/bff/) ) ; mais cela doit être justifié, cela coûte cher

Hateoas ([https://fr.wikipedia.org/wiki/HATEOAS](https://fr.wikipedia.org/wiki/HATEOAS) ) permet aussi le “pick and choose”, et a l’avantage d’être un protocole du web et de ne pas être applicatif

 

 


## **Liens :**

Le 19 décembre, OCTO organisait le petit-déjeuner **"L'API ne fait pas le moine".**

**Vous trouverez ci-dessous** **la vidéo, la présentation, et le compte rendu** pour revivre la conférence :

- Les slides présentées lors de la conférence sur notre [Slideshare](http://bit.ly/2lSxFg8) 
- Le[ compte-rendu](http://bit.ly/2m2hFJs) de cette matinée sur notre blog.
-  La [vidéo](http://bit.ly/2CPskOL) de la conférence

 

 
