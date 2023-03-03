import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sneaker_shopping_prokit/utils/common_snack_bar.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  String _phone = '';

  bool _isSuccess = false;

  bool get isSuccess => _isSuccess;

  set isSuccess(bool value) {
    _isSuccess = value;
    notifyListeners();
  }

  bool _isLoading = false;

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<bool> sendCodeForForgotPassword() async {
    try {
      ResetPasswordResult result =
          await Amplify.Auth.resetPassword(username: '+91' + phone);

      print(result);
      if (result.nextStep.codeDeliveryDetails?.destination != null) {
        return true;
      }
    } on AmplifyException catch (e) {
      GlobalSnackBar.show(
          context: navigatorKey.currentContext!, message: e.message);
      safePrint(e);
    }

    return false;
  }
}
