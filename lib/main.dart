import 'package:emed/config/init/navigation/navigator.dart';
import 'package:emed/config/routes/page_routes.dart';
import 'package:emed/config/themes/main_theme.dart';
import 'package:emed/screens/home/view/home_view.dart';
import 'package:emed/screens/home/view/mainview/main_home_view.dart';
import 'package:emed/widgets/buttons/drop_dow_button.dart';
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
      
      home: HomeView()
      // initialRoute: '/mainauthview',
      // onGenerateRoute: MyRoute.instance.onGenerateRoute,
    );
  }
}
