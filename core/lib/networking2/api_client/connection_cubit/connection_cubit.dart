import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/widgets.dart';

part 'connection_state.dart';

class ConnectionCubit extends Cubit<InternetConnectionState> {
  ConnectionCubit() : super(ConnectionFail());
  bool? connected;
  Stream<ConnectivityResult> connection = ConnectivityCheck.connectionStream;
  checkConnection() {
    connection.listen((event) {
      debugPrint('event ${event.toString()}');
      event == ConnectivityResult.none ? emit(ConnectionFail()) : emit(ConnectionSuccess());
      connected = event != ConnectivityResult.none;
    });
    debugPrint('connected ===== :::$connected');
  }
}



//
// import 'dart:async';
//
// import 'package:bloc/bloc.dart';
// import 'package:core/core.dart';
// import 'package:dependencies/dependencies.dart';
// import 'package:flutter/widgets.dart';
//
// part 'connection_state.dart';
//
// class ConnectionCubit extends Cubit<InternetConnectionState> {
//   late StreamSubscription<ConnectivityResult> connectionSubscription;
//   bool? connected;
//
//   ConnectionCubit() : super(ConnectionFail()) {
//     connectionSubscription = ConnectivityCheck.connectionStream.listen((event) {
//       _handleConnectionChange(event);
//     });
//   }
//
//   void _handleConnectionChange(ConnectivityResult event) {
//     debugPrint('event ${event.toString()}');
//     if (event == ConnectivityResult.none) {
//       emit(ConnectionFail());
//       connected = false;
//     } else {
//       emit(ConnectionSuccess());
//       connected = true;
//     }
//     debugPrint('connected ===== :::$connected');
//   }
//
//   @override
//   Future<void> close() {
//     connectionSubscription.cancel();
//     return super.close();
//   }
// }
