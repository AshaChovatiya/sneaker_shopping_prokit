import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:sneaker_shopping_prokit/model/user_data.dart';

import '../schema/graph_query.dart';

class ProfileProvider extends ChangeNotifier {
  bool _isLoading = false;
  late UserData _userData;

  UserData get userData => _userData;

  set userData(UserData value) {
    _userData = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getUserData() async {
    isLoading = true;
    final userId =
        await Amplify.Auth.getCurrentUser().then((value) => value.userId);

    var request = Amplify.API.query(
        request: GraphQLRequest<String>(
      document: GraphQuerySchema.getUserDetails(userId),
    ));
    var response = await request.response;

    if (response.data != null) {
      userData = UserData.fromJson(jsonDecode(response.data!));
    } else {
      print(response.errors);
    }
    isLoading = false;
  }
}
