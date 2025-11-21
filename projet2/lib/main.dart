import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:projet2/model/repositories/recipeRepositoryDummyImpl.dart';
import 'package:projet2/model/repositories/recipesListPresenter.dart';
import 'package:projet2/model/repositories/recipesListPresenterImpl.dart';
import 'package:projet2/model/repositories/recipesRepository.dart';
import 'package:projet2/ui/recipeDetails.dart';
import 'package:projet2/ui/recipeEditDetails.dart';
import 'package:projet2/ui/recipeListWidget.dart';
import 'package:provider/provider.dart';

void main() {
 final recipeRepository = RecipeRepositoryDummyImpl();
 GetIt.instance.registerSingleton<RecipeRepository>(recipeRepository);

 runApp(ChangeNotifierProvider<RecipesListPresenter>(
    create: (context) => RecipesListPresenterImpl(repository: recipeRepository),
    child: (const MyApp()),
  )
  );
}

/// Point d'entree de l'application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(seedColor: Colors.indigo);
    return MaterialApp(
      title: 'Recipes App',
      theme: ThemeData(
        colorScheme: colorScheme,
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 20),
          labelLarge: TextStyle(fontSize: 20),
          bodyLarge: TextStyle(fontSize: 20)
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary
        )
      ),
      initialRoute: '/recipesList',
      routes: {
        '/recipesList': (context) => const RecipeListWidget(),
        '/recipeDetails': (context) => const RecipeDetails(),
        // '/recipeEdit': (context) => const RecipeEditDetails(),
      },
    );
  }
}