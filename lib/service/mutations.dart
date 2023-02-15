import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:sneaker_shopping_prokit/models/ModelProvider.dart';
import 'package:sneaker_shopping_prokit/models/Wishlist.dart';
import 'package:sneaker_shopping_prokit/models/WishlistProduct.dart';

class AWSMutations {
  static Future<List<WishlistProduct>?> getWishList(
      {required String userId}) async {
    final request = ModelQueries.get(Wishlist.classType, userId);
    final response = await Amplify.API.query(request: request).response;
    print("Error:- ${response.errors}");
    if (response.data != null) {
      return response.data!.wishlistProducts;
    } else {
      return [];
    }
  }

  static Future<bool> addWishList(
      {required String userId,
      required WishlistProduct wishlistProduct}) async {
    try {
      final request = ModelMutations.create(Wishlist(
        userId: userId,
        wishlistProducts: [wishlistProduct],
      ));
      final response = await Amplify.API.query(request: request).response;
      if (response.data != null) {
        safePrint('Mutation result: ${response.data?.wishlistProducts}');
        return true;
      } else {
        safePrint('errors: ${response.errors[0].message}');
        return false;
      }
    } on ApiException catch (e) {
      safePrint('Mutation failed: $e');
      return false;
    }
  }

  static Future<List<ShoppingCartProduct>?> getShoppingCartList(
      {required String userId}) async {
    final request = ModelQueries.get(ShoppingCart.classType, userId);
    final response = await Amplify.API.query(request: request).response;
    if (response.data != null) {
      return response.data!.shoppingcartProducts;
    } else {
      return [];
    }
  }
}
