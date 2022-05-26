import 'package:emed/screens/authentication/view/mainview/main_view.dart';
import 'package:emed/screens/authentication/view/pages/signin_view.dart';
import 'package:emed/screens/authentication/view/pages/signup_page.dart';
import 'package:flutter/material.dart';

class MyRoute {
  static final MyRoute _instance = MyRoute._init();
  static MyRoute get instance => _instance;
  MyRoute._init();

  Route? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
            case '/mainauthview':
        return _pages(MainAuthView());
      case '/signupview':
        return _pages(SignUpView());
      case '/signinview':
        return _pages(SignInView());


    }
  }

  _pages(Widget page) {
    return MaterialPageRoute(builder: (context) => page);
  }
}
