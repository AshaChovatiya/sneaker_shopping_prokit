import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sneaker_shopping_prokit/model/order_response_model.dart';
import 'package:sneaker_shopping_prokit/model/user_data.dart';
import 'package:sneaker_shopping_prokit/schema/graph_mutation_query.dart';
import 'package:sneaker_shopping_prokit/schema/graph_query.dart';
import 'package:sneaker_shopping_prokit/utils/common_snack_bar.dart';

import '../model/shoppingCartList_model.dart';
import '../screen/SSPaymentScreen.dart';

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
  bool _isError = false;
  bool _isOrdering = false;
  String _currencySymbol = '\$';

  String get currencySymbol => _currencySymbol;

  set currencySymbol(String value) {
    _currencySymbol = value;
    notifyListeners();
  }

  OrderResponseData? _orderResponseData;

  OrderResponseData? get orderResponseData => _orderResponseData;

  set orderResponseData(OrderResponseData? value) {
    _orderResponseData = value;
    notifyListeners();
  }

  bool get isOrdering => _isOrdering;

  set isOrdering(bool value) {
    _isOrdering = value;
    notifyListeners();
  }

  UserData? _userData;
  late TextEditingController billingFullNameController;
  late TextEditingController billingAddressController;
  late TextEditingController billingCityController;
  late TextEditingController billingPostCodeController;
  late TextEditingController billingCountryController;
  late TextEditingController billingStateController;
  late TextEditingController billingPhoneController;
  late TextEditingController billingEmailController;

  late TextEditingController shippingFullNameController;
  late TextEditingController shippingAddressController;
  late TextEditingController shippingCityController;
  late TextEditingController shippingPostCodeController;
  late TextEditingController shippingCountryController;
  late TextEditingController shippingStateController;
  late TextEditingController shippingPhoneController;
  late TextEditingController shippingEmailController;
  UserData? get userData => _userData;

  set userData(UserData? value) {
    _userData = value;
    notifyListeners();
  }

  bool get isError => _isError;

  set isError(bool value) {
    _isError = value;
    notifyListeners();
  }

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

      billingFullNameController = TextEditingController(
          text: (userData?.getUser?.firstName ?? '') +
              ' ' +
              (userData?.getUser?.lastName ?? ''));

      billingAddressController =
          TextEditingController(text: userData?.getUser?.address ?? '');
      billingCityController =
          TextEditingController(text: userData?.getUser?.city ?? '');
      billingPostCodeController =
          TextEditingController(text: userData?.getUser?.pinCode ?? '');
      billingCountryController =
          TextEditingController(text: userData?.getUser?.country ?? '');
      billingStateController =
          TextEditingController(text: userData?.getUser?.state ?? '');
      billingPhoneController =
          TextEditingController(text: userData?.getUser?.phone ?? '');

      billingEmailController =
          TextEditingController(text: userData?.getUser?.email ?? '');

      shippingFullNameController = TextEditingController();
      shippingAddressController = TextEditingController();
      shippingCityController = TextEditingController();
      shippingPostCodeController = TextEditingController();
      shippingCountryController = TextEditingController();
      shippingStateController = TextEditingController();
      shippingPhoneController = TextEditingController();
      shippingEmailController = TextEditingController();
    } else {
      print(response.errors);
    }
    isLoading = false;
  }

  Future<void> createOrderCart(
      {required Map<dynamic, dynamic> data,
      required double productPrice,
      required int quantity,
      required String productId}) async {
    isError = false;
    isOrdering = true;
    final request = Amplify.API.mutate(
        request: GraphQLRequest<String>(
      document: GraphMutationSchema.createOrderMutation(data: data),
    ));

    final response = await request.response;

    String? createOrderId;

    if (response.errors.isEmpty && response.data != null) {
      createOrderId = jsonDecode(response.data!)['createOrder']['id'];
      orderResponseData =
          OrderResponseData.fromJson(jsonDecode(response.data!));
      currencySymbol = NumberFormat.simpleCurrency(
              name: orderResponseData?.createOrder?.currency?.toUpperCase() ??
                  'INR')
          .currencySymbol;
    } else {
      isError = true;
      isOrdering = false;
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
    if (createOrderId == null) {
      isOrdering = false;
      return;
    }
    await createOrderProduct(
        orderId: createOrderId,
        price: productPrice,
        productId: productId,
        quantity: quantity);
  }

  Future<void> createOrderProduct({
    required String orderId,
    required double price,
    required String productId,
    required int quantity,
  }) async {
    final request = Amplify.API.mutate(
        request: GraphQLRequest<String>(
      document: GraphMutationSchema.createOrderProductMutation(
          productId: productId,
          price: price,
          orderId: orderId,
          quantity: quantity),
    ));

    final response = await request.response;

    if (response.errors.isEmpty && response.data != null) {
      isError = false;
      isOrdering = false;
    } else {
      isError = true;
      isOrdering = false;
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
