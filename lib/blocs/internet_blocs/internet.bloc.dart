import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'internet.event.dart';
import 'internet.state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  Connectivity connectivity = Connectivity();
  StreamSubscription? connectivityStreamSubscription;

  InternetBloc() : super(InternetLoadingState()) {
    on<InternetGainedEvent>((event, emit) => emit(InternetConnectedState()));
    on<InternetLostEvent>((event, emit) => emit(InternetDisconnectedState()));

    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.wifi ||
          event == ConnectivityResult.mobile) {
        add(InternetGainedEvent());
      } else if (event == ConnectivityResult.none) {
        add(InternetLostEvent());
      }
    });
  }

  @override
  Future<void> close() {
    connectivityStreamSubscription?.cancel();
    return super.close();
  }
}
