import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray600 = fromHex('#78777d');

  static Color gray700 = fromHex('#636771');

  static Color gray500 = fromHex('#939393');

  static Color black90066 = fromHex('#66000000');

  static Color blueGray100 = fromHex('#d9d9d9');

  static Color black900 = fromHex('#000000');

  static Color indigoA700 = fromHex('#334af1');

  static Color gray800 = fromHex('#494b4f');

  static Color blueGray10001 = fromHex('#cac9cf');

  static Color gray50001 = fromHex('#a3a3a3');

  static Color whiteA700 = fromHex('#ffffff');

  static Color gray100 = fromHex('#f4f3f9');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
