import 'package:flutter/material.dart';
import 'package:projet2/ui/Home/widgets/RecipesWidget.dart';

void main() {
  runApp(const MyApp());
}

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
      home: const RecipesWidget(),
    );
  }
}