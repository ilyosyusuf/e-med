import 'package:emed/core/constants/colors/color_const.dart';
import 'package:flutter/material.dart';

class MainTheme {
  static ThemeData get apptheme => ThemeData(
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(ColorConst.white))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(ColorConst.kPrimaryColor))),
      colorScheme: const ColorScheme.light(
          primary: ColorConst.kPrimaryColor, brightness: Brightness.light));
}