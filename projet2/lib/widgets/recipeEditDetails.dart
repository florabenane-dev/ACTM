import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../model/data/recipe.dart';
import '../model/repositories/recipesListPresenter.dart';
import '../utils/utilsFunctions.dart';

class RecipeEditDetails extends StatelessWidget{

  // TODO: Ajouter les autres Champs de text !
  // TODO: Ajouter le bouton Add new Ingredient !
  // TODO: Ajouter les boutons de suppression !
  // TODO: Ajouter la checkbox et Implementer la logique de tri !
  // TODO: Implémenter la logique CRUD pour les ingrédients = Ajout,edit,supp

  ///constructeur
  const RecipeEditDetails({super.key});

  @override
  Widget build(BuildContext context) {
    /// passer les arguments de route
    final recipe = ModalRoute.of(context)!.settings.arguments as Recipe;

    /// s'abonner au ChangeNotifier
    final recipesPresenter = context.watch<RecipesListPresenter>();

    bool sortedByName = false;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          recipe.name,
          style: TextStyle(fontSize: 27),
        ),
      ),

      body: SingleChildScrollView (
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // preparation time
            SizedBox(
              height: 50.0,
              child: TextFormField(
                initialValue: "${recipe.prepTime}",
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (prepTimeUser) {
                  try {
                    recipesPresenter.setPrepTime(recipe, int.parse(prepTimeUser));
                  } on FormatException {
                    //exception
                    // TODO : Ajouter la gestion d'exception
                  }
                },
                decoration: const InputDecoration(
                  label: Text("Prep Time (mins)"),
                  labelStyle: TextStyle(fontSize: 14),
                  border: OutlineInputBorder(),
                  hintText: "Enter a preparation Time",
                  hintStyle: TextStyle(fontSize: 15),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.indigo,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // cook time
            SizedBox(
              height: 50.0,
              child: TextFormField(
                initialValue: "${recipe.cookTime}",
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (cookTimeUser) {
                  try {
                    recipesPresenter.setCookTime(recipe, int.parse(cookTimeUser));
                  } on FormatException {
                    //exception
                    // TODO : Ajouter la gestion d'exception
                  }
                },
                decoration: const InputDecoration(
                  label: Text("Cook Time (mins)"),
                  labelStyle: TextStyle(fontSize: 14),
                  border: OutlineInputBorder(),
                  hintText: "Enter a cook Time",
                  hintStyle: TextStyle(fontSize: 15),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.indigo,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // serving
            SizedBox(
              height: 50.0,
              child: TextFormField(
                initialValue: "${recipe.serving}",
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (servingUser) {
                  try {
                    recipesPresenter.setServing(recipe, int.parse(servingUser));
                  } on FormatException {
                    //exception
                    // TODO : Ajouter la gestion d'exception
                  }
                },
                decoration: const InputDecoration(
                  label: Text("Serving"),
                  labelStyle: TextStyle(fontSize: 14),
                  border: OutlineInputBorder(),
                  hintText: "Enter the number of serving",
                  hintStyle: TextStyle(fontSize: 15),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.indigo,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // ingredients
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Ingredients",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 27),

                // case à cocher
                Checkbox(value: sortedByName,
                  onChanged: (bool? value) {
                    // TODO: Implementer le tri par nom
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("tri par nom à faire")),
                    );
                    sortedByName = value!;
                  },
                ),
                const Expanded(child: Text(
                    "Sort By Name",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: recipe.ingredients.map((ingredient) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50.0,
                          child: TextFormField(
                            initialValue: UtilsFunctions.formatNumber(ingredient.quantity),
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            onChanged: (quantityUser) {
                              try {
                                recipesPresenter.setQuantity(recipe, ingredient, double.parse(quantityUser));
                              } on FormatException {
                                // TODO gestion erreur
                              }
                            },
                            decoration: InputDecoration(
                              label: Text(
                                  ingredient.unit.isNotEmpty
                                    ? "${ingredient.name }" "(${ingredient.unit})"
                                    : ingredient.name,
                              ),
                              labelStyle: const TextStyle(fontSize: 14),
                              border: const OutlineInputBorder(),
                              hintText: "Enter ${ingredient.name}'s quantity",
                              hintStyle: const TextStyle(fontSize: 15),
                              filled: true,
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.indigo,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),

                      // bouton Delete
                      FilledButton(
                        onPressed: () {
                          // TODO: Implementer Delete ingredient
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("delete ingredient à faire")),
                          );
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.red[900],
                          minimumSize: const Size(45, 45),
                          padding: EdgeInsets.zero,
                        ),
                        child: const Icon(
                          Icons.delete_outlined,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            // bouton Add Ingredient
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implementer Add ingredient
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("add ingredient à faire")),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.add_circle_outline,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 7),
                    const Text(
                      "Add ingredient",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ),

          ]
        ),
      ),
    );
  }

}