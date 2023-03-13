import 'dart:async';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sneaker_shopping_prokit/utils/common_snack_bar.dart';
import '../amplifyconfiguration.dart';

class InitialProvider extends ChangeNotifier {
  bool isUserLoggedIn = false;
  final StreamController<ConnectivityResult> streamController =
      StreamController();
  ConnectionState _connectionState = ConnectionState.waiting;

  ConnectionState get connectionState => _connectionState;

  set connectionState(ConnectionState value) {
    _connectionState = value;
    notifyListeners();
  }

  AuthUser? currentUser;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> checkSignInStatus() async {
    isLoading = true;

    await _configureAmplify();
    final result = await Amplify.Auth.fetchAuthSession();
    isUserLoggedIn = result.isSignedIn;
    if (isUserLoggedIn) {
      currentUser = await Amplify.Auth.getCurrentUser();
      print("user_id: ${currentUser!.userId}");
      print("user_name: ${currentUser!.username}");
    }
    isLoading = false;
  }

  Future<void> _configureAmplify() async {
    final auth = AmplifyAuthCognito();
    final storage = AmplifyStorageS3();
    final api = AmplifyAPI();

    await Amplify.addPlugins([api, auth, storage]);
    // await Amplify.addPlugin(AmplifyAPI(modelProvider: ModelProvider.instance));

    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      print(
          "Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }
  }

  checkInternetAvailability() async {
    Connectivity().onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.none) {
        GlobalSnackBar.show(
            context: navigatorKey.currentContext!,
            type: SnackBarType.ERROR,
            message: "No internet connection");
      }
      /* GlobalSnackBar.show(
          context: navigatorKey.currentContext!,
          message: 'Connection state: $event');*/
      connectionState = event == ConnectivityResult.none
          ? ConnectionState.none
          : ConnectionState.active;
    });
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }
}
