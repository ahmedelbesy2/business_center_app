import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

abstract class ConnectivityCheck {
  static Future<bool> call() async {
    final connectivity = Connectivity();
    var connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }

  static Stream<ConnectivityResult> get connectionStream {
    final connectivity = Connectivity();
    return connectivity.onConnectivityChanged;
  }
}
