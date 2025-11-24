import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

  /// Ouvre la galerie ou la caméra et retourne le fichier choisi
  static Future<File?> chooseImageSource({required BuildContext context}) async {
    final picker = ImagePicker();
    File? selectedFile;

    await showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text("Photo Library"),
              onTap: () async {
                final picked = await picker.pickImage(source: ImageSource.gallery);
                if (picked != null) selectedFile = File(picked.path);
                if (context.mounted) Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera),
              title: const Text("Camera"),
              onTap: () async {
                final picked = await picker.pickImage(source: ImageSource.camera);
                if (picked != null) selectedFile = File(picked.path);
                if (context.mounted) Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );

    return selectedFile;
  }

}

