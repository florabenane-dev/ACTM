import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projet2/model/data/ingredients.dart';
import 'package:provider/provider.dart';

import '../model/data/recipe.dart';
import '../model/repositories/recipesListPresenter.dart';
import '../utils/utilsFunctions.dart';

class RecipeEditDetails extends StatefulWidget {

  // TODO: Ajouter la checkbox et Implementer la logique de tri !

  ///constructeur
  const RecipeEditDetails({super.key});

  @override
  State<StatefulWidget> createState() => _RecipeEditDetailsState();

}

class _RecipeEditDetailsState extends State<RecipeEditDetails> {
  bool sortedByName = false;

  @override
  Widget build(BuildContext context) {
    /// passer les arguments de route
    final recipe = ModalRoute.of(context)!.settings.arguments as Recipe;

    /// s'abonner au ChangeNotifier
    final recipesPresenter = context.watch<RecipesListPresenter>();

    /// liste temporaire triée
    final displayedIngredients = sortedByName
      ? (List.from(recipe.ingredients)
        ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase())))
        : recipe.ingredients;

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

            // Text + case à cocher
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
                    setState(() {
                      sortedByName = value!;
                    });
                  },
                ),
                const Expanded(child: Text(
                    "Sort By Name",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],),

            // ingredients
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: displayedIngredients.map((ingredient) {
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
                          setState(() {
                            recipesPresenter.removeIngredient(recipe, ingredient);
                          });
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
                onPressed: () async {
                  String newName = "";
                  String newUnit = "";
                  double newQuantity = 0;

                  // ouverture du dialog pour saisir le nouvel ingrédient
                  await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(
                        "Add Ingredient",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.indigo,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            recipesPresenter.addIngredient(
                              recipe,
                              name: newName,
                              unit: newUnit,
                              quantity: newQuantity,
                            );
                          },
                          child: Text("Add"),
                        ),
                      ],
                      content: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              //nom
                              TextField(
                                decoration: const InputDecoration(
                                  label: Text("Name"),
                                  labelStyle: TextStyle(fontSize: 14),
                                  border: OutlineInputBorder(),
                                  hintText: "Enter ingredient's name",
                                  hintStyle: TextStyle(fontSize: 13),
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.indigo,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                onChanged: (value) => newName = value,
                              ),
                              const SizedBox(height: 20),
                              //unit
                              TextField(
                                decoration: const InputDecoration(
                                  label: Text("Unit"),
                                  labelStyle: TextStyle(fontSize: 14),
                                  border: OutlineInputBorder(),
                                  hintText: "Enter ingredient's unit",
                                  hintStyle: TextStyle(fontSize: 15),
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.indigo,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                onChanged: (value) => newUnit = value,
                              ),
                              const SizedBox(height: 20),
                              //quantity
                              TextField(
                                decoration: const InputDecoration(
                                  label: Text("Quantity"),
                                  labelStyle: TextStyle(fontSize: 14),
                                  border: OutlineInputBorder(),
                                  hintText: "Enter ingredient's quantity",
                                  hintStyle: TextStyle(fontSize: 15),
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.indigo,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                keyboardType: TextInputType.numberWithOptions(decimal: true),
                                onChanged: (value) => newQuantity = double.tryParse(value) ?? 0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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