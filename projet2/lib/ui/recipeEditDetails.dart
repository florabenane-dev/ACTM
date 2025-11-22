import 'package:flutter/material.dart';
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
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormField(
                initialValue: "${recipe.prepTime}",
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
                    border: OutlineInputBorder(),
                    hintText: "Enter a preparation Time",
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.indigo,
                        width: 2.0,
                      ),
                    ),
                  ),
              ),

          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: []
          // ),
        ]),
    ),
    );
  }

}