
import 'package:projet2/model/data/ingredients.dart';

/// Correspond à une interface pour les données des recettes
class Recipe {
  /// Nom de la recette
  final String name;

  /// Photo de la recette
  String photo;

  /// Le temps de préparation
  int prepTime;

  /// Le temps de cuisson
  int cookTime;

  /// Le nombre de personne à servir
  int serving;

  /// La liste d'ingrédients avec leurs quantités
  List<Ingredients> ingredients;

  /// Les directives de la recette
  String directions;

  /// Le constructeur
  Recipe({
    required this.name,
    required this.photo,
    required this.prepTime,
    required this.cookTime,
    required this.serving,
    required this.ingredients,
    required this.directions
  });
  // PS: ajout de required pour eviter null et les {} sont pour les parametres nommes => plus sécurisant et interdit d'invser les parametres lors de l'implementation
}