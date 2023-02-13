import 'package:flutter/material.dart';

class Tema {
  criaTema() {
    return ThemeData(
        primaryColor: const Color(0xFF1B281F),
        scaffoldBackgroundColor: const Color(0xFFD8DACC),
        textTheme:
            const TextTheme(bodyText1: TextStyle(color: Color(0xFF1B281F))));
  }
}
