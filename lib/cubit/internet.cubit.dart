import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

enum InternetStatus { connected, disconnected, loading }

class InternetCubit extends Cubit<InternetStatus> {
  Connectivity connectivity = Connectivity();
  StreamSubscription? connectivityStreamSubscription;
  InternetCubit() : super(InternetStatus.loading) {
    monitorInternetConnection();
  }

  void monitorInternetConnection() {
    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.wifi ||
          event == ConnectivityResult.mobile) {
        emit(InternetStatus.connected);
      } else if (event == ConnectivityResult.none) {
        emit(InternetStatus.disconnected);
      }
    });
  }

  @override
  Future<void> close() {
    connectivityStreamSubscription?.cancel();
    return super.close();
  }
}
