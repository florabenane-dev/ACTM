import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projet2/model/data/recipe.dart';
import 'package:projet2/model/repositories/recipesListPresenter.dart';
import 'package:provider/provider.dart';

import '../utils/utilsFunctions.dart';

class RecipeDetails extends StatefulWidget {
  const RecipeDetails({super.key});

  @override
  State<StatefulWidget> createState() => _RecipeDetailsState();

// TODO: Ajouter l'importation depuis la Galerie ! (urgent)
// TODO: Faire la caméra ? (optionnel)
// TODO: Améliorer le Style ?
// TODO: Ajouter des animations ?
}

class _RecipeDetailsState extends State<RecipeDetails> {
  File? galleryFile;

  @override
  Widget build(BuildContext context) {
    /// passer les arguments de route
    final recipe = ModalRoute.of(context)!.settings.arguments as Recipe;

    /// s'occupera de la mise à jour
    final presenter = context.watch<RecipesListPresenter>();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          recipe.name,
          style: TextStyle(fontSize: 27),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // prepTime / cookTime + Edit Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Prep: ${recipe.prepTime} mins",
                        style: const TextStyle(fontSize: 16)
                    ),
                    SizedBox(height: 10),
                    Text(
                        "Cook: ${recipe.cookTime} mins",
                        style: const TextStyle(fontSize: 16)
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/recipeEditDetails',
                      arguments: recipe
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  ),
                  child: const Text(
                    "Edit Recipe",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),

            // Serving
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                    "Serving:",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    )
                ),
                Row(
                  children: [
                    //plus beau que elevatedbutton
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: () => presenter.shiftServing(recipe, -1),
                    ),
                    Text(
                        "${recipe.serving}",
                        style: const TextStyle(fontSize: 16)
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline),
                      onPressed: () => presenter.shiftServing(recipe, 1),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Image
            Stack(
              children: [
                ClipRRect(
                  child: recipe.photo.startsWith("assets/")
                    ? Image.asset(
                      recipe.photo,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    )
                    : Image.file(
                      File(recipe.photo),
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: FilledButton(
                    onPressed: () async {
                      File? image = await UtilsFunctions.chooseImageSource(context: context);
                      if (!mounted) return;
                      if (image != null) {
                        setState(() {
                          galleryFile = image;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Image sélectionnée !")),
                        );
                        // TODO: mettre à jour l'image de la recette
                      }
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      minimumSize: const Size(40, 40),
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      )
                    ),
                    child: const Icon(
                      Icons.image_outlined,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Ingredients
            const Text(
                "Ingredients",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                )
            ),
            const SizedBox(height: 8),
            ...recipe.ingredients
              .map((ingredient) => Text(
                "- ${ingredient.name} ${UtilsFunctions.formatNumber(ingredient.quantity)} ${ingredient.unit}",
                style: const TextStyle(fontSize: 14),
            )),
            const SizedBox(height: 24),

            // Directions
            const Text(
                "Directions",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                )
            ),
            const SizedBox(height: 8),
            Text(recipe.directions, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
