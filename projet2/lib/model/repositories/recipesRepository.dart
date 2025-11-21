import 'package:projet2/model/data/recipe.dart';

/// Classes :
/// QUI / QUOI / ROLE
/// CONTEXTE / USAGE

/// Prorietés :
/// ROLE ou TYPE ou USAGE

/// Méthodes :
/// [verbe + role principale]
/// @param [nom] [description]
/// @return [description]
/// @throws [nom] [description de la situation]

/// [Nom]: [verbe + role principale]
/// [ussage ou contexte]
/// Ce que doit fournir l'implementation pour les classes


/// Repository qui expose une liste statique de recettes
/// Les classes concrètes doivent fournir les recettes dans cette liste
abstract class RecipeRepository {

  /// Recettes fixes
  List<Recipe> get recipes;
}