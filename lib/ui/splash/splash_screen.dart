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
        }
      },
      child: Scaffold(
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(top: 48, child: InternetStatusWidget()),
              Align(
                alignment: Alignment.center,
                child: Container(
                  child: Text(
                    'Welcome Screen! \n  (Splash screen)',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InternetStatusWidget extends StatelessWidget {
  const InternetStatusWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final internetBloc = context.watch<InternetCubit>();

    if (internetBloc.state is InternetConnected) {
      return Container(
        child: Text(
          'Internet Connected',
          style: Theme.of(context).textTheme.headline6.copyWith(
                color: Colors.green,
              ),
        ),
      );
    } else if (internetBloc.state is InternetDisconnected) {
      return Container(
        child: Text(
          'Internet Disconnected',
          style: Theme.of(context).textTheme.headline6.copyWith(
                color: Colors.red,
              ),
        ),
      );
    } else {
      return Container(
        child: Text(
          'Checking Internet Connection',
          style: Theme.of(context).textTheme.headline6.copyWith(
                color: Colors.lightBlue,
              ),
        ),
      );
    }
  }
}
