import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:meta/meta.dart';
import 'package:techexcel/config/config_export.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  StreamSubscription internetStreamSubscription;
  InternetCubit({@required this.connectivity}) : super(InternetLoading()) {
    monitorInternetSubscription();
  }

  StreamSubscription<ConnectivityResult> monitorInternetSubscription() {
    return internetStreamSubscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile) {
        emitInternetConnected(ConnectionType.Mobile);
      } else if (result == ConnectivityResult.wifi) {
        emitInternetConnected(ConnectionType.Wifi);
      } else if (result == ConnectivityResult.none) {
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnected(ConnectionType type) => emit(InternetConnected(
        connectionType: type,
      ));

  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    internetStreamSubscription?.cancel();
    return super.close();
  }
}
