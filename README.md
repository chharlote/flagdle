# Flagdle (Projet Daltons)

**Flagdle** est une application mobile ludique développée avec Flutter. Le jeu s'articule autour de la découverte de pays en utilisant les données de l'API RestfulCountries.

## Équipe de Développement

Ce projet a été réalisé par :
* **GERME Charlotte**
* **PINCEEL Matthieu**
* **FONTAINE Aurélien**
* **DELETANG-DEVIN Noa**

## Fonctionnalités Principales

* **Jeu de culture générale** : Devinez et découvrez des informations sur les pays du monde entier.
* **Intégration d'API externe** : Récupération dynamique des données (capitale, code ISO, continent, taille, population, nom du président) via l'API `restfulcountries.com`.
* **Sélection aléatoire** : Le jeu peut tirer au sort 20 pays ou un pays unique pour les sessions de jeu.
* **Gestion et sauvegarde du score** : Le score du joueur augmente, diminue ou se maintient en fonction des réponses, et est sauvegardé localement sur l'appareil.

## Technologies et Dépendances

L'application utilise plusieurs bibliothèques incontournables de l'écosystème Flutter :

* [**Flutter Riverpod**](https://riverpod.dev/) (`flutter_riverpod: ^2.6.1`) : Pour une gestion d'état robuste et réactive.
* [**HTTP**](https://pub.dev/packages/http) (`http: ^1.3.0`) : Pour effectuer les requêtes web vers l'API RestfulCountries.
* [**Shared Preferences**](https://pub.dev/packages/shared_preferences) (`shared_preferences: ^2.5.2`) : Pour la persistance des données légères, comme la sauvegarde du score du joueur.
* [**Isar**](https://isar.dev/) (`isar: ^3.1.0+1`) : Pour la base de données locale hautement performante (si applicable pour d'autres fonctionnalités).

## Installation et Exécution

### Prérequis

* Avoir installé le SDK [Flutter](https://docs.flutter.dev/get-started/install).
* Un émulateur iOS/Android ou un appareil physique connecté.

### Étapes

1. **Cloner le dépôt :**
   ```bash
   git clone https://github.com/chharlote/flagdle.git
   cd daltons
