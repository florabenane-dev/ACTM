import 'dart:ui';

class Recipe {
  Image photo;
  int prep_time;
  int cook_time;
  int serving;
  String ingredients;
  String directions;

  Recipe(this.photo, this.prep_time, this.cook_time, this.serving, this.ingredients, this.directions);
}