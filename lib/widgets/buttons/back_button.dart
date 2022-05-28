import 'package:emed/core/constants/colors/color_const.dart';
import 'package:emed/core/constants/font/font_size.dart';
import 'package:emed/core/constants/font/font_style.dart';
import 'package:flutter/material.dart';

class BackButtonWidgets extends StatelessWidget {
  final VoidCallback ontap;
  final String text;
  final Icon icon;
  const BackButtonWidgets({this.icon = const Icon(
            Icons.chevron_left_outlined,
            size: FSize.extraLarge,
            color: ColorConst.kPrimaryColor,
          ),this.text = 'Back', required this.ontap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Row(
        children: [
          icon,
          Text(
            text,
            style: FStyles.headline3blue,
          ),
        ],
      ),
    );
  }
}