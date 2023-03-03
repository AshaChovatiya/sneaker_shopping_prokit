import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../model/MyOrderModel.dart';
import '../schema/graph_query.dart';
import 'checkout_provider.dart';

class MyOrderProvider extends ChangeNotifier {
  int _confirmOrder = 0;

  int _shippedOrder = 0;

  int _onHoldOrder = 0;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  int get onHoldOrder => _onHoldOrder;

  int get shippedOrder => _shippedOrder;

  int get confirmOrder => _confirmOrder;

  set shippedOrder(int value) {
    _shippedOrder = value;
    notifyListeners();
  }

  set onHoldOrder(int value) {
    _onHoldOrder = value;
    notifyListeners();
  }

  set confirmOrder(int value) {
    _confirmOrder = value;
    notifyListeners();
  }

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
      for (var orderList in myOrderModel!.listOrders!.items!) {
        if (orderList.status == OrderStatus.CONFIRMED.name) {
          confirmOrder = confirmOrder + 1;
        } else if (orderList.status == OrderStatus.SHIPPED.name) {
          shippedOrder = shippedOrder + 1;
        } else if (orderList.status == OrderStatus.ONHOLD.name) {
          onHoldOrder = onHoldOrder + 1;
        }
      }
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
