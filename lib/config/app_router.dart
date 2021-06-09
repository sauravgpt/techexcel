import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techexcel/splash/splash_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print(settings.name);
    switch (settings.name) {
      case SplashScreen.routeName:
        return SplashScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() => MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: Text('Error Screen'),
          ),
          body: Center(
            child: Text('Error Page Not Found'),
          ),
        ),
      );
}
