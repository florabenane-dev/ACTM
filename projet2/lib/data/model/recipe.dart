import 'package:flutter/cupertino.dart';
import 'package:projet2/data/model/ingredients.dart';

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
  final List<Ingredients> ingredients;

  /// Les directives de la recette
  final String directions;

  /// Le constructeur
  Recipe({
    required this.photo,
    required this.prepTime,
    required this.cookTime,
    required this.serving,
    required this.ingredients,
    required this.directions
  });
  // PS: ajout de required pour eviter null et les {} pour les parametres nommes = plus sécurisant et interdit l'invser les parametres
}