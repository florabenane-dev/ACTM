import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:projet2/model/repositories/RecipesRepository.dart';
import 'package:projet2/ui/RecipesWidget.dart';

/// Affiche la liste des recettes avec un ListView
class RecipeListWidget extends StatelessWidget {
  const RecipeListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final recipeRepository = GetIt.instance<RecipeRepository>();
    final recipes = recipeRepository.recipes;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text(
          "Recipes",
          style: TextStyle(fontSize: 27),
        ),
      ),
      body: Column( children: [
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (BuildContext context, int index) {
                  return RecipesWidget(recipe: recipes[index]);
                }),
          ),
        ],),
    );

  }

}