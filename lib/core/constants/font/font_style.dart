import 'package:emed/core/constants/colors/color_const.dart';
import 'package:emed/core/constants/font/font_size.dart';
import 'package:emed/core/constants/font/font_weight.dart';
import 'package:flutter/material.dart';

class FStyles {
  static const TextStyle headline1s = TextStyle(fontSize: FSize.extraLarge);
  static const TextStyle headline2s = TextStyle(fontSize: FSize.large, fontWeight: FWeight.bold);
  static const TextStyle headline3blue = TextStyle(fontSize: FSize.medium, fontWeight: FWeight.bold, color: ColorConst.kPrimaryColor);
  static const TextStyle headline3s = TextStyle(fontSize: FSize.medium, fontWeight: FWeight.bold);
  static const TextStyle headline4s = TextStyle(fontSize: FSize.medium);
  static const TextStyle headline5s = TextStyle(fontSize: FSize.medium);
  static const TextStyle headline52 = TextStyle(fontSize: FSize.medium2, color: ColorConst.blackfortext);
  static const TextStyle headline6s = TextStyle(fontSize: FSize.small);
  static const TextStyle headline7s = TextStyle(fontSize: FSize.extraSmall);
}
