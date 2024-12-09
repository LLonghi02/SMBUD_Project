// lib/styles/font.dart
import 'package:flutter/material.dart';

class AppFonts {
  static const TextStyle appTitle = TextStyle(
    fontSize: 20, // Dimensione del font
    fontWeight: FontWeight.bold, // Grassetto
    color: Colors.white, // Colore del testo
  );

  static const TextStyle screenTitle = TextStyle(
    fontSize: 30, // Dimensione del font
    fontWeight: FontWeight.bold, // Grassetto
    color: Colors.white, // Colore del testo
  );

  static const TextStyle button = TextStyle(
    fontSize: 18, // Dimensione del font
    fontWeight: FontWeight.bold,
    color: Colors.white, // Colore del testo
  );

  static const TextStyle text = TextStyle(
    fontSize: 12,
    height: 1.5,
  );
  static const TextStyle textQ = TextStyle(
    fontSize: 14,
    height: 1.5,
  );
  static const TextStyle textBold = TextStyle(
    fontFamily: 'MyFont',
    fontSize: 20,
    fontWeight: FontWeight.bold,
    height: 1.5,
  );
}
