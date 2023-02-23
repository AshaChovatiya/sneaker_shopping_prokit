import 'package:amplify_flutter/amplify_flutter.dart';

class GraphMutationSchema {
  static updateUserMutation(Map<String, dynamic> data) {
    return '''mutation MyMutation {
  updateUser(input: $data) {
    id
  }
}''';
  }

  static createWishlistMutation({required String userId}) {
    return '''mutation MyMutation {
  createWishlist(input: {userId: "$userId"}) {
    id
  }
}''';
  }

  static createWishListProductMutation(
      {required String productId,
      required String wishlistId,
      required int quantity}) {
    return '''mutation MyMutation {
  createWishlistProduct(input: {wishlistId: "$wishlistId", quantity: $quantity, productId: "$productId"}) {
    product {
      title
      id
    }
    productId
    quantity
  }
}''';
  }

  static deleteWishList({required String wishListId}) {
    return '''mutation MyMutation {
  deleteWishlist(input: {id: "$wishListId"}) {
    id
  }
}''';
  }
}
