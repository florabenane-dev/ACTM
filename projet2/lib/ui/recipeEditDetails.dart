import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../model/data/recipe.dart';
import '../model/repositories/recipesListPresenter.dart';

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
                  onChanged: (text) {
                    try {
                      recipesPresenter.setPrepTime(recipe, int.parse(text));
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
                  onChanged: (text) {
                    try {
                      recipesPresenter.setCookTime(recipe, int.parse(text));
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
                  onChanged: (text) {
                    try {
                      recipesPresenter.setServing(recipe, int.parse(text));
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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ingredients
                  Text(
                    "Ingredients",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(width: 30),

                  // case à cocher
                  Checkbox(value: sortedByName,
                    onChanged: (bool? value) {
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
                              initialValue: "${ingredient.quantity}",
                              keyboardType: TextInputType.number,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              onChanged: (text) {
                                try {
                                  recipesPresenter.setServing(recipe, int.parse(text));
                                } on FormatException {
                                  // TODO gestion erreur
                                }
                              },
                              decoration: InputDecoration(
                                label: Text("${ingredient.name} ${ingredient.unit}"),
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

                        FilledButton(
                          onPressed: () { },
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.red[900],
                            minimumSize: const Size(50, 50),
                            padding: EdgeInsets.zero,
                          ),
                          child: const Icon(
                            Icons.delete_outlined,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),

              // les ingredients

              const SizedBox(height: 20),




                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: []
                // ),
        ]),
    ),
    );
  }

}