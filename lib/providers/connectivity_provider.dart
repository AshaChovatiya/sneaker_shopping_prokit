import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';

class ConnectivityNotifier extends ChangeNotifier {
  ConnectionState _connectionState = ConnectionState.waiting;

  ConnectionState get connectionState => _connectionState;

  set connectionState(ConnectionState value) {
    _connectionState = value;
    notifyListeners();
  }

  checkInternetConnectivity() {
    Connectivity().checkConnectivity().then((value) {
      if (ConnectivityResult.none == value) {
        connectionState = ConnectionState.none;
      } else {
        connectionState = ConnectionState.active;
      }
    });

    /// I will come for half daya and you can cut my salary rest half day

    Connectivity().onConnectivityChanged.listen((event) {
      print("Connection state: $event");
      if (ConnectivityResult.none == event) {
        connectionState = ConnectionState.none;
      } else {
        connectionState = ConnectionState.active;
      }
    });
  }
}
