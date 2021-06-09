import 'package:flutter/material.dart';
import 'package:techexcel/ui/error_screens/error_export.dart';
import 'package:techexcel/ui/home_screen.dart';
import 'package:techexcel/ui/splash/splash_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print(settings.name);
    switch (settings.name) {
      case SplashScreen.routeName:
        return SplashScreen.route();

      case NoConnectionScreen.routeName:
        return NoConnectionScreen.route();

      case HomeScreen.routeName:
        return HomeScreen.route();

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
