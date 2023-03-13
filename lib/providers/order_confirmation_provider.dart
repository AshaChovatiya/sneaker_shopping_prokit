import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sneaker_shopping_prokit/providers/checkout_provider.dart';

import '../schema/graph_mutation_query.dart';
import '../utils/common_snack_bar.dart';

class OrderConfirmationProvider extends ChangeNotifier {
  bool _isError = false;
  bool _isValidTransaction = false;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    // notifyListeners();
  }

  bool get isValidTransaction => _isValidTransaction;

  set isValidTransaction(bool value) {
    _isValidTransaction = value;
    // notifyListeners();
  }

  bool get isError => _isError;

  set isError(bool value) {
    _isError = value;
    notifyListeners();
  }

  validTransaction({required rzrPaymentId, required orderId}) async {
    isLoading = true;
    Future.delayed(const Duration(seconds: 5), () async {
      var request = Amplify.API.mutate(
          request: GraphQLRequest<String>(
        document: GraphMutationSchema.validTransaction(
            rzrOrderId: orderId, rzrPaymentId: rzrPaymentId),
      ));

      var response = await request.response;

      if (response.errors.isEmpty && response.data != null) {
        isError = false;
        isValidTransaction =
            jsonDecode(response.data!)['validateTransaction']['success'];
        if (isValidTransaction) {
          updateOrderStatus(orderId: orderId);
        } else {
          isLoading = false;
        }
        print(response.data);
      } else {
        isError = true;
        isLoading = false;
        if (response.errors.isNotEmpty) {
          final String errorMessage = response.errors.first.message;
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
    });
  }

  Future<void> updateOrderStatus({
    required String orderId,
  }) async {
    final request = Amplify.API.mutate(
        request: GraphQLRequest<String>(
      document: GraphMutationSchema.updateOrderMutation(
          orderId: orderId, status: OrderStatus.CONFIRMED.name),
    ));

    final response = await request.response;

    if (response.errors.isEmpty && response.data != null) {
      isLoading = false;
      GlobalSnackBar.show(
          context: navigatorKey.currentContext!,
          message: 'Your Order is Successfully Confirm',
          type: SnackBarType.SUCCESS);
    } else {
      isLoading = false;
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
