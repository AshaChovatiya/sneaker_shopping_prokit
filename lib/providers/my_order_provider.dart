import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sneaker_shopping_prokit/models/ModelProvider.dart';

import '../model/MyOrderModel.dart';
import '../schema/graph_query.dart';

class MyOrderProvider extends ChangeNotifier {
  int _processingOrder = 0;

  int _shippedOrder = 0;

  int _onHoldOrder = 0;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  int get onHoldOrder => _onHoldOrder;

  int get shippedOrder => _shippedOrder;

  int get processingOrder => _processingOrder;

  set shippedOrder(int value) {
    _shippedOrder = value;
    notifyListeners();
  }

  set onHoldOrder(int value) {
    _onHoldOrder = value;
    notifyListeners();
  }

  set processingOrder(int value) {
    _processingOrder = value;
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
        if (orderList.status == OrderStatus.PROCESSING.name) {
          processingOrder = processingOrder + 1;
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
    notifyListeners();
  }
}
