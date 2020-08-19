import 'package:flutter/material.dart';

class ConstantesApp {
  static const String fundoTelaLogin = "assets/images/pexelsDois.jpg";

  static InputDecoration decorationInput(hint, icone) {
    return InputDecoration(
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        prefixIcon: Icon(
          icone,
          color: Colors.black,
        ),
        hintText: hint,
        hintStyle: TextStyle(fontSize: 14));
  }
}
