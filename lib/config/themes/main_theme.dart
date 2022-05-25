import 'package:emed/core/constants/colors/color_const.dart';
import 'package:emed/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class MainTheme {
  static ThemeData get apptheme => ThemeData(
    fontFamily: 'MainFontFamily',
      colorScheme: const ColorScheme.light(
          primary: ColorConst.kPrimaryColor, brightness: Brightness.light));
}