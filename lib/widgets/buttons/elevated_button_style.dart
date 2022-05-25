
import 'package:emed/core/constants/colors/color_const.dart';
import 'package:emed/core/constants/font/font_style.dart';
import 'package:emed/core/constants/font/radius_const.dart';
import 'package:emed/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class ButtonStyles {
  static elevetedStyle({required double  width,required double height,required BuildContext context, Color backgroundcolor = ColorConst.kPrimaryColor, Color borderColor = Colors.transparent}) {
    return ElevatedButton.styleFrom(
        textStyle: FStyles.headline3s,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(RadiusConst.small)),
        primary: backgroundcolor,
        side: BorderSide(color: borderColor),
        fixedSize: Size(width, height));
  }
  
}