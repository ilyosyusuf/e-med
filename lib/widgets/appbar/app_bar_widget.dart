import 'package:emed/core/constants/colors/color_const.dart';
import 'package:emed/core/constants/font/font_style.dart';
import 'package:emed/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final Widget center;
  final Widget leading;
  final Widget trailing;
  const AppBarWidget({
    this.trailing = const SizedBox(),
    required this.leading,
    this.center = const Text('Sign up', style: FStyles.headline3s,),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.h * 0.07,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: context.w * 0.015),
            leading,
            const Spacer(),
            center,
            const Spacer(),
            trailing,
            SizedBox(width: context.w * 0.015),
          ],
        ),
        const Divider(
          color: ColorConst.black,
        )
      ]),
    );
  }
}