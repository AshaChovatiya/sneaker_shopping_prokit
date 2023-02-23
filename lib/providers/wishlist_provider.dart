import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sneaker_shopping_prokit/model/wishlist_model.dart';
import 'package:sneaker_shopping_prokit/utils/common_snack_bar.dart';

import '../schema/graph_mutation_query.dart';
import '../schema/graph_query.dart';

class WishListProvider extends ChangeNotifier {
  bool _isLoading = true;
  bool _isError = false;
  bool _isDeleting = false;

  bool get isDeleting => _isDeleting;

  set isDeleting(bool value) {
    _isDeleting = value;
    notifyListeners();
  }

  bool get isError => _isError;

  set isError(bool value) {
    _isError = value;
    notifyListeners();
  }

  String _errorMessage = "";

  String get errorMessage => _errorMessage;

  set errorMessage(String value) {
    _errorMessage = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
  WishListData? _wishList;

  WishListData? get wishList => _wishList;

  set wishList(WishListData? value) {
    if (value == null) return;
    _wishList = value;
    notifyListeners();
  }

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getWishList() async {
    isLoading = true;
    isError = false;
    final userId =
        await Amplify.Auth.getCurrentUser().then((value) => value.userId);
    var request = Amplify.API.query(
        request: GraphQLRequest<String>(
      document: GraphQuerySchema.getWishList(userId: userId),
    ));

    var response = await request.response;

    if (response.errors.isEmpty && response.data != null) {
      wishList = WishListData.fromJson(jsonDecode(response.data!));
    } else {
      if (response.errors.isNotEmpty) {
        isError = true;
        errorMessage = response.errors.first.message;
        print("response.errors: ${response.errors}");
      }
      wishList = null;
    }

    print("response.data: ${response.data}");
    print("response.Error: ${response.errors}");

    isLoading = false;
  }

  Future<void> deleteWishList({required String wishListId}) async {
    isDeleting = true;
    var request = Amplify.API.mutate(
        request: GraphQLRequest<String>(
      document: GraphMutationSchema.deleteWishList(wishListId: wishListId),
    ));

    var response = await request.response;

    if (response.errors.isEmpty && response.data != null) {
      await getWishList();
    } else {
      if (response.errors.isNotEmpty) {
        isError = true;
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
