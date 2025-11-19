import 'package:flutter/cupertino.dart';

/// Correspond à une interface pour les données des recettes
class Recipe {
  /// Photo de la recette
  final AssetImage photo;

  /// Le temps de préparation
  final int prepTime;

  /// Le temps de cuisson
  final int cookTime;

  /// Le nombre de personne à servir
  final int serving;

  /// La liste d'ingrédients avec leurs quantités
  final String ingredients;

  /// Les directives de la recette
  final String directions;

  /// Le constructeur
  Recipe(
      this.photo,
      this.prepTime,
      this.cookTime,
      this.serving,
      this.ingredients,
      this.directions
      );
}