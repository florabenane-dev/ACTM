# Approche comparative des technologies mobiles  
## Ionic · Flutter · iOS

Ce dépôt GitHub regroupe une série de **trois projets mobiles** développés dans le cadre d’une approche comparative des technologies de développement mobile. Chaque projet est contenu dans un dossier distinct du dépôt et implémente une application fonctionnelle complète à l’aide d’une **technologie différente** : Ionic, Flutter et iOS natif.

L’objectif de cette démarche n’était pas seulement de livrer des applications fonctionnelles, mais de comparer concrètement les **choix d’architecture**, la **gestion de l’état**, la **navigation**, la **logique métier** et l’**expérience utilisateur** propres à chaque technologie. Les projets ont été développés progressivement, versionnés sur GitHub et structurés avec une attention particulière portée à la lisibilité du code, à l’organisation des fichiers et à la qualité des commits.

---

## Projet 1 — Application de gestion de playlists (Ionic)

Le dossier `projet1` contient une application mobile développée avec Ionic, permettant de créer une playlist musicale à partir d’une liste de chansons prédéfinie. L’application affiche les morceaux avec leurs informations principales (titre, artiste, durée) et permet à l’utilisateur de sélectionner plusieurs chansons afin de constituer une playlist personnalisée. Des fonctionnalités de tri par titre, artiste ou durée sont proposées, et la durée totale de la playlist est calculée dynamiquement.

L’application intègre une navigation vers un écran de détail permettant de modifier les informations d’un morceau sélectionné, puis un écran récapitulatif affichant la playlist finale. Cette playlist peut être partagée sous forme de texte avec d’autres applications. Ce projet met en évidence la conception d’une application hybride basée sur les technologies web, ainsi que la gestion de la navigation et des composants UI dans Ionic.

---

## Projet 2 — Application de recettes de cuisine (Flutter)

Le dossier `projet2` regroupe une application mobile développée en Flutter autour de la gestion de recettes de cuisine. L’application affiche une liste de recettes avec images, temps de préparation et de cuisson, et permet d’accéder à un écran détaillé pour chaque recette.

Sur cet écran, le nombre de portions peut être ajusté dynamiquement, ce qui entraîne une mise à jour automatique des quantités d’ingrédients. Un mode édition permet également de modifier les recettes, d’ajouter ou supprimer des ingrédients et de trier la liste par ordre alphabétique. Ce projet a permis d’explorer la gestion de l’état, la composition des widgets et la création d’interfaces réactives et performantes propres à Flutter.

---

## Projet 3 — Application de gestion de commandes de glaces (iOS natif)

Le dossier `projet3/IceCream` contient une application iOS native simulant la gestion de commandes de glaces dans un contexte de service. L’utilisateur peut composer une glace en sélectionnant différents parfums dans la limite d’un nombre maximal de boules, choisir le type de contenant, ajouter des suppléments et visualiser le prix total calculé dynamiquement.

L’application intègre une gestion des stocks avec affichage d’alertes en cas de rupture, des écrans dédiés à la consultation de l’état global des stocks et la génération automatique de mails de commande pour le réapprovisionnement. Ce projet met en œuvre une logique métier plus avancée, une navigation multi-écrans et des interactions natives spécifiques à l’écosystème iOS.

---

## Comparaison technique synthétique

| Critère                  | Ionic                         | Flutter                         | iOS natif                       |
|-------------------------|-------------------------------|----------------------------------|---------------------------------|
| Type de technologie     | Hybride (Web)                 | Multiplateforme compilé          | Natif                            |
| Langage principal       | HTML / CSS / JavaScript       | Dart                             | Swift                            |
| Performance perçue      | Bonne                          | Très bonne                       | Excellente                      |
| Gestion de l’état       | Dépend du framework JS        | Centralisée et explicite         | Intégrée à l’architecture iOS   |
| Rendu UI                | WebView                       | Moteur de rendu Flutter          | Composants natifs               |
| Accès aux APIs système  | Via plugins                   | Via plugins                      | Direct                          |

---

## Ce que j’ai appris

Cette série de projets m’a permis de confronter différentes technologies mobiles à des **cas d’usage concrets**, en allant au-delà d’une approche purement théorique. J’ai renforcé ma capacité à structurer des applications mobiles, à gérer l’état et la navigation de manière cohérente, et à analyser les compromis entre performance, maintenabilité et expérience utilisateur.

Cette démarche comparative m’a appris à **choisir une technologie en fonction des besoins réels d’un projet**, plutôt que par habitude, et constitue une base solide pour aborder des projets mobiles dans un contexte professionnel.

---

## Organisation du dépôt

- `projet1/` : application de gestion de playlists (Ionic)  
- `projet2/` : application de recettes de cuisine (Flutter)  
- `projet3/IceCream/` : application de gestion de glaces (iOS natif)

---

## Licence

Projet réalisé dans un cadre académique. Le code est mis à disposition à des fins pédagogiques.
