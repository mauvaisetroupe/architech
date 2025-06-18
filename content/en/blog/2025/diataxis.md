# C'est quoi Diátaxis ?

Vous pouvez aller sur diataxis.fr pour voir la documentation.

Je ne sais pas comment vous voulez procéder... Je peux commencer par expliquer un peu ce que j’en ai compris, et puis on continue à partir de là ?
— Oui, vas-y.
— OK, attendez, je vais vous partager mon écran... Voilà.

Donc, Diátaxis, ce n’est pas une méthode pour savoir comment écrire à l’intérieur de la documentation, mais plutôt comment structurer la documentation en quatre types de contenus :
- Les tutoriels,
- Les guides ("how-to guides", ou guides pratiques),
- Les explications,
- Et la référence.

Les tutoriels et les guides, on voit à peu près ce que c’est.
Les explications, c’est peut-être un type de document que vous n’avez pas l’habitude de voir formalisé comme tel dans une documentation de projet.
Et la référence, ça, tout le monde connaît : c’est le bon vieux bouquin technique qui liste tout, avec tous les détails.

Alors au début, j’étais un peu sceptique. J’aime pas trop quand c’est trop structuré, parce que j’ai l’impression que, souvent, ça devient une sorte de loi absolue. Et on entend des trucs du genre :
« Non, on ne peut pas écrire ça ici, parce que ce n’est pas le bon type de document ! »
Et pour moi, ça n’aide pas forcément à atteindre l’objectif principal, qui est de faire une documentation claire, compréhensible, et surtout utile : c’est-à-dire aider les gens à faire ce qu’ils ont à faire, puis à passer à autre chose.

Mais bon, j’ai quand même lu, et j’ai trouvé ça intéressant.

Notamment, ce que j’ai trouvé le plus utile, c’est que cette approche te pousse à réfléchir à ce que tu ne dois pas mettre dans un certain type de document.
Ça t’aide à te dire : « OK, je veux expliquer ceci ou faire cela, donc selon l’objectif de cette information, je devrais plutôt la mettre dans tel type de document. »

Ils ont aussi un outil qu’ils appellent le compas, qui permet de situer une information par rapport aux types de documents. C’est assez malin.

# Les Tutoriels : Apprendre par la Pratique

En fait, dans Diátaxis, il y a deux dimensions.

La première, c’est :  
Est-ce que c’est pour acquérir des connaissances, ou est-ce que c’est pour appliquer des connaissances ?  
Donc : acquisition vs application.

La deuxième, c’est :  
Est-ce que c’est pour une action, ou est-ce que c’est pour ce qu’ils appellent la cognition ?  
On pourrait dire "compréhension", même si c’est un sous-ensemble de la cognition.  
Donc ce n’est pas forcément une action immédiate.

Le premier cadran, ce sont les tutoriels.  
Et les tutoriels, c’est :  
Acquérir de la connaissance,  
Par l’action — c’est-à-dire faire les choses, faire un tutoriel.

Ce qui est intéressant, c’est leur analogie :  
Ils disent que le tutoriel, c’est comme quand vous laissez vos enfants faire à manger.  
Ils découpent des choses, ils testent.  
L’objectif, ce n’est pas forcément d’avoir un bon gâteau à la fin.  
Ce qui compte, c’est qu’ils explorent, qu’ils jouent avec la nourriture,  
qu’ils apprennent les quantités, les gestes.  
Et si le résultat final est raté, ce n’est pas grave.

C’est exactement ça, l’idée du tutoriel.

Et moi, ça me parle pas mal.  
Parce que, je ne sais pas vous, mais écrire un tutoriel, c’est difficile.  
Il faut vraiment que ce soit étape par étape,  
que la personne ait une sensation de réussite,  
et que ce ne soit pas non plus trop simpliste.

Mais souvent, on se dit :  
"Ah oui, je vais aussi expliquer le contexte de la persistance avec JPA…"  
Et là, paf, on se retrouve avec un gros paragraphe théorique.

Ce que dit Diátaxis, c’est :  
Ne mettez pas ça dans un tutoriel.  
Laissez tomber.  
Le tutoriel, c’est fait pour mettre les mains dans le cambouis,  
explorer, jouer avec la techno.

Les gens vont apprendre juste en expérimentant,  
en testant une API, en enchaînant des choses.  
Des questions vont émerger naturellement,  
et les réponses viendront plus tard, dans les autres types de documentation.

# Les Guides Pratiques : Comment Faire (how-to guides)

Le deuxième type, c’est les how-to guides.  
Là, on est dans l’action, mais à la différence des tutoriels, il s’agit d’appliquer une connaissance précise à une tâche concrète.

C’est donc pour quelqu’un qui connaît déjà la techno dans les grandes lignes.  
On ne va pas lui réexpliquer ce que c’est que JPA, ni lui redonner le contexte général.  
L’idée, c’est : comment je me connecte à une base Oracle ?  
Point.  
C’est une tâche bien définie, spécifique.

Ce n’est pas non plus : comment créer une application web ?  
Ce serait trop générique.  
Un bon how-to guide correspond à une action ciblée.

Par exemple, dans React, ils expliquent que si vous regardez la liste de vos how-to guides,  vous obtenez en fait une sorte de panorama des fonctionnalités concrètes du framework.

Et ça, c’est hyper libérateur.  
On ne rentre pas dans les détails théoriques,  
on se contente d’indiquer ce qu’il faut faire,  
et éventuellement de pointer vers d’autres documents pour les explications.

Sinon, on risque de noyer l’utilisateur.  
L’objectif est de rester concentré sur la tâche.

Ça permet aussi de bien séparer les différentes préoccupations.  
Le how-to guide, c’est pour résoudre un problème concret.  
Du genre : comment se connecter à telle base de données, comment déployer sur tel serveur, etc.

C’est vrai qu’on a souvent tendance à mélanger tutoriel et how-to guide.  
Mais en réalité, le tutoriel est plus narratif, il suit une progression d’apprentissage,  
où l’on peut toucher plusieurs sujets (comme se connecter à une base, déployer, etc.) dans une logique de découverte.

Alors que le how-to guide, lui, va droit au but.  
Pas d’explication superflue, pas de concepts, pas de digression.

Et même si un how-to guide peut toucher plusieurs parties du système — un peu d’API, un peu de config —  
ce n’est pas grave.  
L’important, c’est que tout soit orienté vers la réalisation d’une tâche spécifique.  
On donne juste le minimum pour que la personne puisse atteindre son objectif :  
par exemple, déployer une application qui se connecte à une base de données.

# Référence

La troisième catégorie, c’est la documentation de référence.  
C’est probablement la plus évidente, car on en retrouve souvent dans les projets, notamment en développement.

Cela dit, ce qu’on appelle couramment “guide de référence” fait souvent plus que ce que Diátaxis désigne sous le terme "référence".

La documentation de référence, au sens strict du modèle Diátaxis, c’est le manuel détaillé.  
C’est la liste exhaustive des éléments disponibles, sans explication ou contexte d’usage.

Par exemple, sur une voiture, ce serait la liste de toutes les pièces, avec leurs spécifications.  
C’est orienté information, purement factuel.

Un exemple typique : la Javadoc.  
C’est de la documentation de référence.

Autre exemple : un fichier OpenAPI, ou Swagger.  
On y retrouve la liste de toutes les méthodes, toutes les routes, les paramètres, les schémas de données, etc.

L’objectif, c’est de fournir une source fiable pour rechercher une méthode, une classe, un champ, une option de configuration.

Ce matin, je lisais la doc de LangChain4j, et il y avait une section qui s’appelait “tutorial” —  par exemple sur la “chat memory”. (https://docs.langchain4j.dev/tutorials/chat-memory)

Mais en fait, ce n’est pas vraiment un tutoriel.  
On pourrait croire que ça va nous montrer comment l’utiliser dans un scénario concret, étape par étape.  
Mais non, ça décrit juste ce que c’est, les options disponibles, les comportements attendus.

Par exemple : l’éviction de mémoire, la persistance, les types de messages pris en charge.

Donc ce n’est pas un tutoriel.

Mais ce n’est pas forcément de la référence non plus, car ça décrit un concept.  
Ce serait plutôt de l’explication, dans la logique Diátaxis.

# Explication (explanation)

Le quatrième cadran, c’est celui des *explanations* — et c’est, pour certains, le type de documentation le plus apprécié.

C’est là qu’on prend du recul.  
L’objectif ici n’est pas de résoudre un problème ou de réaliser une tâche, mais plutôt d’aider à **comprendre** :  
comprendre les choix d’architecture, les concepts clés, la philosophie du projet.

Ce type de documentation sert à acquérir de la connaissance, sans action immédiate attendue.  
On y retrouve souvent des descriptions de l’architecture, des contraintes, des modèles mentaux, des explications sur pourquoi certaines décisions ont été prises.

Par exemple :
- Pourquoi le projet utilise tel paradigme ?
- Quels sont les concepts clés de l’outil ?
- Comment les différentes parties interagissent entre elles ?

La page d’accueil d’un projet peut souvent faire partie des *explanations* :  
elle présente le projet, son objectif, les grands concepts à connaître avant d’aller plus loin.

On peut aussi y retrouver des explications plus approfondies sur certains composants.  
Exemple : une page “chat memory” peut très bien être une explication, si elle présente les différents types de mémoire disponibles, pourquoi elles existent, comment elles se comparent, etc.

Même si chaque type de documentation a son rôle, les *explanations* peuvent contenir des liens vers les autres parties :
- un *how-to guide* pour montrer comment utiliser un élément expliqué,
- ou une entrée dans la documentation de référence pour consulter les détails d’implémentation.

Dans la logique Diátaxis :
- une question “**pourquoi**” → mène à une *explanation*,
- une question “**comment faire**” → mène à un *how-to guide*,
- une question “**qu’est-ce que c’est / quelle méthode existe**” → mène à une *référence*,
- une volonté “**d’apprendre en pratiquant**” → mène à un *tutoriel*.

Donc pour le *chat memory* :
- *Tutoriel* : “Comment créer un chatbot avec mémoire de contexte”
- *How-to* : “Configurer la mémoire pour un historique de 10 messages”
- *Référence* : “Méthodes de la classe `ChatMemory`”
- *Explanation* : “Pourquoi la mémoire est essentielle dans une application conversationnelle”

# Les frontières parfois floues

Emmanuel : Et du coup, le moment où — alors mettons que l’API soit composable — le moment où tu dis : "Voilà, il y a le concept de *chat memory*, et voilà comment tu l’intègres, comment tu choisis la taille de la fenêtre", etc., c’est où, ça ?

Guillaume:
- Là, honnêtement, des fois la frontière est un petit peu subtile. Parce que tu pourrais te dire que tu es en train d’expliquer un concept — donc c’est une *Explanation* du concept de *chat memory*. Tu expliques les différentes choses que c’est capable de faire, la raison pour laquelle ces choses existent.
- Il faut faire attention : un *How-to guide*, c’est vraiment pour une tâche concrète pour configurer. Exemple : "Configurer une *chat memory*". Tu peux y expliquer brièvement ce qu’est une *chat memory*, mais pas en détail.
-un *Tutorial*, ce serait par exemple : "Créer un chatbot qui utilise une *chat memory*". 

On voit qu'il peut y avoir des redondances entre ce qu’on explique dans une *Explanation*, un *How-to* ou un *Tutorial*. Mais comme tu disais en introduction, il faut surtout réfléchir à ce **qu’on ne veut pas mettre**. Si tu vois que tu commences à insérer des explications de concepts dans un tutoriel ou un how-to, c’est probablement un signe que cette partie devrait être extraite et mise dans une *Explanation* dédiée.

Emmanuel :
- On peut aussi imaginer un *How-to* spécifique, du type :  **How to set up Chat Memory**. Et là, il y aurait des branches : mémoire persistante vs non-persistante. Mais du coup, ce n’est plus une tâche ultra-ciblée. On commence à perdre en spécificité.
- Ensuite, tu as la **documentation de référence**. Là, tu expliques les API de *chat memory*, leur signature, leurs options. C’est utile, mais parfois ce type de doc n’est pas suffisant seul.
- Le troisième, c’est les *Explanations*. Tu veux y montrer comment c’est utilisé, donner un peu de contexte, deux ou trois exemples. Ce que font beaucoup de projets jeunes ou open source, c’est qu’ils mélangent ça avec la doc de référence : leur doc de référence devient en réalité une *Explanation*. C’est souvent le cas dans la section "Getting Started" ou dans les premières pages.

---
Gillaume:

Et puis il y a un point que tu soulevais, que je partage complètement : parfois, ce qui manque dans la **Javadoc** (ou équivalent), c’est justement des exemples d’usage **concrets**. Parce que manipuler une API, ce n’est pas évident. On ne sait pas forcément :

- qu’il faut appeler telle méthode en premier,
- qu’il faut configurer ça avant,
- qu’on ne peut faire tel appel qu’après une certaine étape.

Tu peux te dire que ces éléments sont ailleurs dans la doc (dans des how-to, des tutoriels), mais quand tu es dans une classe précise, ce serait pratique d’avoir **directement** un petit bloc d’exemple de code. Juste pour montrer la manière correcte de s’en servir.

Ce côté *intime* et *opérationnel* de l’API — l’ordre des appels, les configurations nécessaires, les erreurs à éviter —, ça devrait à mon sens **faire partie de la documentation de référence**. Tout en haut de la Javadoc d’une classe, dans le résumé introductif.












# Évolution de la Documentation Technique (en particulier Javadoc)

Le côté intime et concret de la manipulation de cette classe, dans l'ordre dans lequel tu appelles telle ou telle méthode, des fois, moi je le verrais bien quand même dans la Javadoc, tout en haut de la classe, tu vois. Et ça devrait donc s'afficher dans cette documentation de référence-là, ce quatrième cadre.

Techniquement, c'est possible, il y a ceux qui le font, oui, oui. Mais j'avoue que ce n'est pas une norme. C'est souvent plus une exception. On doit pouvoir faire ça au niveau du package aussi pour CEF. On peut faire, ils ont simplifié de façon l'inclusion, parce qu'il faut avouer que la grosse limitation pour la Javadoc, particulièrement, c'est que c'est quand même super relou d'écrire du code dans de la Javadoc. Enfin, c'est en termes de maintenance, etc. Jusqu'à présent, c'était comme ça, mais il y a eu des évolutions à ce niveau.

Avec la notation Markdown, avec les slash là, mais bon, idéalement, il faudrait qu'on puisse importer du code dans la Javadoc, genre le code de test ou des choses comme ça, pour que ça soit plus maintenable et lisible sur ce genre de technologie. Mais c'est vrai que c'est un peu ce qu'on faisait aussi. Enfin, par exemple, moi ce que j'aime bien dans la documentation de Groovy, c'est que c'est de la doc, ce que j'appelle de la doc exécutable, c'est-à-dire qu'en fait, tous les bouts de code que tu retrouves dans la doc de Groovy sont extraits de tests unitaires qu'on installe. Et en fait, ce qui est génial avec ça, c'est que ta doc, enfin, quand elle est publiée pour telle version, bah elle est à jour. Tu sais que le code tourne quelque part, ce code-là tourne, et il est testé à chaque fois qu'on publie la doc. Ça, j'aime bien. Mais bon, c'est un peu une digression par rapport à ces quatre types de documentation.

Du coup, ça pose la question de... enfin, on en revient à ça, mais ça pose la question de où ils se mettent, quoi. Ouais, mais euh, tu vois, en tout cas, Arnaud, tu parlais du nouveau format de Javadoc, je crois. Je n'ai pas testé, mais normalement, tu peux aussi pointer vers tel ou tel bout de code, etc. Il me semble, j'avais vu ça. Je n'ai pas testé perso. Et c'est intéressant parce que, du coup, tu sais que ça va être synchronisé. Parce que des fois, bah malheureusement, tu as modifié telle classe, tu as rajouté une méthode ou modifié ce que fait la méthode. Oui, il y avait de la Javadoc qui expliquait ça. J'ai oublié de la retoucher alors.

## Diataxis n' utilise pas Diataxis !

Emmanuel ; Ce qui est rigolo, c'est que Diátaxis, en fait, son site web n'utilise pas le concept de tutoriel. Oui, mais...

Guillaume : - Alors, j'ai vu que tu as mis ça dans ton article. Ouais, cela dit, ce n'est pas un projet, outil, une API, etc.
Enfin, tu vas me dire que c'est un outil de documentation, mais ce n'est pas un outil, donc ça ne me choque pas que ça ne suive pas exactement ce principe-là, si tu veux. Mais bon, vas-y, je te laisse exprimer ton opinion.

En gros, eux, ils ont donc là... on est dans des explications, là, on est d'accord.

Exactement, exactement. Ils n'ont que des explications et du coup, ils ont structuré différemment. Du coup, effectivement, bah c'est que tu disais ça assez tôt.

# Flexible Mind

C'est, et d'ailleurs, le site est assez clair là-dessus : c'est que, bon, ben, c'est OK de se lancer et de ne pas adopter ça de manière extrêmement stricte. Du coup, vous allez peut-être vous influencer beaucoup par ça pour simplifier des questionnements philosophiques trop compliqués pour certaines personnes dans l'équipe, et aider à la clarté et à minimiser la redondance. Par contre, ne tombez pas dans... euh, bah c'est comme tout. Ce qui est intéressant avec les ADR (Architectural Decision Records), c'est qu'on se rappelle le contexte et les raisons pour lesquelles les décisions ont été prises. Et surtout, si vous avez oublié pourquoi vous avez embrassé ce framework-là et que vous l'appliquez à la lettre, c'est un problème. 

Prenez quand même du recul là-dessus. Ça doit être une aide et pas un carcan. 

En fait, il y a un premier carcan où vous ne savez pas comment structurer votre documentation. Le deuxième, c'est que c'est trop limité. Voilà. Après, je n'ai pas vu d'exemples. Il y a des gens qui parlaient du fait que tout ne rentrait pas forcément dans les cases. Bah, c'est OK aussi d'ouvrir. Tu avais des exemples de ça ou des choses qui ne rentraient pas dans les cases ? Je n'ai pas vraiment trouvé ça.


# Types de Documentation et Exemples Pratiques

Par contre, dans TheGoodDocsProject, j'ai vu qu'il y avait pas mal de templates différents. Ils ont des... alors je te lis :  
- API Quickstart  
- API Reference  
- Bug Report, mais bon, ce n'est pas vraiment de la doc  
- Code of Conduct  
- Change Log  
- Concept  
- Contributing Guide  

Après, tu vois, "Concept", c'est des explications. "Contributing Guide", c'est peut-être un "How to" ou... ouais, ça peut être ça.  
Les FAQ, tu mets ça dans quoi ?  
Ouais, c'est marrant, pour moi, c'est les "fireside How to", tu vois. Et pourquoi tu fais ça ? Non, remarque, tu dis pourquoi tu fais ça, ça dépend en fait de la nature de la question. Ou moins, cadrer les FAQ... après, ça dépend. C'est vrai que c'est plus succinct, par exemple.  

Tu vois, ton Contributing Guide, déjà, il y a "guide" dedans quand même. Ouais, qu'est-ce que c'est ? Ça peut être un "How to", mais moi, j'ai tendance quand même à mettre les "How to". Pour moi, les "How to" guides, c'est du projet, des classes, de la librairie, du SDK, peu importe ce que j'utilise, mais ce n'est pas de la méta-information nécessairement autour de comment contribuer au projet.  

Là, faut voir ce qu'on documente ici. Est-ce que c'est l'outil, le SDK, le produit ou le projet qui entoure tout ça ? Donc, c'est peut-être ceux-là qui ne rentrent pas trop dans la case.  

Et donc, juste pour une fois, parce que je suis tombé là-dessus en explorant Diátaxis et en regardant ce que pensent les gens de Diátaxis, il y a un projet qui s'appelle TheGoodProjects.dev, qui lui a des templates en fait. Donc vous pouvez aller... je ne sais plus où, mais assez vite, vous pouvez télécharger en gros la totalité des templates et ça vous donne le template du readme, le template de la liste des gens dans l’équipe, etc. Et ça, ce sont des choses qui sont vraiment complémentaires, pour le coup, parce que Diátaxis n'explique pas comment vous avez structuré à l'intérieur nécessairement. À part le tutoriel où c'est assez... il recommande quand même des approches où on accompagne, où on emmène la personne vers le succès, parce que l'idée c'est qu'il fasse l'expérience et que ça soit positif pour qu'il apprenne des choses.  

Je t'ai perdu Arnaud, mais j'ai déjà oublié ce que je voulais dire, et voilà. Il n'y a pas de chat memory.  

En tout cas, ouais, c'est bien d'avoir de la cohérence, je veux dire, de la consistance, la cohérence. Moi, les documentations sur lesquelles j'ai pu travailler ou interagir, etc., c'était la documentation de Groovy, la documentation de LongChain, Forge, puis aussi toute la documentation qu'on a chez Google, chez Google Cloud. Et c'est vrai que c'est quand même assez codifié. Et on a des templates pour... bah voilà, là, si tu fais un Quick Start, il doit être comme ci, comme ça. Le Quick Start, c’est un "How to guide" rapide de démarrage.  

Enfin, non, attends, oui, le Quick Start c'est plutôt un tutoriel du coup.  
Ouais, tu vois, même là, j'hésite, parce que le Quick Start, tu vas faire plusieurs choses, tu vas peut-être configurer ta base de données, déployer ton container, etc. Donc, c'est rapide mais ce n'est pas forcément un "How to", non, parce que... et en fait, je pense que ce qui joue beaucoup, c'est le fait que la personne est probablement novice si elle démarre avec un Quick Start.  

Mais du coup, deux choses que je voulais souligner là-dessus. Donc déjà, tu as quand même une sorte de notion de catégorisation/étiquetage, c'est-à-dire que "Quick Start" ce n'est pas n'importe quel type de tutoriel, quoi. Ouais, c'est une sous-catégorie, qui est plus courte, etc. Et en général, nous, par exemple, sur la documentation de Google Cloud, à chaque fois, tu as toujours un ou plusieurs Quick Starts, et après, tu as des guides plus détaillés qui vont plus loin. On a même aussi... ce qui est marrant, c'est que les tutoriels, ils sont un peu à part et on a aussi un portail pour retrouver tous les tutoriels.  

Il faut aussi voir qu'il y a des choses un petit peu orthogonales, c'est-à-dire comment rechercher la documentation, comment naviguer dans tous ces types de documentation, mais également comment rechercher ces informations-là. Et ça, c’est un peu de la UX, mais qui est importante et qui n'est pas forcément couverte par Diátaxis. Après, ça peut être des bonnes pratiques, etc.  

Je ne sais plus si j'avais un autre point, je sais plus ce que c'était.  
Ouais, ah, juste, en attendant que tu trouves ça, est-ce qu’il y a des gens là qui ont des commentaires ou des questions ? Sur, euh... enfin, des gens qui nous écoutent, là, qui ont des questions qui pourraient nous faire rebondir ? On peut voir ça, d’ailleurs, si tu sais, je ne sais pas où, une mailing list ou un Discord ou je ne sais quoi, et tu vas voir quelles sont les questions qui reviennent le plus souvent. Donc des petites questions, ça peut être simplement des FAQ. Mais après, sinon, ça peut être... ah ouais, non, attends, ils sont tout le temps en train de... comment configurer la base de données ? Ah, ok.

# Outils et Frameworks de Documentation

C'est de manière incrémentale qu'on va pouvoir rajouter ces différents types de documentation. Et c'est là où, bah, il va falloir faire un petit peu attention à ce que c'est. Du coup, ah, là, c'est plus un "How to". Donc les explications, je les garderai ailleurs. 

Essayer de ne pas trop mélanger les différents concepts.  

La difficulté, c'est qu'on écrit la documentation à un moment donné, ou même on la réécrit à un moment donné, et elle est à peu près propre. Et puis là, on se dit : "Tiens, ça c'était pas clair" ou "Tiens, je vais rajouter telle explication."  

Et c'est là où on commence à rajouter des greffes, là où ce n'est pas forcément idéal. On se dit : "Ah ouais, tiens, je crois que j'en parlais là, je le rajoute là." Et c'est là où ça se déforme de plus en plus. Donc c'est là où c'est intéressant d'avoir un truc structuré. C'est que plus tu sais, plus tu peux aider à structurer les choses, plus tu vas savoir où cette information doit naturellement se positionner.  

Ce que je fais, par exemple, sur LongChain4J, c'est qu'il y a souvent encore plein de trous dans la documentation, tu as tel modèle ou telle base qui n'est pas documentée. Et en fait, ce que j'avais fait, par exemple, pour la partie que je maintiens, c'est-à-dire les modules autour de Gemini, c'est que j'avais fait un blog post qui, finalement, est un tutoriel en fait. Qu'est-ce que tu peux faire avec ça, comment tu peux le faire, et j'explique les différentes choses.  

Et ce blog post, bon, je l'ai réadapté un petit peu et j'en ai fait un tutoriel qui explique finalement comment utiliser telle chose. Et après, je vois : "Bon, là, ça, j'ai pas besoin de l'expliquer, parce que pour moi, c'est dans les explications." Ah oui, la Chat Memory. Bon, bah, c'est expliqué ailleurs, ce concept-là, et je peux pointer vers.  

Alors, je ne sais plus où est-ce qu'on les... si on doit publier la Javadoc. Fais gaffe, d'ailleurs, elle doit être quelque part. Et bon, c'est vrai que je n'ai pas pointé vers la Javadoc, mais on peut... C'est marrant, je ne regarde plus jamais les Javadoc, quoi.
