import 'package:flutter/material.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme lightTheme = const TextTheme(
    displayLarge: TextStyle(fontFamily: 'Inter', color: Color.fromRGBO(20, 22, 25, 1)),
    displayMedium: TextStyle(fontFamily: 'Inter', color: Color.fromRGBO(20, 22, 25, 1)),
    bodyLarge: TextStyle(fontFamily: 'Inter', color: Color.fromRGBO(20, 22, 25, 1)),
    bodyMedium: TextStyle(fontFamily: 'Inter', color: Color.fromRGBO(20, 22, 25, 1)),
    bodySmall: TextStyle(fontFamily: 'Inter', color: Color.fromRGBO(20, 22, 25, 1)),
    displaySmall: TextStyle(fontFamily: 'Inter', color: Color.fromRGBO(20, 22, 25, 1)),
    headlineMedium: TextStyle(fontFamily: 'Inter', color: Color.fromRGBO(20, 22, 25, 1)),
    headlineSmall: TextStyle(fontFamily: 'Inter', color: Color.fromRGBO(20, 22, 25, 1)),
    titleLarge: TextStyle(fontFamily: 'Inter', color: Color.fromRGBO(20, 22, 25, 1)),
    titleMedium: TextStyle(fontFamily: 'Inter', color: Color.fromRGBO(20, 22, 25, 1)),
    titleSmall: TextStyle(fontFamily: 'Inter', color: Color.fromRGBO(20, 22, 25, 1)),
    labelLarge: TextStyle(fontFamily: 'Inter', color: Color.fromRGBO(20, 22, 25, 1)),
    labelMedium: TextStyle(fontFamily: 'Inter', color: Color.fromRGBO(20, 22, 25, 1)),
    labelSmall: TextStyle(fontFamily: 'Inter', color: Color.fromRGBO(20, 22, 25, 1)),
  );

  static TextTheme darkTheme = const TextTheme(
    displayLarge: TextStyle(fontFamily: 'Inter', color: Colors.white),
    displayMedium: TextStyle(fontFamily: 'Inter', color: Colors.white),
    bodyLarge: TextStyle(fontFamily: 'Inter', color: Colors.white),
    bodyMedium: TextStyle(fontFamily: 'Inter', color: Colors.white),
    bodySmall: TextStyle(fontFamily: 'Inter', color: Colors.white),
    displaySmall: TextStyle(fontFamily: 'Inter', color: Colors.white),
    headlineMedium: TextStyle(fontFamily: 'Inter', color: Colors.white),
    headlineSmall: TextStyle(fontFamily: 'Inter', color: Colors.white),
    titleLarge: TextStyle(fontFamily: 'Inter', color: Colors.white),
    titleMedium: TextStyle(fontFamily: 'Inter', color: Colors.white),
    titleSmall: TextStyle(fontFamily: 'Inter', color: Colors.white),
    labelLarge: TextStyle(fontFamily: 'Inter', color: Colors.white),
    labelMedium: TextStyle(fontFamily: 'Inter', color: Colors.white),
    labelSmall: TextStyle(fontFamily: 'Inter', color: Colors.white),
  );
}
