import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class UtilsFunctions {

  /// Retourne un nombre sans le .0 si son décimal est vide
  static String formatNumber(double number) {
    String str;

    /// supprimer le .0 si le nombre est entier
    if (number % 1 == 0) {
      str = number.toInt().toString();
    } else {
      str = number.toString();
    }

    return str.replaceAll('.', ',');
  }

