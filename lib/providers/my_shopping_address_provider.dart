import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../model/UserAddressModel.dart';
import '../schema/graph_mutation_query.dart';
import '../schema/graph_query.dart';
import '../utils/common_snack_bar.dart';

class MyShoppingAddressProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _isDeleting = false;

  bool get isDeleting => _isDeleting;

  set isDeleting(bool value) {
    _isDeleting = value;
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
  }

  UserAddressModel? _myAddressModel;

  UserAddressModel? get myAddressModel => _myAddressModel;

  set myAddressModel(UserAddressModel? value) {
    _myAddressModel = value;
    notifyListeners();
  }

  Future<void> getShoppingAddressList() async {
    isLoading = true;
    final userId =
        await Amplify.Auth.getCurrentUser().then((value) => value.userId);
    var request = Amplify.API.query(
        request: GraphQLRequest<String>(
      document: GraphQuerySchema.getUserAddressOrder(userId: userId),
    ));

    var response = await request.response;

    if (response.errors.isEmpty && response.data != null) {
      myAddressModel = UserAddressModel.fromJson(jsonDecode(response.data!));
    } else {
      if (response.errors.isNotEmpty) {
        errorMessage = response.errors.first.message;
        print("response.errors: ${response.errors}");
      }
      myAddressModel = null;
    }
    print("response.data: ${response.data}");
    print("response.Error: ${response.errors}");

    isLoading = false;
  }

  Future<void> deleteShoppingCart({required String userAddressId}) async {
    isDeleting = true;
    var request = Amplify.API.mutate(
        request: GraphQLRequest<String>(
          document: GraphMutationSchema.deleteUserAddress(
              userAddressId: userAddressId),
        ));

    var response = await request.response;

    if (response.errors.isEmpty && response.data != null) {
      await getShoppingAddressList();
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
