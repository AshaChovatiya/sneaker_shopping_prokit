import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../screen/SSDashBoardScreen.dart';
import '../screen/SSVerifyNumberScreen.dart';
import '../utils/common_snack_bar.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool isUserLoggedIn = false;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> signInUser(
      {String? phoneNumber, String? password, BuildContext? context}) async {
    isLoading = true;
    try {
      final result = await Amplify.Auth.signIn(
        username: '+91' + phoneNumber!,
        password: password!,
      );

      safePrint('data ---------$result');

      isUserLoggedIn = result.isSignedIn;

      if (result.isSignedIn) {
        finish(context!);
        SSDashBoardScreen().launch(context, isNewTask: true);
      } else {
        SSVerifyNumberScreen(
          phoneNumber: '+91' + phoneNumber,
          isSignIn: true,
          destination: result.nextStep?.codeDeliveryDetails?.destination,
        ).launch(context!);
      }

      //TOdo: uncomment this code when you want to verify the number
      // if (result.nextStep?.signInStep == 'CONFIRM_SIGN_IN_WITH_SMS_MFA_CODE') {
      //   finish(context!);
      //   SSVerifyNumberScreen(
      //     isSignIn: true,
      //   ).launch(context);
      // }
      isLoading = false;
      notifyListeners();
    } on AuthException catch (e) {
      isLoading = false;
      safePrint(e.message);
      if (e.message == 'User not confirmed in the system.') {
        final result =
            await Amplify.Auth.resendSignUpCode(username: '+91' + phoneNumber!);
        print("resendSignUpCode result: $result");
        SSVerifyNumberScreen(
          phoneNumber: '+91' + phoneNumber,
          isSignIn: true,
          destination: result.codeDeliveryDetails.destination,
        ).launch(context!);
      } else {
        GlobalSnackBar.show(
            context: context!,
            message: '${e.message}',
            type: SnackBarType.ERROR);
      }
      GlobalSnackBar.show(
          context: context, message: '${e.message}', type: SnackBarType.ERROR);
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
    isLoading = true;
    notifyListeners();
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
      safePrint('data ---------${result}');
      isSignUpComplete = result.isSignUpComplete;
      SSVerifyNumberScreen(
        isSignIn: false,
        destination: result.nextStep.codeDeliveryDetails?.destination,
        phoneNumber: '+91' + phoneNumber.toString(),
      ).launch(context);
      isLoading = false;
      notifyListeners();
    } on AuthException catch (e) {
      isLoading = false;
      safePrint(e.message);
      GlobalSnackBar.show(
          context: context, message: '${e.message}', type: SnackBarType.ERROR);
    }
  }

  Future<void> signOutCurrentUser() async {
    try {
      await Amplify.Auth.signOut();
    } on AuthException catch (e) {
      print(e.message);
    }
  }
}
