import 'package:flutter/cupertino.dart';
import 'package:projet2/model/data/ingredients.dart';
import 'package:projet2/model/data/recipe.dart';

abstract class RecipesListPresenter extends ChangeNotifier {
  List<Recipe> get recipes;

  ///ingredients
  void shiftQuantity(Recipe recipe, Ingredients ingredient, double shift);
  void setQuantity(Recipe recipe, Ingredients ingredient, double quantity);

  ///cookTime
  void shiftCookTime(Recipe recipe, int shift);
  void setCookTime(Recipe recipe, int quantity);

  ///prepTime
  void shiftPrepTime(Recipe recipe, int shift);
  void setPrepTime(Recipe recipe, int quantity);

  ///serving
  void shiftServing(Recipe recipe, int shift);
  void setServing(Recipe recipe, int quantity);

  ///ajouter un ingredients
  void addIngredient(Recipe recipe, {required String name, String unit = "", double quantity = 0});

  ///supprimer un ingredients
  void removeIngredient(Recipe recipe, Ingredients ingredient);
}