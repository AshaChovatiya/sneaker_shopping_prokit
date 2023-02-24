import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sneaker_shopping_prokit/model/shoppingCartList_model.dart';
import '../schema/graph_mutation_query.dart';
import '../schema/graph_query.dart';
import '../utils/common_snack_bar.dart';

class ShoppingCartProvider extends ChangeNotifier {
  bool _isLoading = false;
  double totalPrice = 0;
  int buyNowQty = 0;
  bool _isDeleting = false;
  bool _isShowCheckOut = false;
  ShoppingcartProductsitems? shoppingCartProductItems;

  bool get isShowCheckOut => _isShowCheckOut;

  set isShowCheckOut(bool value) {
    _isShowCheckOut = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool get isDeleting => _isDeleting;

  set isDeleting(bool value) {
    _isDeleting = value;
    notifyListeners();
  }

  ShoppingCartListModel? _shoppingCart;

  ShoppingCartListModel? get shoppingCart => _shoppingCart;

  set shoppingCart(ShoppingCartListModel? value) {
    if (value == null) return;
    _shoppingCart = value;
    notifyListeners();
  }

  onClickBuyNow(ShoppingcartProductsitems? shoppingCartProductItems) {
    shoppingCartProductItems = shoppingCartProductItems;
    getTotalPrice(shoppingCartProductItem: shoppingCartProductItems);
    buyNowQty = shoppingCartProductItems!.quantity!;
    notifyListeners();
  }

  Future<void> createShoppingCart(
      {required String productId, required int quantity}) async {
    if (isLoading == false) {
      isLoading = true;
    }
    final userId =
        await Amplify.Auth.getCurrentUser().then((value) => value.userId);
    final request = Amplify.API.mutate(
        request: GraphQLRequest<String>(
      document: GraphMutationSchema.createShoppingCartMutation(userID: userId),
    ));
    String? shoppingCartId;
    final response = await request.response;
    if (response.errors.isEmpty && response.data != null) {
      shoppingCartId = jsonDecode(response.data!)['createShoppingCart']['id'];
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
    if (shoppingCartId == null) return;
    await addProductToShoppingCart(
        productId: productId,
        quantity: quantity,
        shoppingCartId: shoppingCartId);
    isLoading = false;
  }

  Future<void> addProductToShoppingCart(
      {required String productId,
      required int quantity,
      required String shoppingCartId}) async {
    final request = Amplify.API.mutate(
        request: GraphQLRequest<String>(
      document: GraphMutationSchema.createShoppingCartToProductMutation(
        productId: productId,
        shoppingCartId: shoppingCartId,
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

  Future<void> getShoppingCartList() async {
    isLoading = true;
    final userId =
        await Amplify.Auth.getCurrentUser().then((value) => value.userId);
    var request = Amplify.API.query(
        request: GraphQLRequest<String>(
      document: GraphQuerySchema.getShoppingCartList(userId: userId),
    ));

    var response = await request.response;

    if (response.errors.isEmpty && response.data != null) {
      shoppingCart = ShoppingCartListModel.fromJson(jsonDecode(response.data!));
    } else {
      if (response.errors.isNotEmpty) {
        errorMessage = response.errors.first.message;
        print("response.errors: ${response.errors}");
      }
      shoppingCart = null;
    }
    print("response.data: ${response.data}");
    print("response.Error: ${response.errors}");

    isLoading = false;
  }

  getTotalPrice({ShoppingcartProductsitems? shoppingCartProductItem}) {
    totalPrice = 0;
      if (shoppingCartProductItem != null) {
        for (var j = 0;
            j < int.parse(shoppingCartProductItem.quantity.toString());
            j++) {
          totalPrice = totalPrice + shoppingCartProductItem.product!.price;
        }
      }

    notifyListeners();
  }

  Future<void> deleteShoppingCart({required String shoppingCartId}) async {
    isDeleting = true;
    var request = Amplify.API.mutate(
        request: GraphQLRequest<String>(
      document: GraphMutationSchema.deleteShoppingCartItem(
          shoppingCartId: shoppingCartId),
    ));

    var response = await request.response;

    if (response.errors.isEmpty && response.data != null) {
      await getShoppingCartList();
    } else {
      if (response.errors.isNotEmpty) {
        errorMessage = response.errors.first.message;
        GlobalSnackBar.show(
            context: navigatorKey.currentContext!,
            message: response.errors.first.message,
            type: SnackBarType.ERROR);
        print("response.errors: ${response.errors}");
      }
    }

    isDeleting = false;
  }
}
