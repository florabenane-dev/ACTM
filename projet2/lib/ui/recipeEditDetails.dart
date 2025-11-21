import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/data/recipe.dart';
import '../model/repositories/recipesListPresenter.dart';

class RecipeEditDetails extends StatelessWidget{

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

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  decoration: const InputDecoration(label: Text("Prep Time (mins)")),
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