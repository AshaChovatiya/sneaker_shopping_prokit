import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../model/UserAddressModel.dart';
import '../schema/graph_query.dart';

class MyShoppingAddressProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
  }

  UserAddressModel? _myAddressModel;

  UserAddressModel? get myAddressModel => _myAddressModel;

  set myAddressModel(UserAddressModel? value) {
    _myAddressModel = value;
    notifyListeners();
  }

  Future<void> getShoppingAddressList() async {
    isLoading = true;
    final userId =
        await Amplify.Auth.getCurrentUser().then((value) => value.userId);
    var request = Amplify.API.query(
        request: GraphQLRequest<String>(
      document: GraphQuerySchema.getUserAddressOrder(userId: userId),
    ));

    var response = await request.response;

    if (response.errors.isEmpty && response.data != null) {
      myAddressModel = UserAddressModel.fromJson(jsonDecode(response.data!));
    } else {
      if (response.errors.isNotEmpty) {
        errorMessage = response.errors.first.message;
        print("response.errors: ${response.errors}");
      }
      myAddressModel = null;
    }
    print("response.data: ${response.data}");
    print("response.Error: ${response.errors}");

    isLoading = false;
  }
}
