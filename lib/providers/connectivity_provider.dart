import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';

class ConnectivityNotifier extends ChangeNotifier {
  ConnectionState _connectionState = ConnectionState.waiting;
  final StreamController<ConnectivityResult> streamController =
      StreamController();

  ConnectionState get connectionState => _connectionState;

  set connectionState(ConnectionState value) {
    _connectionState = value;
    notifyListeners();
  }

  checkInternetConnectivity() async {
    Connectivity().onConnectivityChanged.listen((event) {
      print("Connection state: $event");
      streamController.add(event);
    });
  }
}
