---
title: "Les castcodeurs - Diataxis, la méthode de documentation"
tags: [Documentation, Diátaxis]
date: 2025-06-01
categories: [French]
draft: false
---

Dans cette vidéo enregistrée le 19 décembre 2024, Emmanuel Bernard, Guillaume Laforge et Arnaud Héritier échangent autour de **Diátaxis**, une approche structurée pour organiser efficacement la documentation technique.   Ils partagent leurs points de vue, leurs usages concrets, et leur compréhension du modèle.

La discussion s'élargit ensuite aux **plateformes de documentation** et à l'**impact de l'intelligence artificielle** sur la manière dont nous concevons, maintenons et consommons la documentation aujourd'hui.

[Voir la vidéo sur YouTube](https://www.youtube.com/watch?v=3RXAu0hHLbU)

## C'est quoi Diátaxis ?

Il est possible de consulter la documentation sur [diataxis.fr](http://diataxis.fr).

Diátaxis n'est pas une méthode sur la façon d'écrire au sein de la documentation, mais plutôt sur la manière de structurer la documentation en quatre types de contenus :
- Les tutoriels
- Les guides (ou guides pratiques, aussi appelés "how-to guides")
- Les explications
- La référence

Les tutoriels et les guides sont généralement bien compris.  
Les explications, en revanche, peuvent être un type de document moins souvent formalisé dans une documentation de projet.  
Quant à la référence, elle correspond à un ouvrage technique classique listant tous les détails nécessaires.

Au départ, le concept de Diátaxis peut sembler restrictif, car une structure trop rigide peut donner l'impression de devenir une règle absolue.

Cependant, l'objectif principal reste d'avoir une documentation claire, compréhensible et utile, permettant d'aider les utilisateurs à accomplir leurs tâches efficacement.

Ce qui est intéressant dans cette approche, c'est qu'elle incite à réfléchir sur ce qu'il ne faut **pas inclure dans chaque type de document**.  
Cela aide à définir où placer une information en fonction de son objectif, en choisissant le type de document le plus adapté.

## Le Compas Diátaxis

Diátaxis propose un outil appelé le [compas](https://diataxis.fr/compass/), permettant de situer une information par rapport aux différents types de documents. Cet outil s'avère particulièrement utile.

![alt text](/blog/2025/2025-06-01/image.png)

Dans le cadre de Diátaxis, deux dimensions sont à prendre en compte.
- Est-ce que l'objectif est d'acquérir des connaissances, ou d'appliquer des connaissances ?  Cela oppose l'acquisition à l'application.
- Est-ce que l'objectif est de réaliser une action, ou est-ce qu'il s'agit de ce que Diátaxis appelle la cognition ?  Cela pourrait être résumé par "compréhension", bien que cela soit un sous-ensemble de la cognition, et ne vise pas une action immédiate.

### Les Tutoriels : Apprendre par la Pratique

Le premier cadran correspond aux tutoriels.  
Les tutoriels ont pour but :  
- D'acquérir des connaissances,  
- Par l'action – en réalisant les étapes du tutoriel.

Une analogie souvent utilisée pour expliquer cette approche est celle de l'enfant qui apprend à cuisiner.  
Il découpe des ingrédients, teste différentes étapes.  
L'objectif n'est pas d'obtenir un plat parfait, mais de lui permettre d'explorer, d'expérimenter, de comprendre les gestes et les quantités. Si le résultat final n'est pas réussi, ce n'est pas un problème.

C'est exactement ce principe que l'on retrouve dans les tutoriels.

Écrire un bon tutoriel peut s'avérer difficile. 
Il est important de structurer les étapes de manière claire, d'assurer une sensation de réussite pour l'utilisateur, tout en évitant de simplifier à l'extrême.

Il est tentant d'ajouter des explications théoriques, comme par exemple le contexte de la persistance avec JPA, mais cela peut vite devenir trop lourd et théorique.

Diátaxis recommande de ne pas inclure ce type de contenu dans un tutoriel.  
L'objectif est de se concentrer sur l'expérience pratique, d'encourager l'utilisateur à explorer et à interagir directement avec la technologie.

L'apprentissage se fait par l'expérimentation, en testant des APIs, en enchaînant des actions concrètes.  
Des questions surgiront naturellement et trouveront leurs réponses dans d'autres types de documentation.


### Les Guides Pratiques : Comment Faire (how-to guides)

Le deuxième type de contenu selon Diátaxis est celui des guides pratiques, ou *how-to guides*.  
Ici, il s’agit toujours d’action, mais contrairement aux tutoriels, l’objectif est d’appliquer une connaissance précise à une tâche concrète.

Ces guides s’adressent à des personnes qui connaissent déjà les grandes lignes de la technologie. 

Inutile de réexpliquer ce qu’est JPA ou de présenter le contexte général. La question est simple : comment se connecter à une base Oracle ? C’est une tâche spécifique, clairement définie.

À l’inverse, une question comme « comment créer une application web ? » serait trop large. Un bon guide pratique se concentre sur une action ciblée.

Dans l’écosystème React, par exemple, la liste des *how-to guides* permet d’avoir un aperçu clair des fonctionnalités concrètes du framework. C’est une manière très efficace de cartographier les usages réels, sans entrer dans la théorie.

Ce type de document va droit au but.  
Il indique précisément ce qu’il faut faire, et si besoin, oriente vers d’autres documents pour les explications de fond.

L’objectif est d’éviter de surcharger l’utilisateur avec des détails théoriques.  
Il faut rester concentré sur la tâche à accomplir.

Cette approche permet aussi de bien distinguer les différentes préoccupations.  
Un guide pratique sert à résoudre un problème concret : comment se connecter à une base de données, comment déployer sur un serveur, etc.

Il est fréquent de confondre tutoriel et guide pratique. Pourtant, ils ont des fonctions différentes :
- Le tutoriel suit une progression d’apprentissage, souvent plus narrative, qui peut aborder plusieurs sujets dans une logique de découverte. 
- Le guide pratique, lui, se concentre sur une seule tâche, sans digression ni explication superflue.

Même si un *how-to guide* mobilise différents éléments du système – un peu d’API, un peu de configuration – cela n’a rien d’anormal.  
L’essentiel est que tout converge vers la réalisation d’une tâche concrète.  
Le contenu doit fournir juste ce qu’il faut pour atteindre l’objectif, par exemple : déployer une application connectée à une base de données.

### Référence

La troisième catégorie définie par Diátaxis est la documentation de référence.  
C’est sans doute la forme la plus courante dans les projets, notamment en développement.

Cependant, ce que l’on appelle souvent “guide de référence” dépasse parfois ce que Diátaxis entend par documentation de référence.

Dans le modèle Diátaxis, la référence désigne un manuel strictement factuel.  
Il s’agit d’une liste exhaustive des éléments disponibles, présentés sans explication ni contexte d’usage.

Pour reprendre une analogie : si un projet était une voiture, la documentation de référence serait la liste complète des pièces, accompagnée de leurs spécifications techniques. C’est une documentation orientée information, purement descriptive.

Un exemple typique : la Javadoc.  
Elle fournit une vue détaillée des classes, des méthodes, des champs, sans explication sur le « pourquoi » ou le « comment » de leur utilisation.  
Autre exemple : un fichier OpenAPI (ou Swagger), qui dresse la liste des routes, méthodes, paramètres, schémas de données, etc.

L’objectif est de proposer une source fiable pour rechercher rapidement une méthode, une classe, une option de configuration, ou tout autre élément technique.

Un exemple intéressant se trouve dans la documentation de LangChain4j.  
Il existe une section intitulée “tutorial”, consacrée à la "chat memory" ([voir ici](https://docs.langchain4j.dev/tutorials/chat-memory)). À première vue, on s’attend à y trouver un tutoriel pratique, avec une progression pas à pas. Mais ce n’est pas le cas. Ce contenu décrit plutôt ce que c’est, les options disponibles, les comportements attendus :  éviction de mémoire, persistance, types de messages pris en charge, etc. Il ne s’agit donc pas d’un tutoriel. Mais ce n’est pas non plus de la référence au sens strict, car le contenu explique un concept. Dans la logique Diátaxis, ce type de documentation relèverait plutôt de l’explication.



### Explication (explanation)

Le quatrième cadran du modèle Diátaxis est celui des *explanations*.  
Pour beaucoup, c’est même le type de documentation le plus enrichissant.

Ce type de contenu prend du recul.  
Il ne cherche pas à résoudre un problème ni à guider une action immédiate, mais à favoriser la **compréhension**.  
Il aide à saisir les choix d’architecture, les concepts fondamentaux, la philosophie du projet.

Les *explanations* permettent d’acquérir des connaissances, sans nécessairement passer à l’action. Elles peuvent inclure des descriptions de l’architecture, des contraintes techniques, des modèles mentaux, ou encore des justifications de décisions.

Quelques exemples de questions typiques abordées dans cette catégorie :
- Pourquoi le projet repose-t-il sur tel paradigme ?
- Quels sont les concepts clés à maîtriser ?
- Comment les différentes parties du système interagissent-elles entre elles ?

La page d’accueil d’un projet fait souvent partie des *explanations*, notamment lorsqu’elle introduit les objectifs, le positionnement, et les grandes idées à connaître avant de se plonger dans les détails.

Certaines pages plus approfondies peuvent aussi relever de cette catégorie.  
Par exemple, une page sur la “chat memory” peut servir d’explication si elle présente les différents types de mémoire disponibles, leurs logiques respectives, les raisons de leur existence, ou les cas d’usage auxquels elles s’appliquent.

Même si chaque type de documentation a un rôle bien distinct, une *explanation* peut tout à fait inclure des liens vers :
- un *how-to guide*, pour illustrer une application concrète du concept,
- une entrée dans la *référence*, pour accéder aux détails d’implémentation.

Le modèle Diátaxis aide ainsi à faire le lien entre le type de question et le type de contenu :
- Une question **“Pourquoi ?”** → mène à une *explanation*  
- Une question **“Comment faire ?”** → mène à un *how-to guide*  
- Une question **“Qu’est-ce que c’est ? / Quelles méthodes sont disponibles ?”** → mène à la *référence*  
- Une volonté **d’apprendre par la pratique** → mène à un *tutoriel*

Prenons à nouveau l’exemple de la “chat memory” :
- **Tutoriel** : « Créer un chatbot avec mémoire de contexte »
- **How-to guide** : « Configurer la mémoire pour conserver les 10 derniers messages »
- **Référence** : « Méthodes de la classe `ChatMemory` »
- **Explanation** : « Pourquoi la mémoire est essentielle dans une application conversationnelle »

## Les frontières parfois floues

Il arrive que la séparation entre les types de documentation soit subtile.

Par exemple, quand on explique comment intégrer une `ChatMemory` dans une application :  
- Est-ce qu’on est en train de **faire une tâche concrète** (how-to) ?
- Est-ce qu’on est en train de **expliquer un concept** (explanation) ?
- Est-ce qu’on montre **tout un flux complet** (tutoriel) ?
- Ou est-ce qu’on décrit les **détails de l’API** (référence) 

### Ce qu’il faut surveiller

Il faut surtout réfléchir à ce **qu’on ne veut pas mettre** dans un type de document.

Si, dans un *how-to guide*, on se met à faire de longues digressions sur les raisons d’un choix architectural ou sur les subtilités d’un concept, c’est un signe : cette partie doit probablement être extraite dans une *explanation*.

De même, si un *tutoriel* se transforme en manuel d’utilisation complet d’une API, il sort de son rôle. Il doit rester centré sur un enchaînement clair d’actions avec un objectif pédagogique.

### Exemples de glissements fréquents

- Un *how-to* sur “Configurer ChatMemory” commence à expliquer pourquoi la mémoire est utile : on glisse vers l’explication.
- Un *explanation* inclut des étapes détaillées à suivre : on s’approche d’un *tutoriel* ou d’un *how-to*.
- Une documentation de référence contient un long exemple d’usage : on emprunte au *how-to*.

### En pratique

Certaines zones grises sont inévitables, mais la discipline vient du fait de **refuser de tout mettre dans un seul document**.

Chaque type de doc a son rôle :
- Le *tutoriel* apprend par la pratique.
- Le *how-to* répond à un besoin précis.
- La *référence* documente l’API ou les options disponibles.
- L’*explanation* donne le contexte, les raisons, les modèles mentaux.

Il est utile de faire des liens entre ces types, mais sans tout mélanger dans le contenu lui-même.


## Évolution de la Documentation Technique (en particulier Javadoc)


Dans la documentation de référence (comme la Javadoc), des exemples de code peuvent être précieux. Même si ce n’est pas leur rôle principal, ils aident à clarifier l’usage.

Ces exemples doivent toutefois rester concis, et pointer vers :
- des *how-to* pour des cas d’usage concrets,
- ou des *tutoriels* pour une mise en pratique plus complète.

L’enjeu est de ne pas perdre l’utilisateur : il faut que chaque type de document garde sa promesse, et que la navigation entre eux soit fluide et logique.
Techniquement, il est possible d'inclure du code dans la documentation, et bien que certains le fassent, cela reste plus l'exception que la norme. Cette possibilité est également envisageable au niveau du package, comme pour CEF. Des améliorations ont été apportées pour simplifier l’inclusion de code, car la principale limitation de la Javadoc réside dans la difficulté de maintenir et d'écrire du code directement dans celle-ci. 

Il y a eu des évolutions récentes à ce sujet, notamment avec l'introduction de la notation Markdown et l’utilisation de slash. Toutefois, idéalement, il serait utile de pouvoir importer du code directement dans la Javadoc, comme des codes de test ou d'autres éléments, pour améliorer sa maintenabilité et sa lisibilité dans le contexte de certaines technologies.

Un exemple intéressant est la documentation de Groovy, que l’on pourrait qualifier de "doc exécutable". Dans cette approche, tous les exemples de code présents dans la documentation sont extraits de tests unitaires. Ce qui est bénéfique avec cette méthode, c'est que la documentation reste toujours à jour, car le code inclus est testé à chaque mise à jour de la version de la documentation. Cela garantit que le code fonctionne réellement au moment de la publication de la doc.

Bien que cette approche soit pertinente, elle s'éloigne quelque peu des quatre types de documentation mentionnés précédemment.

Cela soulève la question de l’intégration et de l'organisation du code au sein de la documentation. Par exemple, le nouveau format de Javadoc permet de pointer vers des morceaux spécifiques de code.

## Diataxis n'utilise pas Diataxis !

Il est intéressant de noter que le site web de Diátaxis n’utilise pas le concept de tutoriel. Bien que cela puisse sembler paradoxal, cela peut s’expliquer par le fait que Diátaxis n’est pas un projet, un outil ou une API spécifique. Bien que le site serve à la documentation, il ne s'agit pas d'un outil traditionnel, ce qui justifie en partie l'absence de ce format dans sa structure.

Le site repose principalement sur des *explications* plutôt que des tutoriels. Ainsi, la structuration de la documentation s'en trouve différente, se concentrant davantage sur la présentation des concepts sans inclure d’approches plus pratiques comme les tutoriels ou les guides étape par étape.




## Flexible Mind

Le site de Diátaxis est clair sur un point : il est acceptable de ne pas adopter ce modèle de manière strictement rigide. L'idée est de s'en inspirer pour simplifier des questionnements philosophiques complexes et améliorer la clarté tout en réduisant la redondance. Toutefois, il est important de ne pas tomber dans l’excès. 

Ce qui est intéressant avec les *Architectural Decision Records* (ADR), c’est qu’ils permettent de documenter le contexte et les raisons des décisions prises. Si l’on oublie les raisons qui ont conduit à l’adoption d’un certain framework et que l’on l’applique de manière aveugle, cela devient problématique.

L’objectif reste de prendre du recul. Le cadre proposé par Diátaxis doit être un outil d’aide, non un carcan.

Il est important de noter que tout ne s’adapte pas nécessairement aux cases prévues. Dans ce cas, il est acceptable d’adapter et d’ouvrir le cadre. 

## Types de Documentation et Exemples Pratiques

Dans *TheGoodDocsProject*, plusieurs modèles de documentation sont proposés, parmi lesquels :

- API Quickstart  
- API Reference  
- Bug Report (ce n'est pas vraiment de la documentation)  
- Code of Conduct  
- Change Log  
- Concept  
- Contributing Guide  

Par exemple, la section "Concept" contient des explications, tandis que le "Contributing Guide" peut être vu comme un *How-to guide* ou une autre forme de documentation, selon le contexte. Les FAQ, quant à elles, peuvent être considérées comme des "fireside How-to" ou être classées différemment, selon la nature des questions abordées.

Les *How-to guides* sont généralement associés à des projets, des classes, des librairies ou des SDK. Cependant, un *Contributing Guide* se distingue par son orientation méta-informatique sur la contribution au projet, et ne correspond pas nécessairement à un *How-to guide* traditionnel.

Il existe également un projet appelé *TheGoodProjects.dev* qui fournit des modèles de documentation. Ce projet propose des templates pour des éléments comme le *readme*, la liste des membres d’une équipe, etc. Ces ressources sont complémentaires à celles de Diátaxis, qui ne couvre pas nécessairement la manière de structurer certains éléments internes du projet, à l'exception des tutoriels, où des approches guidées sont recommandées pour accompagner l'utilisateur vers le succès.

La cohérence et la consistance sont des valeurs importantes dans la documentation. Des exemples de bonnes pratiques peuvent être observés dans la documentation de projets tels que Groovy, LangChain, Forge, ainsi que dans la documentation de Google Cloud. Ces documentations suivent des formats codifiés, avec des templates pour chaque type de guide. Par exemple, un "Quick Start" est un *How-to guide* rapide, mais il peut également être vu comme un tutoriel, car il guide l’utilisateur à travers plusieurs étapes, comme la configuration d’une base de données ou le déploiement d’un container.

Un "Quick Start" est une sous-catégorie de tutoriel qui est plus courte et plus ciblée. Dans la documentation de Google Cloud, un "Quick Start" est généralement suivi de guides plus détaillés. Les tutoriels sont parfois regroupés dans un portail distinct pour permettre à l’utilisateur de les retrouver facilement.

Il est également crucial de considérer la manière dont les utilisateurs interagissent avec la documentation, notamment comment ils la recherchent et la naviguent. Cela relève davantage de l'expérience utilisateur (UX), un aspect qui n'est pas nécessairement couvert par Diátaxis mais qui peut être intégré à travers des bonnes pratiques.

Enfin, la possibilité de recueillir des commentaires ou des questions de la part des utilisateurs via des canaux comme une mailing list ou un Discord peut être un excellent moyen de compléter la documentation. Les FAQ peuvent en découler, ou elles peuvent évoluer à partir des questions fréquemment posées, comme celles concernant la configuration de la base de données.




## Outils et Frameworks de Documentation


### L'ancêtre - site généré par Maven

Maven était un framework d'agrégation de documentation qui générait un site statique, notamment pour centraliser des rapports, des informations sur le projet, l'équipe et d'autres éléments dynamiques. Bien que cette approche ait eu un impact révolutionnaire il y a 20 ans, elle s'est avérée trop rigide pour les besoins modernes. Le site généré était très standardisé, avec des rapports et des informations souvent inutiles pour les utilisateurs.

Aujourd'hui, l'utilisation de Maven pour ce type de génération de site est largement obsolète. Toutefois, à l'époque, il était possible de générer automatiquement un site web complet via une simple commande, centralisant la Javadoc, les rapports et d'autres informations, ce qui était une avancée significative.

### Les outils actuels

Les plateformes runtime de documentation dans les projets open source ou en entreprise sont nombreuses. Il est essentiel de se concentrer sur le contenu, un des principaux avantages du modèle Diátaxis. Cependant, la rédaction de la documentation et sa publication nécessitent également des outils adaptés. Parmi les options les plus courantes, on trouve :

1. Les wikis, tels que **Confluence**.
2. Des solutions plus statiques, utilisant Markdown ou  asciidoc, **Docusaurus**, **GitBook**, et d'autres projets similaires.

D'autres exemples incluent Notion, une plateforme populaire pour publier de la documentation, bien qu'elle ne soit pas spécifiquement définie comme un wiki. **Notion** fonctionne néanmoins de manière similaire. **Antora** est également un outil souvent mentionné, qui utilise Asciidoctor, bien qu'il puisse paraître quelque peu limité dans ses options de personnalisation.

Certains projets, comme LangChain4J, utilisent Docusaurus. Sur des projets comme Quarkus, une approche personnalisée a été adoptée, en générant des contenus en AsciiDoc et Markdown, puis en les agrégeant via un site statique.

Chez CloudBees, la documentation du site cloudbees.com était générée avec **Antora**, avec une organisation personnalisée des menus et des styles CSS permettant d'identifier rapidement l'outil utilisé.

Bien que des plateformes comme les wikis offrent une solution simple, elles rencontrent souvent des problèmes de maintenance liés à la propriété, à l'absence de processus de révision et à la difficulté de maintenir une documentation de qualité sur le long terme. Comme pour le code, la dette documentaire s'accumule rapidement, rendant la gestion de la documentation de plus en plus difficile.



### Outils *as code* - Git pour le feedback


L'intégration de la documentation directement dans le code permet de maintenir une proximité avec ce dernier, notamment lorsqu'elle est stockée dans le même dépôt. Cette approche permet d'appliquer les mêmes pratiques de codification que pour le code, mais elle reste moins accessible aux auteurs non-développeurs.

Certains projets, comme Hibernate, utilisaient des wikis où la documentation était régulièrement vandalisée. Bien que certaines pages critiques soient modifiables uniquement par un nombre restreint de personnes, le système de commentaires et les liens vers d'autres pages ajoutaient des éléments inutiles.

L'utilisation de systèmes de contribution via des *issues* ou des *pull requests* permet de séparer la contribution au contenu sans altérer directement la documentation. Il est essentiel que ces processus ne deviennent pas des obstacles pour les contributeurs. Une bonne pratique consiste à proposer un bouton "Edit on GitHub", qui permet de modifier la documentation directement via un éditeur et de soumettre la modification en un ou deux clics.

Pour garantir une participation active, la documentation doit être modifiable et accessible en open source.


## L’impact de l’IA sur la documentation

### L'IA pour la documentation simple

L'intelligence artificielle ne permet pas encore de générer automatiquement une documentation complète à partir d'informations brutes. Cependant, l'idée suscite un intérêt croissant dans de nombreuses équipes, notamment pour des usages ciblés autour de la documentation.

Des outils comme Gemini, ChatGPT ou d'autres modèles d'IA peuvent, à partir du code et de tests unitaires, générer des tutoriels cohérents. Ces approches sont particulièrement efficaces pour produire des guides d’introduction ou des documents destinés à faciliter les premiers pas avec un projet. Pour ce type de contenu simple, l’IA peut représenter une aide précieuse.

L’objectif est de déléguer la production de documentation de niveau L100 (introductif, selon une classification courante de complexité) à l’IA, afin que les équipes techniques puissent se concentrer sur des contenus plus avancés, de niveaux L200 et L300, là où leur expertise apporte une réelle valeur ajoutée.

Ce type de réflexion est en cours dans plusieurs entreprises, y compris chez Google, et témoigne d’une évolution vers une collaboration entre rédacteurs techniques et outils d’IA.

### L'IA pour la documentation plus complexe et spécifique

Une position courante considère que la valeur ajoutée de l’humain réside dans la gestion des tâches simples et fréquentes, qui représentent une large part des besoins documentaires. Ce type de contenu se prête bien à une approche manuelle, orientée qualité et contextualisation.

Cependant, certains estiment que l’IA pourrait être particulièrement utile pour traiter des cas très spécifiques ou avancés, difficiles à documenter de manière exhaustive. Par exemple, répondre à des demandes atypiques telles que la création d’un fork de LangChain dans un langage peu courant, ou des intégrations techniques rares, pourrait relever d’un usage pertinent de l’intelligence artificielle.

Néanmoins, dans la pratique, les systèmes d’IA présentent un risque accru d’hallucinations lorsqu’ils sont confrontés à des sujets complexes ou mal documentés. À l’inverse, les contenus plus simples bénéficient de nombreuses sources d’exemples et de tests, ce qui renforce la fiabilité des réponses générées par l’IA dans ces contextes.

### L'IA et le style

L’utilisation de l’intelligence artificielle pour la rédaction d’articles ou de documents techniques peut s’inscrire dans un processus entièrement piloté par un humain. Ce processus commence par la définition d’un plan ou d’un ensemble de points clés, à partir desquels l’IA génère un texte initial. Cette étape est suivie d’une phase de relecture approfondie, visant à corriger le style, à éviter les erreurs, et à vérifier la cohérence sur le fond.

La phase de révision reste essentielle. Le style généré par l’IA est souvent trop vague ou artificiel. De plus, dans les contenus techniques, le risque d’hallucination est non négligeable, quelle que soit la plateforme utilisée (ChatGPT, Gemini, Claude, etc.). Bien que l’IA fasse gagner du temps sur certaines étapes, une vérification humaine est indispensable pour garantir la qualité finale du contenu.

Des retours d'expérience indiquent que, même en fournissant à l’IA un historique de publications personnelles pour l’adapter à un style donné, le texte produit peut rester éloigné du ton souhaité. Le résultat nécessite alors des réécritures importantes, notamment pour corriger des tournures trop longues ou imprécises, et pour supprimer des ajouts non souhaités, parfois inexistants dans les sources d’origine.


### L'IA et les hallucinations ou l'enrichissement

L’intelligence artificielle peut parfois "enrichir" un contenu en suggérant des éléments qui n’avaient pas été envisagés initialement. Par exemple, lors de la préparation d’un article sur les API ou les workflows, l’IA peut proposer une liste de points à aborder, dont certains peuvent offrir un angle nouveau ou pertinent. Cela peut s’avérer utile dans la phase exploratoire de l’écriture.

L’usage de l’IA varie en fonction de l’étape du processus rédactionnel : exploration, structuration ou rédaction. À chaque phase, elle peut jouer un rôle différent. Toutefois, déléguer entièrement la rédaction à l’IA, sans intervention humaine, n’est pas recommandé. Une approche consistant à lui demander de produire un article complet prêt à publier se révèle généralement inefficace.

### Une approche structurée autour de l'IA

Un exemple d’outil développé en interne propose une méthode encadrée pour générer des articles avec l’aide de l’IA. L’utilisateur commence par fournir :

- Le sujet de l’article
- Le public cible
- Les points clés à traiter

L’IA génère alors une série de questions en lien avec le sujet. L’auteur y répond manuellement, section par section. Une fois les réponses saisies, l’outil assemble l’ensemble pour produire un contenu structuré. Cette approche intermédiaire permet de combiner expertise humaine et assistance automatisée, tout en gardant le contrôle sur le fond.

Concernant le style, les IA peuvent adapter leur ton à un public spécifique (par exemple un enfant de 11 ans), mais reproduire un style personnel à partir de plusieurs exemples reste limité, même avec des modèles dotés de long contexte comme Gemini.

Les meilleurs résultats sont obtenus lorsque l’IA reçoit une structure explicite à suivre : par exemple une progression en étapes claires ou une méthode argumentative de type thèse/antithèse/synthèse. Dans ces cas, la cohérence est satisfaisante, mais le style reste souvent trop formel ou vague.

### Une autre vision de la documentation

Actuellement, la documentation est souvent conçue comme un contenu destiné à être consulté via un moteur de recherche. Toutefois, une évolution se dessine vers un modèle où la documentation devient une interface conversationnelle.

L’idée est d’utiliser un agent conversationnel, entraîné sur le corpus documentaire, capable de répondre à des questions, de guider la navigation et de fournir des réponses précises et contextualisées. Ce type d’approche pourrait offrir une expérience plus efficace et plus accessible que les méthodes actuelles.

