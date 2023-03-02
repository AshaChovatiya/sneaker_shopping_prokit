import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:sneaker_shopping_prokit/schema/graph_mutation_query.dart';
import 'package:sneaker_shopping_prokit/screen/SSOrderScreen.dart';

import '../model/order_response_model.dart';
import '../model/user_data.dart';
import '../utils/common_snack_bar.dart';

enum PaymentMethods { PREPAID, COD }

class PaymentProvider extends ChangeNotifier {
  final String testAPIKey = 'rzp_test_k7hZ8Z2J5V6J3x';
  final Razorpay _razorpay = Razorpay();

  PaymentMethods _paymentMethod = PaymentMethods.PREPAID;
  bool _isPaymentLoading = false;
  bool _isError = false;
  final String? shoppingCartId;
  bool get isError => _isError;
  final BuildContext context;

  set isError(bool value) {
    _isError = value;
    notifyListeners();
  }

  bool get isPaymentLoading => _isPaymentLoading;

  set isPaymentLoading(bool value) {
    _isPaymentLoading = value;
    notifyListeners();
  }

  OrderResponseData? _orderResponseData;

  OrderResponseData? get orderResponseData => _orderResponseData;

  set orderResponseData(OrderResponseData? value) {
    _orderResponseData = value;
    notifyListeners();
  }

  final UserData? userData;

  PaymentProvider({
    this.shoppingCartId,
    required this.userData,
    required this.context,
  });

  PaymentMethods get paymentMethod => _paymentMethod;

  set paymentMethod(PaymentMethods value) {
    _paymentMethod = value;
  } // ...

  void initPayment() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  Future<void> pay() async {
    isPaymentLoading = true;

    if (paymentMethod == PaymentMethods.PREPAID) {
      openCheckout();
      return;
    }
    createPayment();
    isPaymentLoading = false;
  }

  Future<void> createPayment() async {
    final double amount =
        (orderResponseData?.createOrder?.totalShippingCharges ?? 0) +
            (orderResponseData?.createOrder?.totalAmount ?? 0);
    final userId =
        await Amplify.Auth.getCurrentUser().then((value) => value.userId);
    var request = Amplify.API.query(
        request: GraphQLRequest<String>(
      document: GraphMutationSchema.createPaymentMutation(
          userId: userId,
          method: paymentMethod == PaymentMethods.PREPAID ? 'ONLINE' : 'COD',
          amount: amount,
          orderId: orderResponseData?.createOrder?.id ?? ''),
    ));
    var response = await request.response;

    if (response.errors.isEmpty && response.data != null) {
      if (shoppingCartId != null) {
        await deleteShoppingCart();
      }
      SSOrderScreen().launch(context);
    } else {
      if (response.errors.isNotEmpty) {
        print(response.errors);
      }
      print('Something went wrong');
      isError = true;
    }
  }

  Future<void> deleteShoppingCart() async {
    var request = Amplify.API.mutate(
        request: GraphQLRequest<String>(
      document: GraphMutationSchema.deleteShoppingCartItem(
          shoppingCartId: shoppingCartId!),
    ));

    var response = await request.response;

    if (response.errors.isEmpty && response.data != null) {
      isError = false;
    } else {
      isError = true;

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
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    _isPaymentLoading = false;
    isError = false;

    await createPayment();
    print('Payment Success');
    print(response.paymentId);
    print(response.orderId);
    print(response.signature);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    _isPaymentLoading = false;
    isError = true;
    print('Payment Error');
    print(response.error);
    print(response.code.toString());
    GlobalSnackBar.show(
        context: navigatorKey.currentContext!,
        message: response.message ?? 'Something went wrong!',
        type: SnackBarType.ERROR);
    print(response.message);
  }

  void _handleExternalWallet(ExternalWalletResponse response) async {
    _isPaymentLoading = false;
    isError = false;
    print('External Wallet');
    print(response.walletName);
    await createPayment();
  }

  void openCheckout() {
    isPaymentLoading = true;
    final double amount =
        (orderResponseData?.createOrder?.totalShippingCharges ?? 0) +
            (orderResponseData?.createOrder?.totalAmount ?? 0);
    var options = {
      'key': kDebugMode ? testAPIKey : 'rzp_live_1Q1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z',
      'amount': amount,
      'name': 'Sneaker Shopping',
      'description': 'Payment for order',
      'prefill': {
        'contact': userData?.getUser?.phone ?? '',
        'email': userData?.getUser?.email ?? ''
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      isPaymentLoading = false;

      debugPrint(e.toString());
    }
  }

  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
}
