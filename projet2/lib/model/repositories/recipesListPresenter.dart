import 'package:flutter/cupertino.dart';
import 'package:projet2/model/data/recipe.dart';

abstract class RecipesListPresenter extends ChangeNotifier {
  abstract List<Recipe> recipes;

  void shiftQuantity(Recipe recipe, double shift);
  void shiftTimeServing(Recipe recipe, int shift);
  void setQuantity(Recipe recipe, double quantity);
  void setTimeServing(Recipe recipe, int quantity);
}