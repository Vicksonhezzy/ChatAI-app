import 'package:flutter/material.dart';
import 'package:testai/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get fillIndigoA700 => BoxDecoration(
        color: ColorConstant.indigoA700,
      );
  static BoxDecoration get outlineBlack900 => BoxDecoration(
        color: ColorConstant.gray100,
        border: Border.all(
          color: ColorConstant.black900,
          width: getHorizontalSize(1.00),
        ),
      );
  static BoxDecoration get txtFillBluegray100 => BoxDecoration(
        color: Colors.blueGrey.shade100,
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
}

class BorderRadiusStyle {
  static BorderRadius customBorderBL15 = BorderRadius.only(
    topRight: Radius.circular(getHorizontalSize(15.00)),
    bottomLeft: Radius.circular(getHorizontalSize(15.00)),
    bottomRight: Radius.circular(getHorizontalSize(15.00)),
  );

  static BorderRadius roundedBorder10 =
      BorderRadius.circular(getHorizontalSize(5.00));

  static BorderRadius sentRadius = const BorderRadius.only(
      bottomLeft: Radius.circular(10),
      bottomRight: Radius.circular(10),
      topRight: Radius.circular(10));

  static BorderRadius customBorderTL15 = BorderRadius.only(
    topLeft: Radius.circular(getHorizontalSize(5)),
    bottomLeft: Radius.circular(getHorizontalSize(2)),
    bottomRight: Radius.circular(getHorizontalSize(10)),
  );

  static BorderRadius txtRoundedBorder8 = BorderRadius.circular(
    getHorizontalSize(8.00),
  );
}
