import 'package:emed/config/init/navigation/navigator.dart';
import 'package:emed/config/routes/page_routes.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'E-med',
      theme: MainTheme.apptheme,
      navigatorKey: NavigationService.instance.navigatorKey,
      initialRoute: '/signupview',
      onGenerateRoute: MyRoute.instance.onGenerateRoute,
    );
  }
}
