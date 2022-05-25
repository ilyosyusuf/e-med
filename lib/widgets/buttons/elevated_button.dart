import 'package:emed/widgets/buttons/elevated_button_style.dart';
import 'package:flutter/material.dart';

class ButtonWidgets extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final double height;
  final double width;
  const ButtonWidgets({required this.child,this.height = 30, required this.onPressed,this.width = 350,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyles.elevetedStyle(context: context, width: width, height: height),
      child: Align(alignment: Alignment.center,child: child),
    );
  }
}