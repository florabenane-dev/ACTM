class UtilsFunctions {

  /// Retourne un nombre sans le .0 si son décimal est vide
  String formatNumber(double number) {
    String str;

    /// supprimer le .0 si le nombre est entier
    if (number % 1 == 0) {
      str = number.toInt().toString();
    } else {
      str = number.toString();
    }

    return str.replaceAll('.', ',');
  }
}