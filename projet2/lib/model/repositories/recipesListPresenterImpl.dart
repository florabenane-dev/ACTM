import 'package:get_it/get_it.dart';
import 'package:projet2/model/data/ingredients.dart';
import 'package:projet2/model/data/recipe.dart';
import 'package:projet2/model/repositories/recipesRepository.dart';
import 'package:projet2/model/repositories/recipesListPresenter.dart';

class RecipesListPresenterImpl extends RecipesListPresenter {

  final RecipeRepository repository;
  RecipesListPresenterImpl({required this.repository});

  @override
  List<Recipe> get recipes => GetIt.instance<RecipeRepository>().recipes;

  @override
  void shiftCookTime(Recipe recipe, int shift) {
    recipe.cookTime += shift;
    if (recipe.cookTime< 0) recipe.cookTime = 0;
    notifyListeners();
  }

  @override
  void setCookTime(Recipe recipe, int quantity) {
    recipe.cookTime = quantity;
    notifyListeners();
  }

  @override
  void shiftPrepTime(Recipe recipe, int shift) {
    recipe.prepTime += shift;
    if (recipe.prepTime< 0) recipe.prepTime = 0;
    notifyListeners();
  }

  @override
  void setPrepTime(Recipe recipe, int quantity) {
    recipe.prepTime = quantity;
    notifyListeners();
  }

  @override
  void shiftServing(Recipe recipe, int shift) {
    recipe.serving += shift;
    if (recipe.serving< 0) recipe.serving = 0;
    notifyListeners();
  }

  @override
  void setServing(Recipe recipe, int quantity) {
    recipe.serving = quantity;
    notifyListeners();
  }

  @override
  void setQuantity(Recipe recipe, Ingredients ingredient, double quantity) {
    ingredient.quantity = quantity;
    notifyListeners();
  }

  @override
  void shiftQuantity(Recipe recipe, Ingredients ingredient, double shift) {
    ingredient.quantity += shift;

    //eviter les val negatives
    if (ingredient.quantity < 0) ingredient.quantity = 0;
    notifyListeners();
  }

  @override
  void addIngredient(Recipe recipe, {required String name, String unit = "", double quantity = 0}) {
    if (name.isEmpty) return;
    final ingredient = Ingredients(name: name, unit: unit, quantity: quantity);
    recipe.ingredients.add(ingredient);
    notifyListeners();
  }

  @override
  void removeIngredient(Recipe recipe, Ingredients ingredient) {
    recipe.ingredients.remove(ingredient);
    notifyListeners();
  }
}