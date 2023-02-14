import 'package:amplify_api/model_mutations.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/User.dart';
import '../screen/SSDashBoardScreen.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool isUserLoggedIn = false;
  bool isLoading = false;

  Future<void> signInUser(
      {String? phoneNumber, String? password, BuildContext? context}) async {
    isLoading = true;
    signOutCurrentUser();
    signUpUserServer();
    try {
      final result = await Amplify.Auth.signIn(
        username: '+91' + phoneNumber!,
        password: password!,
      );
      safePrint('data ---------$result');
      isUserLoggedIn = result.isSignedIn;
      if (result.isSignedIn == true) {
        finish(context!);
        SSDashBoardScreen().launch(context);
      }
      isLoading = false;
      notifyListeners();
    } on AuthException catch (e) {
      isLoading = false;
      safePrint(e.message);
      notifyListeners();
    }
  }

  bool isSignUpComplete = false;

  Future<void> signUpUser(
      {String? password,
      String? name,
      String? middleName,
      String? nickName,
      String? email,
      String? phoneNumber,
      required BuildContext context}) async {
    try {
      final userAttributes = <CognitoUserAttributeKey, String>{
        CognitoUserAttributeKey.name: name.toString(),
        CognitoUserAttributeKey.middleName: middleName.toString(),
        CognitoUserAttributeKey.givenName: nickName.toString(),
        CognitoUserAttributeKey.email: email.toString(),
        CognitoUserAttributeKey.phoneNumber: '+91' + phoneNumber.toString(),
      };
      final result = await Amplify.Auth.signUp(
        username: '+91' + phoneNumber.toString(),
        password: password!,
        options: CognitoSignUpOptions(userAttributes: userAttributes),
      );
      safePrint('data ---------$result');
      isSignUpComplete = result.isSignUpComplete;
      notifyListeners();
    } on AuthException catch (e) {
      safePrint(e.message);
    }
  }

  signUpUserServer() async {
    try {
      final todo = User(
        firstName: 'name',
        email: 'test@gmail.com',
        lastName: 'lastName',
        phone: '1234567890',
      );

      final request = ModelMutations.create<User>(todo);
      final response = await Amplify.API.mutate(request: request).response;

      print("ProductItemData:------- $response");
    } catch (e) {
      print("ProductItemData:------- $e");
    }

    notifyListeners();
  }

  Future<void> signOutCurrentUser() async {
    try {
      await Amplify.Auth.signOut();
    } on AuthException catch (e) {
      print(e.message);
    }
  }
}
