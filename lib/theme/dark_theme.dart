import 'package:flutter/material.dart';
import 'package:testai/core/utils/color_constant.dart';

import 'text_theme.dart';

ThemeData dark = ThemeData(
  scaffoldBackgroundColor: ColorConstant.darkColor,
  primaryColor: const Color.fromRGBO(76, 158, 235, 1),
  hintColor: const Color.fromRGBO(104, 118, 132, 1),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: ColorConstant.darkColor,
    selectedItemColor: Colors.white,
    elevation: 0,
  ),
  appBarTheme: AppBarTheme(
    color: ColorConstant.darkColor,
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.white),
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
  // fontFamily: 'SF Pro Text',
  textTheme: AppTextTheme.darkTheme,
  brightness: Brightness.dark,
);
