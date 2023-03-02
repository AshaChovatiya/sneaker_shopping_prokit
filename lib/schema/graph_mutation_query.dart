import 'package:amplify_flutter/amplify_flutter.dart';

class GraphMutationSchema {
  static updateUserMutation(Map<String, dynamic> data) {
    return '''mutation MyMutation {
  updateUser(input: $data) {
    id
  }
}''';
  }

  static String createWishlistMutation({required String userId}) {
    return '''mutation MyMutation { createWishlist(input: {userId:"${userId}"}) {  id   } }''';
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

  static deleteUserAddress({required String userAddressId}) {
    return '''mutation MyMutation {
  deleteUserAddress(input: {id: "$userAddressId"}) {
    id
  }
}''';
  }

  static createOrderMutation({required Map<dynamic, dynamic> data}) {
    return '''mutation MyMutation {
  createOrder(input: {paymentType: ${data['paymentType']}, status: ${data['status']}, currency: ${data['currency']}, sla:"${data['sla']}" userId: "${data['userId']}", totalStoreCredit: ${data['totalStoreCredit']}, totalShippingCharges: ${data['totalShippingCharges']}, totalAmount: ${data['totalAmount']}, totalDiscount:  ${data['totalDiscount']}, totalCashOnDeliveryCharges: ${data['totalCashOnDeliveryCharges']}, orderDate: "${data['orderDate']}", couponCodeId: "${data['CouponCodeId']}", billingAddress: {address: "${data['BillingAddress']['address']}", city: "${data['BillingAddress']['city']}", country: ${data['BillingAddress']['country']}, state: ${data['BillingAddress']['state']}, pinCode: "${data['BillingAddress']['pinCode']}", name: "${data['BillingAddress']['name']}", phone:"${data['BillingAddress']['phone']}", email: "${data['BillingAddress']['email']}"}, shippingAddress: {address: "${data['shippingAddress']['address']}", city: "${data['shippingAddress']['city']}", country: ${data['shippingAddress']['country']}, state: ${data['shippingAddress']['state']}, pinCode: "${data['shippingAddress']['pinCode']}", name: "${data['shippingAddress']['name']}", phone:"${data['shippingAddress']['phone']}", email:"${data['shippingAddress']['email']}"}}){
  id
  totalAmount
  totalCashOnDeliveryCharges
  totalDiscount
  totalShippingCharges
  currency
  }
}''';
  }

  static createOrderProductMutation(
      {required String orderId,
      required double price,
      required String productId,
      required int quantity,
      required String sku,
      required String title,
      required double totalPrice}) {
    return '''mutation MyMutation {
  createOrderProduct(input: {orderId: "$orderId", price: $price, totalPrice: $totalPrice productId: "$productId", quantity: $quantity, sku: "$sku",title:"$title"}) {
    orderId
    discount
    cashOnDeliveryCharges
    totalPrice
    shippingCharges
    invoiceNumber
    dispatchDate
    deliveryPartner
    id
  }
}''';
  }

  static createPaymentMutation(
      {required String method,
      required double amount,
      required String orderId,
      required String userId}) {
    return '''mutation MyMutation {
  createPayment(input: {method: $method, amount: $amount, createdAt: "${TemporalDateTime.now()}", orderId: "$orderId", userId: "$userId"}) {
    id
    orderId
    userId
    amount
  }
}''';
  }

  static createReviewMutation(
      {required String images,
      required String email,
      required String name,
      required String comment,
      required String title,
      required String userId,
      required String productId,
      required int rating}) {
    return '''mutation MyMutation {
  createReview(input: {images: "$images", reviewer: {email: "$email", name: "$name"}, comment: "$comment", title: "$title", userId: "$userId", productId: "$productId", rating: $rating})
  {
  id
  }
}''';
  }

  static String deleteReviewMutation({required String reviewId}) {
    return '''mutation MyMutation {
  deleteReview(input: {id: "$reviewId"}) {
    id
  }
}''';
  }
}
