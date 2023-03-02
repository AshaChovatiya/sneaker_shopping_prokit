import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sneaker_shopping_prokit/utils/common_snack_bar.dart';

import '../schema/graph_mutation_query.dart';

class AddCartProvider extends ChangeNotifier {
  int _increment = 1;
  bool _isLoading = false;
  bool _isError = false;
  String _errorMessage = 'Something went wrong';

  String get errorMessage => _errorMessage;

  set errorMessage(String value) {
    _errorMessage = value;
    notifyListeners();
  }

  bool get isError => _isError;

  set isError(bool value) {
    _isError = value;
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  int get increment => _increment;

  set increment(int value) {
    _increment = value;
    notifyListeners();
  }

  Future<String?> addToCart(
      {required String productId, required int quantity}) async {
    isError = false;
    isLoading = true;
    final String userId =
        await Amplify.Auth.getCurrentUser().then((value) => value.userId);

    final request = Amplify.API.mutate(
        request: GraphQLRequest<String>(
      document: GraphMutationSchema.createWishlistMutation(userId: userId),
    ));

    final response = await request.response;
    String? wishlistId;

    if (response.errors.isEmpty && response.data != null) {
      wishlistId = jsonDecode(response.data!)['createWishlist']['id'];
    } else {
      if (response.errors.isNotEmpty) {
        isError = true;
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
      return null;
    }
    if (wishlistId == null) return null;
    await addProductToCart(
        productId: productId, quantity: quantity, wishlistId: wishlistId);
    isLoading = false;
    return wishlistId;
  }

  Future<void> addProductToCart(
      {required String productId,
      required int quantity,
      required String wishlistId}) async {
    final request = Amplify.API.mutate(
        request: GraphQLRequest<String>(
      document: GraphMutationSchema.createWishListProductMutation(
        productId: productId,
        wishlistId: wishlistId,
      ),
    ));

    final response = await request.response;

    if (response.errors.isEmpty && response.data != null) {
      GlobalSnackBar.show(
          context: navigatorKey.currentContext!,
          message: 'Added Successfully to Cart',
          type: SnackBarType.SUCCESS);
    } else {
      if (response.errors.isNotEmpty) {
        isError = true;
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
