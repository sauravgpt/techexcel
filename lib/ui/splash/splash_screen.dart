import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techexcel/bloc/internet_bloc/internet_cubit.dart';

import '../error_screens/error_export.dart';
import '../home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  const SplashScreen();

  static Route route() => MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => SplashScreen(),
      );

  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetDisconnected) {
          Navigator.pushNamed(context, NoConnectionScreen.routeName);
        } else if (state is InternetConnected) {
          Navigator.popAndPushNamed(context, HomeScreen.routeName);
        }
      },
      child: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );

    return Builder(
      builder: (context) {
        final internetState = context.watch<InternetCubit>().state;
        if (internetState is InternetDisconnected) {
          return NoConnectionScreen();
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
