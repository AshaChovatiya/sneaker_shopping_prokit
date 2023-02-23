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
      {required String productId, required String wishlistId}) {
    return '''mutation MyMutation {
  createWishlistProduct(input: {wishlistId: "$wishlistId", productId: "$productId"}) {
    product {
      title
      id
    }
    productId
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


  static createShoppingCartMutation({required String userID}) {
    return '''mutation MyMutation {
  createShoppingCart(input: {userId: "$userID"}) {
    id
  }
}
''';
  }

  static createShoppingCartToProductMutation(
      {required String shoppingCartId,
      required int qty,
      required String productId}) {
    return '''mutation MyMutation {
  createShoppingCartProduct(input: {shoppingcartId: "$shoppingCartId", quantity: $qty, productId: "$productId"}) {
    id
  }
}''';
  }

  static deleteShoppingCartItem({required String shoppingCartId}) {
    return '''mutation MyMutation {
  deleteShoppingCart(input: {id: "$shoppingCartId"}) {
    id
  }
}''';
  }
}
