# Approche comparative des technologies mobiles  
## Ionic · Flutter · iOS

Ce dépôt regroupe une série de **trois projets mobiles** réalisés dans le cadre d’une approche comparative des technologies de développement mobile. Chaque projet implémente une application fonctionnelle autour d’un sujet donné, en utilisant une **technologie différente** (Ionic, Flutter et iOS natif).

L’objectif principal n’était pas uniquement de produire des applications fonctionnelles, mais d’analyser concrètement les **différences d’architecture**, de **gestion de l’état**, de **navigation**, ainsi que les impacts sur l’**expérience utilisateur** et la maintenabilité du code selon la technologie utilisée.

---

## Projet 1 — Application de gestion de playlists (Ionic)

Ce projet consiste à développer une application mobile permettant de créer une playlist musicale à partir d’une liste de chansons prédéfinie. L’application affiche la liste des morceaux avec leurs informations principales et permet à l’utilisateur de sélectionner des titres afin de constituer une playlist personnalisée. Des fonctionnalités de tri par titre, artiste ou durée sont intégrées, ainsi que le calcul dynamique de la durée totale de la playlist.

L’application propose également une navigation vers un écran de détail permettant de modifier les informations d’un morceau sélectionné, puis un écran récapitulatif offrant la possibilité de partager la playlist sous forme de texte avec d’autres applications. Ce projet met l’accent sur la structuration d’une application hybride, l’utilisation de composants UI web et la gestion de la navigation entre vues dans un environnement Ionic.

---

## Projet 2 — Application de recettes de cuisine (Flutter)

Le second projet vise à développer une application mobile de gestion de recettes de cuisine en utilisant Flutter. L’application affiche une liste de recettes avec images, temps de préparation et de cuisson, et permet d’accéder à un écran détaillé pour chaque recette.

Sur l’écran de détail, le nombre de portions peut être modifié dynamiquement, ce qui entraîne une mise à jour automatique des quantités d’ingrédients. L’application intègre également un mode édition permettant de modifier une recette, d’ajouter ou de supprimer des ingrédients, ainsi que de trier la liste des ingrédients. Ce projet a permis d’explorer en profondeur la gestion de l’état, la composition des widgets et la conception d’interfaces réactives et performantes avec Flutter.

---

## Projet 3 — Application de gestion de commandes de glaces (iOS natif)

Le troisième projet est une application iOS native destinée à la gestion de commandes de glaces dans un contexte de service. L’utilisateur peut composer une glace en sélectionnant différents parfums, dans la limite d’un nombre maximum de boules, choisir le type de contenant, ajouter des suppléments et visualiser le prix total calculé dynamiquement.

L’application gère également les stocks des différents éléments, affiche des alertes en cas de rupture, propose des écrans dédiés à la consultation de l’état global des stocks et permet la génération automatique de mails de commande. Ce projet met en œuvre une logique métier plus complexe, une navigation multi-écrans et des interactions natives propres à l’écosystème iOS.

---

## Conclusion

Ces trois projets ont été **versionnés et documentés sur GitHub**, avec une attention particulière portée à l’architecture des applications, à la lisibilité du code et à la qualité des commits. Cette démarche comparative m’a permis de mieux comprendre les **forces, limites et cas d’usage** de chaque technologie, et d’acquérir une vision plus critique et pragmatique dans le choix d’une stack mobile en fonction des besoins d’un projet.
