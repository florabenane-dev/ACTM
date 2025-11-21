import 'package:flutter/material.dart';
import 'package:projet2/model/data/recipe.dart';

/// Responsable de l'affichage des noms, temps de préparation et temps de cuisson d'une recette
class RecipesWidget extends StatelessWidget {
  final Recipe recipe;
  
  const RecipesWidget({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            recipe.photo,
            width: 140,
            height: 120,
            fit: BoxFit.cover,
          ),

          SizedBox(
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    recipe.name,
                    style: const TextStyle(fontSize: 15)),

                const SizedBox(height: 8),
                Text(
                    "prep ${recipe.prepTime} mins",
                    style: const TextStyle(fontSize: 12)),
                const SizedBox(height: 4),
                Text(
                    "cook ${recipe.cookTime} mins",
                    style: const TextStyle(fontSize: 12)),
              ],),
          ),],
          // onPressed: () {
          //   Navigator.pushNamed(context, '/recipeDetails', arguments: recipe);
          // }
      ),
    );
  }
}