import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sneaker_shopping_prokit/models/ModelProvider.dart';
import 'package:sneaker_shopping_prokit/schema/graph_mutation_query.dart';
import 'package:sneaker_shopping_prokit/schema/graph_query.dart';

import '../model/order_response_model.dart';
import '../utils/common_snack_bar.dart';

enum PaymentMethods { ONLINE, COD }

class PaymentProvider extends ChangeNotifier {
  PaymentMethods _paymentMethod = PaymentMethods.ONLINE;
  bool _isPaymentLoading = false;
  bool _isError = false;

  bool get isError => _isError;

  set isError(bool value) {
    _isError = value;
    notifyListeners();
  }

  bool get isPaymentLoading => _isPaymentLoading;

  set isPaymentLoading(bool value) {
    _isPaymentLoading = value;
    notifyListeners();
  }

  final OrderResponseData orderResponseData;

  PaymentProvider({
    required this.orderResponseData,
  });

  PaymentMethods get paymentMethod => _paymentMethod;

  set paymentMethod(PaymentMethods value) {
    _paymentMethod = value;
  } // ...

  Future<void> pay() async {
    isPaymentLoading = true;

    final userId =
        await Amplify.Auth.getCurrentUser().then((value) => value.userId);
    var request = Amplify.API.query(
        request: GraphQLRequest<String>(
      document: GraphMutationSchema.createPaymentMutation(
          userId: userId,
          method: paymentMethod == PaymentMethods.ONLINE ? 'ONLINE' : 'COD',
          amount: (orderResponseData.createOrder?.totalShippingCharges ?? 0) +
              (orderResponseData.createOrder?.totalAmount ?? 0),
          orderId: orderResponseData.createOrder?.id ?? ''),
    ));
    var response = await request.response;

    if (response.errors.isEmpty && response.data != null) {
      await updateOrderStatus(orderId: orderResponseData.createOrder!.id!);
    } else {
      if (response.errors.isNotEmpty) {
        print(response.errors);
      }
      print('Something went wrong');
      isError = true;
    }

    isPaymentLoading = false;
  }

  Future<void> updateOrderStatus({
    required String orderId,
  }) async {
    final request = Amplify.API.mutate(
        request: GraphQLRequest<String>(
      document: GraphMutationSchema.updateOrderMutation(
          orderId: orderId, status: OrderStatus.PROCESSING.name),
    ));

    final response = await request.response;
    if (response.errors.isEmpty && response.data != null) {
      isError = false;
    } else {
      isError = true;
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
