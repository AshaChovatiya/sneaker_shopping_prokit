import 'dart:convert';
import 'dart:io';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:sneaker_shopping_prokit/schema/graph_mutation_query.dart';
import 'package:sneaker_shopping_prokit/screen/SSOrderScreen.dart';
import '../model/get_zipCode.dart';
import '../model/order_response_model.dart';
import '../model/user_data.dart';
import '../schema/graph_query.dart';
import '../utils/SSConstants.dart';
import '../utils/common_snack_bar.dart';

enum PaymentMethods { PREPAID, COD }

class PaymentProvider extends ChangeNotifier {
  final String testAPIKey = 'rzp_test_k7hZ8Z2J5V6J3x';
  final String testAPIKeySecret = 'PMCMOC4tXtV14TDyDVh9g706';
  final Razorpay _razorpay = Razorpay();
  String? transactionOrderId = '';
  String? createPaymentId = '';

  PaymentMethods _paymentMethod = PaymentMethods.PREPAID;
  bool _isPaymentLoading = false;
  bool _isError = false;
  bool _isPrepaidCode = false;

  bool get isPrepaidCode => _isPrepaidCode;

  set isPrepaidCode(bool value) {
    _isPrepaidCode = value;
    notifyListeners();
  }

  bool _isCodZipCode = false;

  bool get isCodZipCode => _isCodZipCode;

  set isCodZipCode(bool value) {
    _isCodZipCode = value;
    notifyListeners();
  }

  final String? shoppingCartId;

  double price = 0.0;
  String productId = '';
  String _rzrPayPaymentId = '';

  String get rzrPayPaymentId => _rzrPayPaymentId;

  set rzrPayPaymentId(String value) {
    _rzrPayPaymentId = value;
    notifyListeners();
  }

  String _rzrPayOrderId = '';

  String get rzrPayOrderId => _rzrPayOrderId;

  set rzrPayOrderId(String value) {
    _rzrPayOrderId = value;
    notifyListeners();
  }

  int quantity = 0;
  String title = '';
  String sku = '';
  double totalPrice = 0.0;

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

  Future<void> pay({
    required double price,
    required String productId,
    required int quantity,
    required String title,
    required String sku,
    required double totalPrice,
  }) async {
    this.price = price;
    this.productId = productId;
    this.quantity = quantity;
    this.title = title;
    this.sku = sku;
    this.totalPrice = totalPrice;

    notifyListeners();
    isPaymentLoading = true;

    if (paymentMethod == PaymentMethods.PREPAID) {
      createPayment().then((value) => openCheckout());
    }else{
      createPayment();
    }

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
      createPaymentId = json.decode(response.data!)['createPayment']['id'];
      if (shoppingCartId != null) {
        await deleteShoppingCart();
      }
      await createOrderProduct(
          orderId: orderResponseData?.createOrder?.id ?? '',
          price: price,
          productId: productId,
          quantity: quantity,
          totalPrice: totalPrice,
          title: title,
          sku: sku);
      if (paymentMethod == PaymentMethods.PREPAID) {
        await createTransaction(
            orderId: orderResponseData?.createOrder?.id ?? '');
      }
      // SSOrderScreen(rzrPayOrderId: rzrPayOrderId,rzrPayPaymentId: rzrPayPaymentId,).launch(context);
      if (paymentMethod != PaymentMethods.PREPAID) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SSOrderScreen(
                      rzrPayPaymentId: rzrPayPaymentId,
                      orderId: orderResponseData!.createOrder!.id,
                    )));
      }
    } else {
      if (response.errors.isNotEmpty) {
        print(response.errors);
      }
      print('Something went wrong');
      isError = true;
    }
  }

  /// Start Order Process ----
  ///
  Future<void> createOrderProduct({
    required String orderId,
    required double price,
    required String productId,
    required int quantity,
    required String title,
    required String sku,
    required double totalPrice,
  }) async {
    final request = Amplify.API.mutate(
        request: GraphQLRequest<String>(
      document: GraphMutationSchema.createOrderProductMutation(
        productId: productId,
        price: price,
        orderId: orderId,
        quantity: quantity,
        sku: sku,
        title: title,
        totalPrice: totalPrice,
      ),
    ));

    final response = await request.response;

    if (response.errors.isEmpty && response.data != null) {
      isError = false;
    } else {
      isError = true;
      deleteOrder(orderId);
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

  Future<void> deleteOrder(String orderId) async {
    final request = Amplify.API.mutate(
        request: GraphQLRequest<String>(
      document: GraphMutationSchema.deleteOrder(orderId: orderId),
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

  /// End Order Process ----
  ///

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

  Future<void> createTransaction({required String orderId}) async {
    var request = Amplify.API.mutate(
        request: GraphQLRequest<String>(
      document: GraphMutationSchema.createTransaction(orderId: orderId),
    ));

    var response = await request.response;

    if (response.errors.isEmpty && response.data != null) {
      transactionOrderId =
          json.decode(response.data!)['createTransaction']['orderId'];
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

    print('Payment Success');
    print(response.paymentId);
    print(response.orderId);
    print(response.signature);
    rzrPayOrderId = response.orderId ?? '';
    rzrPayPaymentId = response.paymentId ?? '';
    if (paymentMethod == PaymentMethods.PREPAID) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SSOrderScreen(
                    rzrPayPaymentId: rzrPayPaymentId,
                    orderId: orderResponseData!.createOrder!.id,
                  )));
    }
    // await createPayment();
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
    // await createPayment();
  }

/*  void openCheckout() async {
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
  }*/

  Future<void> openCheckout() async {
    isPaymentLoading = true;
    final double amount =
        (orderResponseData?.createOrder?.totalShippingCharges ?? 0) +
            (orderResponseData?.createOrder?.totalAmount ?? 0);
    var orderOptions = {
      'amount': amount, // amount in the smallest currency unit
      'currency': "INR",
    };
    final client = HttpClient();
    final request =
        await client.postUrl(Uri.parse('https://api.razorpay.com/v1/orders'));
    request.headers
        .set(HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");
    String basicAuth = 'Basic ' +
        base64Encode(utf8.encode(
            '${kDebugMode ? testAPIKey : 'rzp_live_1Q1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z'}:$testAPIKeySecret'));
    request.headers.set(HttpHeaders.authorizationHeader, basicAuth);
    request.add(utf8.encode(json.encode(orderOptions)));
    final response = await request.close();
    response.transform(utf8.decoder).listen((contents) {
      print('ORDERID' + contents);
      String orderId = contents.split(',')[0].split(":")[1];
      orderId = orderId.substring(1, orderId.length - 1);
      Fluttertoast.showToast(
          msg: "ORDERID: " + orderId, toastLength: Toast.LENGTH_SHORT);
      Map<String, dynamic> checkoutOptions = {
        'key': kDebugMode ? testAPIKey : 'rzp_live_1Q1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z1Z',
        'amount': amount,
        'order_id': transactionOrderId,
        'currency': "INR",
        'name': 'Sneaker Shopping',
        'description': 'Payment for order',
        'image': imagePlaceHolder,
        'prefill': {
          'contact': userData?.getUser?.phone ?? '',
          'email': userData?.getUser?.email ?? '',
          'name': userData?.getUser?.firstName ?? ''
        },
       /* 'notes': [
          storeID,
          orderResponseData?.createOrder?.id ?? '',
          createPaymentId
        ],*/
        'notes': {
          'storeId': storeID,
          'orderId': orderResponseData?.createOrder?.id ?? '',
          'paymentId': createPaymentId
        },
        'theme': {
          'color': "#3399cc",
        },
      };
      try {
        _razorpay.open(checkoutOptions);
      } catch (e) {
        isPaymentLoading = false;
        debugPrint(e.toString());
      }
    });
  }

  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  Future validateZipCode({required String zipCode}) async {
    GetZipCodeModel getZipCodeModel = GetZipCodeModel();
    var request = Amplify.API.query(
        request: GraphQLRequest<String>(
      document: GraphQuerySchema.getZipCode(zipCode: zipCode),
    ));
    var response = await request.response;

    if (response.errors.isEmpty && response.data != null) {
      isError = false;
      if (response.data != null) {
        getZipCodeModel = GetZipCodeModel.fromJson(jsonDecode(response.data!));
        isCodZipCode = getZipCodeModel.getZipCode?.cod ?? false;
        isPrepaidCode = getZipCodeModel.getZipCode?.prepaid ?? false;
      } else {
        GlobalSnackBar.show(
            context: navigatorKey.currentContext!,
            message: 'Post Code Not Valid',
            type: SnackBarType.ERROR);
      }
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

    notifyListeners();
  }
}
