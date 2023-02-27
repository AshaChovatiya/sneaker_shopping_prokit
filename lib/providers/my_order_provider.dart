import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../model/MyOrderModel.dart';
import '../schema/graph_query.dart';

class MyOrderProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
  }

  MyOrderModel? _myOrderModel;

  MyOrderModel? get myOrderModel => _myOrderModel;

  set myOrderModel(MyOrderModel? value) {
    _myOrderModel = value;
    notifyListeners();
  }

  Future<void> getShoppingCartList() async {
    isLoading = true;
    final userId =
        await Amplify.Auth.getCurrentUser().then((value) => value.userId);
    var request = Amplify.API.query(
        request: GraphQLRequest<String>(
      document: GraphQuerySchema.getMyOrder(userId: userId),
    ));

    var response = await request.response;

    if (response.errors.isEmpty && response.data != null) {
      myOrderModel = MyOrderModel.fromJson(jsonDecode(response.data!));
    } else {
      if (response.errors.isNotEmpty) {
        errorMessage = response.errors.first.message;
        print("response.errors: ${response.errors}");
      }
      myOrderModel = null;
    }
    print("response.data: ${response.data}");
    print("response.Error: ${response.errors}");

    isLoading = false;
  }
}
