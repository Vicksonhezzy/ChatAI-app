import 'package:flutter/material.dart';
import '../core/utils/color_constant.dart';
import 'text_theme.dart';

ThemeData light = ThemeData(
  scaffoldBackgroundColor: ColorConstant.gray100, // Color.fromRGBO(231, 236, 240, 1),
  backgroundColor: const Color(0xFFF5F5F5), // const Color.fromRGBO(225, 225, 225, 1),
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    elevation: 0,
  ),
  primaryColor: const Color.fromRGBO(76, 158, 235, 1),
  hintColor: const Color.fromRGBO(104, 118, 132, 1),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: ColorConstant.whiteA700,
    elevation: 0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.blue.shade900;
          }
          return const Color.fromRGBO(76, 158, 235, 1);
        },
      ),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color.fromRGBO(76, 158, 235, 1),
    shape: CircleBorder(),
  ),
  fontFamily: 'SF Pro Text',
  textTheme: AppTextTheme.lightTheme,
  brightness: Brightness.light,
);
