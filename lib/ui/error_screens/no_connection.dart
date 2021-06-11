import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techexcel/bloc/internet_bloc/internet_cubit.dart';

class NoConnectionScreen extends StatelessWidget {
  static const String routeName = 'noConnection';

  static Route route() => MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => NoConnectionScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "assets/images/1_No Connection.png",
              fit: BoxFit.cover,
            ),
            InternetLoadingWidget(),
            Positioned(
              bottom: 24,
              left: 54,
              child: Container(
                child: Text('Waiting for connection...',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .copyWith(color: Colors.white54)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InternetLoadingWidget extends StatelessWidget {
  const InternetLoadingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 54,
      left: 54,
      child: CircularProgressIndicator(),
    );
  }
}
