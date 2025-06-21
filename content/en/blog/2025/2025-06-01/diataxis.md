---
title: "Les castcodeurs - Diataxis"
tags: [Documentation, Diátaxis]
date: 2025-06-01
categories: [French]
draft: false
---

Dans cette vidéo enregistrée le 19 décembre 2024, Emmanuel Bernard, Guillaume Laforge et Arnaud Héritier échangent autour de **Diátaxis**, une approche structurée pour organiser efficacement la documentation technique.   Ils partagent leurs points de vue, leurs usages concrets, et leur compréhension du modèle.

![les castcodeurs](/blog/2025/2025-06-01/image-1.png)

La discussion s'élargit ensuite aux **plateformes de documentation** et à l'**impact de l'intelligence artificielle** sur la manière dont nous concevons, maintenons et consommons la documentation aujourd'hui.

[Voir la vidéo sur YouTube](https://www.youtube.com/watch?v=3RXAu0hHLbU)

## C'est quoi Diátaxis?

Il est possible de consulter la documentation sur [diataxis.fr](http://diataxis.fr).

Diátaxis n'est pas une méthode sur la façon d'écrire au sein de la documentation, mais plutôt sur la manière de structurer la documentation en quatre types de contenus:
- Les tutoriels
- Les guides pratiques (ou "how-to guides")
- Les explications (ou "explanation")
- Les références

Au départ, le concept de Diátaxis peut sembler restrictif, car une structure trop rigide peut donner l'impression de devenir une règle absolue. Cependant, l'objectif principal reste d'avoir une documentation claire, compréhensible et utile, permettant d'aider les utilisateurs à accomplir leurs tâches efficacement.

> Ce qui est intéressant dans cette approche, c'est qu'elle incite à réfléchir sur ce qu'il faut inclure mais plus encore ce qu'il ne faut **pas inclure dans chaque type de document**. Cela aide à définir où placer une information en fonction de son objectif, en choisissant le type de document le plus adapté.

## Le Compas Diátaxis

Diátaxis propose un outil appelé le [compas](https://diataxis.fr/compass/), permettant de situer une information par rapport aux différents types de documents. C'est le coeur de Diátaxis.

![alt text](/blog/2025/2025-06-01/image.png)

Dans le cadre de Diátaxis, [deux dimensions](https://diataxis.fr/foundations/) sont à prendre en compte.

|||
|---|---|
|Aquisition - Application|Est-ce que l'objectif est d'acquérir des connaissances, ou d'appliquer des connaissances?  Cela oppose l'**acquisition**  à l'**application** (le site de Diátaxis parle de *being “at study”* et de *being “at work”*)|
|Action - Cognition|Est-ce que l'objectif est de réaliser une **action**, ou est-ce qu'il s'agit de ce que Diátaxis appelle la **cognition**?  Cela pourrait être résumé par "compréhension", bien que cela soit un sous-ensemble de la cognition, et ne vise pas une action immédiate.|

### *Tutorial*

Les tutoriels ont pour but d'apprendre par la pratique:
- D'acquérir des connaissances,  
- Par l'action – en réalisant les étapes du tutoriel.

Une analogie souvent utilisée pour expliquer cette approche est celle de [l'enfant qui apprend à cuisiner](https://diataxis.fr/tutorials/#applied-to-food-and-cooking).  
Il découpe des ingrédients, teste différentes étapes. L'objectif n'est pas d'obtenir un plat parfait, mais de lui permettre d'explorer, d'expérimenter, de comprendre les gestes et les quantités. Si le résultat final n'est pas réussi, ce n'est pas un problème.

Écrire un bon tutoriel peut s'avérer difficile. Il est important de structurer les étapes de manière claire, d'assurer une sensation de réussite pour l'utilisateur, tout en évitant de simplifier à l'extrême.

> Il est tentant d'ajouter des explications théoriques, comme par exemple le contexte de la persistance avec JPA, mais cela peut vite devenir trop lourd et théorique.
> Diátaxis recommande de ne pas inclure ce type de contenu dans un tutoriel.  
L'objectif est de se concentrer sur l'expérience pratique, d'encourager l'utilisateur à explorer et à interagir directement avec la technologie.

L'apprentissage se fait par l'expérimentation, en testant des APIs, en enchaînant des actions concrètes.  
Des questions surgiront naturellement et trouveront leurs réponses dans d'autres types de documentation.


### *How-To*

Ce sont les guides pratiques. Il s’agit toujours d’action, mais contrairement aux tutoriels, l’objectif est d’appliquer une connaissance précise à une tâche concrète. Ce type de document va droit au but. Il indique précisément ce qu’il faut faire, et si besoin, oriente vers d’autres documents pour les explications de fond. L’objectif est d’éviter de surcharger l’utilisateur avec des détails théoriques. Il faut rester concentré sur la tâche à accomplir.

Ces guides s’adressent à des personnes qui connaissent déjà les grandes lignes de la technologie. 

> Inutile de réexpliquer ce qu’est JPA ou de présenter le contexte général. La question est simple: comment se connecter à une base Oracle? C’est une tâche spécifique, clairement définie. Un bon guide pratique se concentre sur une action ciblée, à l’inverse, d'une question comme « comment créer une application web? » qui serait trop large. 

La liste des *how-to guides* permet d’avoir un aperçu clair des fonctionnalités concrètes d'un framework C’est une manière très efficace de cartographier les usages réels, sans entrer dans la théorie.

Cette approche permet de bien distinguer les différentes préoccupations des utilisateurs. Un guide pratique sert à résoudre un problème concret: comment se connecter à une base de données, comment déployer sur un serveur, etc.

Le contenu doit fournir juste ce qu’il faut pour atteindre l’objectif, par exemple: déployer une application connectée à une base de données.

> Il est fréquent de confondre tutoriel et guide pratique. Pourtant, ils ont des fonctions différentes:
> - Le tutoriel suit une progression d’apprentissage, souvent plus narrative, qui peut aborder plusieurs sujets dans une logique de découverte. 
> - Le guide pratique, lui, se concentre sur une seule tâche, sans digression ni explication superflue.
 
### *Reference*

C’est sans doute la forme la plus courante dans les projets, notamment en développement.

Cependant, ce que l’on appelle souvent “guide de référence” dépasse parfois ce que Diátaxis entend par documentation de référence. Dans le modèle Diátaxis, la référence désigne un manuel strictement factuel.  
Il s’agit d’une liste exhaustive des éléments disponibles, présentés sans explication ni contexte d’usage.

Pour reprendre une analogie: si un projet était une voiture, la documentation de référence serait la liste complète des pièces, accompagnée de leurs spécifications techniques. C’est une documentation orientée information, purement descriptive.

Un exemple typique est la Javadoc. Elle fournit une vue détaillée des classes, des méthodes, des champs, sans explication sur le « pourquoi » ou le « comment » de leur utilisation.  Autre exemple: un fichier OpenAPI (ou Swagger), qui dresse la liste des routes, méthodes, paramètres, schémas de données, etc.

L’objectif est de proposer une source fiable pour rechercher rapidement une méthode, une classe, une option de configuration, ou tout autre élément technique.

### *Explanation*

Ce type de contenu prend du recul. Il ne cherche pas à résoudre un problème ni à guider une action immédiate, mais à favoriser la **compréhension**.  Il aide à saisir les choix d’architecture, les concepts fondamentaux, la philosophie du projet.

Les *explanations* permettent d’acquérir des connaissances, sans nécessairement passer à l’action. Elles peuvent inclure des descriptions de l’architecture, des contraintes techniques, des modèles mentaux, ou encore des justifications de décisions.

Quelques exemples de questions typiques abordées dans cette catégorie:
- Pourquoi le projet repose-t-il sur tel paradigme?
- Quels sont les concepts clés à maîtriser?
- Comment les différentes parties du système interagissent-elles entre elles?

La **page d’accueil** d’un projet fait souvent partie des *explanations*, notamment lorsqu’elle introduit les objectifs, le positionnement, et les grandes idées à connaître avant de se plonger dans les détails.

Même si chaque type de documentation a un rôle bien distinct, une *explanation* peut tout à fait inclure des liens vers un *how-to guide*, pour illustrer une application concrète du concept, ou verts une entrée dans la *référence*, pour accéder aux détails d’implémentation.

## Les frontières parfois floues

Il est quelque fois compliqué de savoir qui fait quoi dans Diátaxis. Un moyen de s'y retrouver et de faire le lien entre le type de question et le type de contenu:

> Une question **“Pourquoi?”** → mène à une *explanation*  
>
> Une question **“Comment faire?”** → mène à un *how-to guide*  
>
> Une question **“Qu’est-ce que c’est? / Quelles méthodes sont disponibles?”** → mène à la *référence*  
>
> Une volonté **"d’apprendre par la pratique"** → mène à un *tutoriel*

Prenons l’exemple de la “chat memory” de LanChain4j:

|Type|Exemple|Decription|
|---|---|--|
|Tutoriel|Créer un chatbot avec mémoire de contexte|Est-ce qu’on montre tout un flux complet?|
|How-to guide|Configurer la mémoire pour conserver les 10 derniers messages|Est-ce qu’on est en train de faire une tâche concrète?|
|Référence |Méthodes de la classe `ChatMemory`|Est-ce qu’on décrit les détails de l’API?|
|Explanation|Pourquoi la mémoire est essentielle dans une application conversationnelle|Est-ce qu’on est en train de expliquer un concept?|
 

### Ce qu’il faut surveiller

Il faut surtout réfléchir à ce **qu’on ne veut pas mettre** dans un type de document.

Si, dans un *how-to guide*, on se met à faire de longues digressions sur les raisons d’un choix architectural ou sur les subtilités d’un concept, c’est un signe: cette partie doit probablement être extraite dans une *explanation*.

De même, si un *tutoriel* se transforme en manuel d’utilisation complet d’une API, il sort de son rôle. Il doit rester centré sur un enchaînement clair d’actions avec un objectif pédagogique.

### Exemples de glissements

- Un *how-to* sur “Configurer ChatMemory” commence à expliquer pourquoi la mémoire est utile: on glisse vers l’explication.
- Un *explanation* inclut des étapes détaillées à suivre: on s’approche d’un *tutoriel* ou d’un *how-to*.
- Une documentation de référence contient un long exemple d’usage: on emprunte au *how-to*.

### En pratique

Certaines zones grises sont inévitables, mais la discipline vient du fait de **refuser de tout mettre dans un seul document**.

Chaque type de doc a son rôle:
- Le *tutoriel* apprend par la pratique.
- Le *how-to* répond à un besoin précis.
- La *référence* documente l’API ou les options disponibles.
- L’*explanation* donne le contexte, les raisons, les modèles mentaux.

Il est utile de faire des liens entre ces types, mais sans tout mélanger dans le contenu lui-même.


## Évolution de la Javadoc

La Javadoc, bien que centrée sur la référence, gagne à inclure des exemples de code courts. Ceux-ci doivent renvoyer vers des *how-to* ou *tutoriels* pour plus de contexte.

Inclure du code directement est possible (niveau classe ou package, ex. CEF), mais peu courant. Des évolutions récentes (Markdown dans la javadoc) facilitent cette intégration. Idéalement, on pourrait importer du code (ex. tests) pour améliorer maintenabilité et lisibilité.

La doc Groovy est "exécutable": les exemples viennent de tests unitaires, donc toujours à jour. Cette approche, bien que puissante, dépasse le cadre classique des docs (réf, guide, tuto, how-to) et pose la question de l’organisation du code dans la doc.

Le nouveau format Javadoc permet désormais de pointer vers des extraits précis de code source.


## Diataxis n'utilise pas Diataxis

Il est intéressant de noter que le site web de Diátaxis n’utilise Diátaxis!

Bien que cela puisse sembler paradoxal, cela peut s’expliquer par le fait que Diátaxis n’est pas un projet, un outil ou une API spécifique. Bien que le site serve à la documentation, il ne s'agit pas d'un outil traditionnel, ce qui justifie en partie l'absence de ce format dans sa structure.

Le site repose principalement sur des *explications*. Ainsi, la structuration de la documentation s'en trouve différente, se concentrant davantage sur la présentation des concepts sans inclure d’approches plus pratiques comme les tutoriels ou les guides étape par étape.


## Flexible Mind

Le site de Diátaxis est clair sur un point: il est acceptable de ne pas adopter ce modèle de manière strictement rigide. L'idée est de s'en inspirer pour simplifier des questionnements philosophiques complexes et améliorer la clarté tout en réduisant la redondance. Toutefois, il est important de ne pas tomber dans l’excès. 

Ce qui est intéressant avec les *Architectural Decision Records* (ADR), c’est qu’ils permettent de documenter le contexte et les raisons des décisions prises. Si l’on oublie les raisons qui ont conduit à l’adoption d’un certain framework et que l’on l’applique de manière aveugle, cela devient problématique.

L’objectif reste de prendre du recul. Le cadre proposé par Diátaxis doit être un outil d’aide, non un carcan.

Il est important de noter que tout ne s’adapte pas nécessairement aux cases prévues. Dans ce cas, il est acceptable d’adapter et d’ouvrir le cadre. 

## Les templates

### Structurer le contenu 
Diátaxis nous parle parce qu’il propose un ensemble de bonnes pratiques. Ce type de catégorisation ou de structuration se retrouve souvent sur de nombreuses plateformes et projets. Mais il ne s'agit que de catégoriser l'information. Mais il dit trè peu de chose sur le contenu d'un document.

Or, la cohérence et la consistance sont des valeurs importantes dans la documentation. C'est là qu'interviennent les templates. On retrouve ces templates dans de projets tels que Groovy ou LangChain, ou encore chez Google Cloud. Ces documentations suivent des formats codifiés, avec des templates pour chaque type de guide.

### TheGoodDocsProject

Or, on l'a vu, Diátaxis s'adapte. On peut donc créer des types de documents supplémentaire dans le compas (des sous-catégories), et donc des templates supplémentaires.

Dans [TheGoodDocsProject](https://www.thegooddocsproject.dev/), plusieurs modèles de documentation sont proposés, parmi lesquels:

- API Quickstart  
- API Reference  
- Bug Report (ce n'est pas vraiment de la documentation)  
- Code of Conduct  
- Change Log  
- Concept  
- Contributing Guide  
- ReadMe

#### Les templates qui entrent dans Diátaxis...

Le "**Concept**" contient des explications, tandis que le "Contributing Guide" peut être vu comme un *How-to guide* ou une autre forme de documentation, selon le contexte. 

Les **FAQ**, quant à elles, peuvent être considérées comme des "fireside How-to" ou être classées différemment, selon la nature des questions abordées.

Un "**Quick Start**" est une sous-catégorie de tutoriel qui est plus courte et plus ciblée. Dans la documentation de Google Cloud, un "Quick Start" est généralement suivi de guides plus détaillés. Les tutoriels sont parfois regroupés dans un portail distinct pour permettre à l’utilisateur de les retrouver facilement.

#### ... et les autres

Certains templates sont complémentaires à ceux de Diátaxis, qui ne couvre pas nécessairement la manière de structurer certains éléments internes du projet ou de l'équipe (les *Contributing Guide*, la liste des membres d’une équipe, etc.)

## Outils et Frameworks

Les plateformes runtime de documentation dans les projets open source ou en entreprise sont nombreuses. Il est essentiel de se concentrer sur le contenu, un des principaux avantages du modèle Diátaxis. Cependant, la rédaction de la documentation et sa publication nécessitent également des outils adaptés.

### Maven l'ancêtre

Maven était un framework d'agrégation de documentation qui générait un site statique, notamment pour centraliser des rapports, des informations sur le projet, l'équipe et d'autres éléments dynamiques. Bien que cette approche ait eu un impact révolutionnaire il y a 20 ans, elle s'est avérée trop rigide pour les besoins modernes. Le site généré était très standardisé, avec des rapports et des informations souvent inutiles pour les utilisateurs.

![site maven](/blog/2025/2025-06-01/image-2.png)

Aujourd'hui, l'utilisation de Maven pour ce type de génération de site est largement obsolète. Toutefois, à l'époque, il était possible de générer automatiquement un site web complet via une simple commande, centralisant la Javadoc, les rapports et d'autres informations, ce qui était une avancée significative.

### Quelques outils actuels

Parmi les options les plus courantes, on trouve:

1. Les wikis, tels que **Confluence**, avec une gestion dynamique du contenu
2. Des solutions plus statiques, utilisant Markdown ou asciidoc, **Docusaurus**, **GitBook**, et d'autres projets similaires de génération de site statiques comme **Antora** un outil souvent mentionné, utilisant Asciidoctor
3. D'autres exemples incluent Notion, une plateforme populaire pour publier de la documentation, bien qu'elle ne soit pas spécifiquement définie comme un wiki. **Notion** fonctionne néanmoins de manière similaire.

Exemples dans les entreprises: 
- LangChain4J utilise Docusaurus. 
- Quarkus, une approche personnalisée a été adoptée, en générant des contenus en AsciiDoc et Markdown, puis en les agrégeant via un site statique.
- chez CloudBees, la documentation du site web était générée avec **Antora**, un outil qui peut paraître quelque peu limité dans ses options de personnalisation, mais qui avait permi d'avoir une organisation des menus et des styles CSS personnalisés 

(souvent les menus et le style permettent d'identifier rapidement l'outil utilisé)

### Les wikis

Bien que des plateformes comme les wikis offrent une solution simple, elles rencontrent souvent des problèmes de maintenance liés à la propriété, à l'absence de processus de révision et à la difficulté de maintenir une documentation de qualité sur le long terme. Comme pour le code, la dette documentaire s'accumule rapidement, rendant la gestion de la documentation de plus en plus difficile.

Certains projets, comme Hibernate, utilisaient des wikis où la documentation était régulièrement vandalisée. Bien que certaines pages critiques soient modifiables uniquement par un nombre restreint de personnes, le système de commentaires et les liens vers d'autres pages ajoutaient des éléments inutiles.

### Outils *doc-as-code* 

Contrairement aux wikis, les outils *as-code* permettre d'avoir plus de maitrise sur sa documentation et son cycle de vie. Ils permettent aussi de mieux maitriser l'évolution (c'est facile de comparer deux version de markdown, c'est du texte)

![doc-as-code](/blog/2025/2025-06-01/image-4.png)


L'intégration de la documentation directement dans le code permet de maintenir une proximité avec ce dernier, notamment lorsqu'elle est stockée dans le même dépôt. Cette approche permet d'appliquer les mêmes pratiques de codification que pour le code, mais elle reste moins accessible aux auteurs non-développeurs.

### Git pour la collaboration

L'utilisation de systèmes de contribution via des *issues* ou des *pull requests* permet de séparer la contribution au contenu sans altérer directement la documentation. Il est essentiel que ces processus ne deviennent pas des obstacles pour les contributeurs. Une bonne pratique consiste à proposer un bouton "**Edit this page**", qui permet de modifier la documentation directement via un éditeur et de soumettre la modification en un ou deux clics.

![alt text](/blog/2025/2025-06-01/image-3.png)

Pour garantir une participation active, la documentation doit être modifiable et accessible en open source.


## L’impact de l’IA sur la documentation

#### L'IA pour la documentation simple

L’intelligence artificielle ne permet pas encore de créer une documentation complète à partir d’informations brutes, mais des progrès sont faits, notamment pour des usages ciblés. Des outils comme ChatGPT ou Gemini peuvent générer des tutoriels simples, utiles pour les débutants. L’objectif est d’automatiser les contenus de base afin de libérer du temps pour les équipes techniques, qui peuvent ainsi se concentrer sur des documents plus complexes. Cette approche se développe, notamment chez Google, et favorise une collaboration entre IA et rédacteurs techniques

#### L'IA pour la documentation plus complexe et spécifique

Certains voient l’IA comme utile pour des cas complexes ou rares, mais elle hallucine souvent sur ces sujets mal documentés. Elle est plus fiable sur les contenus simples, mieux couverts par des exemples et tests.

#### L'IA et les hallucinations ou l'enrichissement

L’IA peut enrichir un contenu en suggérant des idées inédites, utiles en phase exploratoire, comme pour structurer un article sur les API. Son utilité varie selon les étapes du processus rédactionnel, mais lui confier entièrement la rédaction d’un article reste peu efficace sans intervention humaine.

#### Une approche structurée autour de l'IA

Un exemple d’outil développé par un collègue de Guillaume propose une méthode encadrée pour générer des articles avec l’aide de l’IA. L’utilisateur commence par fournir:
- Le sujet de l’article
- Le public cible
- Les points clés à traiter

L’IA génère alors une série de questions en lien avec le sujet. L’auteur y répond manuellement, section par section. Une fois les réponses saisies, l’outil assemble l’ensemble pour produire un contenu structuré. Cette approche intermédiaire permet de combiner expertise humaine et assistance automatisée, tout en gardant le contrôle sur le fond.

Les meilleurs résultats sont obtenus lorsque l’IA reçoit une structure explicite à suivre: par exemple une progression en étapes claires ou une méthode argumentative de type thèse/antithèse/synthèse. Dans ces cas, la cohérence est satisfaisante, mais le style reste souvent trop formel ou vague.

#### Une autre vision de la documentation

Actuellement, la documentation est souvent conçue comme un contenu destiné à être consulté via un moteur de recherche. Toutefois, une évolution se dessine vers un modèle où la documentation devient une interface conversationnelle.

L’idée est d’utiliser un agent conversationnel, entraîné sur le corpus documentaire, capable de répondre à des questions, de guider la navigation et de fournir des réponses précises et contextualisées. Ce type d’approche pourrait offrir une expérience plus efficace et plus accessible que les méthodes actuelles.


## Une conclusion ?

Emmanuel Bernard donne sa conclusion dans [son blog](https://emmanuelbernard.com/blog/2024/12/19/diataxis/#to-use-it-or-not-to-use-it-that-is-the-question):
> In conclusion, while Diataxis isn’t a one-size-fits-all solution, it’s a powerful framework for those looking to enhance the clarity, usefulness, and user-friendliness of their documentation. I would recommend to soft apply it to help make decisions on your documentation but not go religious about it at the risk of bringing back friction (in your team and in the readers). And the last thing you need when writing or reading doc is friction.

## Ressources

[La vidéo sur YouTube](https://www.youtube.com/watch?v=3RXAu0hHLbU)

[Diátaxis](https://diataxis.fr/)

[The Good Docs Project](https://www.thegooddocsproject.dev/)

[Le retour d'expérience d'Emmanuel sur Diataxis](https://emmanuelbernard.com/blog/2024/12/19/diataxis/)

