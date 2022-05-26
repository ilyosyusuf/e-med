import 'package:emed/core/constants/colors/color_const.dart';
import 'package:emed/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.kPrimaryColor,
      body: Center(
        child: Image.asset('assets/images/splashlogo.png', width: context.w * 0.5),
      ),
    );
  }
}