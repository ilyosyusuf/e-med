import 'package:emed/config/themes/main_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-med',
      theme: MainTheme.apptheme,
      home: MyHomePage(),
    );
  }
}
