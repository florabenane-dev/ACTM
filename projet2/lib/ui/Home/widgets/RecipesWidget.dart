import 'package:flutter/material.dart';

class RecipesWidget extends StatelessWidget {
  const RecipesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipes"),
      ),
      body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text("Recipes Init")
      ),
    );
  }

}