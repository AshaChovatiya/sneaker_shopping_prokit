import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import '../amplifyconfiguration.dart';
import '../models/ModelProvider.dart';

class InitialProvider extends ChangeNotifier {
  bool isUserLoggedIn = false;

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
      print("user_id: ${currentUser!.username}");
    }
    isLoading = false;
  }

  Future<void> _configureAmplify() async {
    final auth = AmplifyAuthCognito();
    final dataStore = AmplifyDataStore(
        modelProvider: ModelProvider.instance,
        authModeStrategy: AuthModeStrategy.multiAuth);
    final api = AmplifyAPI(modelProvider: ModelProvider.instance);

    await Amplify.addPlugins([api, auth, dataStore]);
    // await Amplify.addPlugin(AmplifyAPI(modelProvider: ModelProvider.instance));

    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      print(
          "Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }
  }
}
