import 'package:flutter/material.dart';
import 'package:projet2/data/model/recipe.dart';

class RecipesWidget extends StatelessWidget {
  final Recipe recipe;
  
  const RecipesWidget({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipes"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(child: Text(recipe.name)),
              const SizedBox(width: 16),
              Text("${recipe.prepTime}"),
              const SizedBox(width: 16),
              Text("${recipe.cookTime}"),
              const SizedBox(width: 16),
            ],
          )
      ),
    );
  }

}