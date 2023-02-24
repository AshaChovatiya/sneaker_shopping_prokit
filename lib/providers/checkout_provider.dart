import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sneaker_shopping_prokit/schema/graph_mutation_query.dart';
import 'package:sneaker_shopping_prokit/utils/common_snack_bar.dart';

enum OrderStatus {
  ONHOLD,
  PROCESSING,
  CONFIRMED,
  SHIPPED,
  IN_TRANSIT,
  DELIVERED,
  CANCELLED,
  REFUNDED,
  PENDING
}

class CheckOutProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool _setAsDefaultBillingAddress = false;

  bool get setAsDefaultBillingAddress => _setAsDefaultBillingAddress;

  set setAsDefaultBillingAddress(bool value) {
    _setAsDefaultBillingAddress = value;
    notifyListeners();
  }

  Future<void> createOrderCart({required Map<dynamic, dynamic> data}) async {
    final request = Amplify.API.mutate(
        request: GraphQLRequest<String>(
      document: GraphMutationSchema.createOrderMutation(data: data),
    ));

    final response = await request.response;

    String? createOrderId;

    if (response.errors.isEmpty && response.data != null) {
      createOrderId = jsonDecode(response.data!)['createOrder']['id'];
    } else {
      if (response.errors.isNotEmpty) {
        isLoading = false;
        errorMessage = response.errors.first.message;
        GlobalSnackBar.show(
            context: navigatorKey.currentContext!,
            message: errorMessage,
            type: SnackBarType.ERROR);
        print(response.errors);
      }
      GlobalSnackBar.show(
          context: navigatorKey.currentContext!,
          message: 'Something went wrong!',
          type: SnackBarType.ERROR);
      return;
    }
    if (createOrderId == null) return;
  }

  /// InProgress----
  Future<void> createOrderProduct(
      {required String productId,
        required int quantity,
        required int price,
        required String orderId}) async {
    final request = Amplify.API.mutate(
        request: GraphQLRequest<String>(
          document: GraphMutationSchema.createShoppingCartToProductMutation(
            productId: productId,
            shoppingCartId: orderId,
            qty: quantity,
          ),
        ));

    final response = await request.response;

    if (response.errors.isEmpty && response.data != null) {
      GlobalSnackBar.show(
          context: navigatorKey.currentContext!,
          message: 'Added Successfully to ShoppingCart',
          type: SnackBarType.SUCCESS);
    } else {
      if (response.errors.isNotEmpty) {
        errorMessage = response.errors.first.message;
        GlobalSnackBar.show(
            context: navigatorKey.currentContext!,
            message: errorMessage,
            type: SnackBarType.ERROR);
        print(response.errors);
      }
      GlobalSnackBar.show(
          context: navigatorKey.currentContext!,
          message: 'Something went wrong!',
          type: SnackBarType.ERROR);
    }
  }
}
