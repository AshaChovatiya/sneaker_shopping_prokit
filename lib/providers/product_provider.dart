import 'dart:convert';

import 'package:amplify_api/model_queries.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sneaker_shopping_prokit/model/ImageModel.dart';
import 'package:sneaker_shopping_prokit/model/ListProductCategoryModel.dart';
import 'package:sneaker_shopping_prokit/schema/graph_mutation_query.dart';

import '../model/ProductListModel.dart';
import '../schema/graph_query.dart';
import '../utils/common_snack_bar.dart';

class ProductProvider extends ChangeNotifier {
  ProductListModel? productList = ProductListModel();
  ProductListModel? newArrivals = ProductListModel();
  List<Items>? _productDetail = [];
  List<String> _wishListedProducts = [];
  List<String> _wishListedIds = [];

  List<String> get wishListedIds => _wishListedIds;

  set wishListedIds(List<String> value) {
    _wishListedIds = value;
    notifyListeners();
  }

  addWishListedIds(String value) {
    _wishListedIds.add(value);
    notifyListeners();
  }

  addWishListedProducts(String value) {
    _wishListedProducts.add(value);
    notifyListeners();
  }

  List<String> get wishListedProducts => _wishListedProducts;

  set wishListedProducts(List<String> value) {
    _wishListedProducts = value;
    notifyListeners();
  }

  bool _isPagination = false;

  bool get isPagination => _isPagination;

  set isPagination(bool value) {
    _isPagination = value;
  }

  List<Items>? get productDetail => _productDetail;

  bool _isCompleted = false;

  bool get isCompleted => _isCompleted;

  set isCompleted(bool value) {
    _isCompleted = value;
    notifyListeners();
  }

  set productDetail(List<Items>? value) {
    if (value == null) return;
    _productDetail?.addAll(value);
    notifyListeners();
  }

  List<Items> categoryList = [];
  Items? productDataModel;
  bool productDetailLoading = false;
  bool homeLoading = false;

  Future<void> getData({bool isScroll = false}) async {
    if (isScroll == false) {
      isCompleted = false;
    }
    if (isPagination || isCompleted) {
      return;
    }
    if (isScroll) {
      isPagination = true;
      homeLoading = false;
    } else {
      isPagination = false;
      homeLoading = true;
    }
    notifyListeners();

    final userId =
        await Amplify.Auth.getCurrentUser().then((value) => value.userId);
    if (isScroll == false) {
      var request = Amplify.API.query(
          request: GraphQLRequest<String>(
        document: GraphQuerySchema.getWishlistProductId(userId: userId),
      ));
      var response = await request.response;

      if (response.data != null) {
        try {
          if (jsonDecode(response.data!)['listWishlists']['items'].length !=
              0) {
            wishListedProducts = List<String>.from(
                jsonDecode(response.data!)['listWishlists']['items'].map(
                    (e) => e['wishlistProducts']['items'][0]['productId']));
            wishListedIds = List<String>.from(
                jsonDecode(response.data!)['listWishlists']['items']
                    .map((e) => e['id']));
          }
        } catch (e) {
          print(e);
        }
      }

      print("response.data of WishList! ${response.data!}");
    }
    try {
      var request = Amplify.API.query(
          request: GraphQLRequest<String>(
        document: GraphQuerySchema.listProduct(
            nextToken: productList?.listProducts?.nextToken ?? null),
      ));
      var response = await request.response;
      productList =
          ProductListModel.fromJson(jsonDecode(response.data!)['listProducts']);
      if (isScroll == false) {
        newArrivals = ProductListModel();
        _productDetail = [];
        productDetail = productList!.listProducts!.items;

        if (productList!.listProducts != null)
          for (var j = 0; j < productList!.listProducts!.items!.length; j++) {
            if (productList!.listProducts!.items![j].isFeatured == true) {
              newArrivals!.listProducts!.items!
                  .add(productList!.listProducts!.items![j]);
            }
          }
      } else {
        productDetail = productList!.listProducts!.items;
      }
      if (productList!.listProducts!.nextToken == null) {
        isCompleted = true;
      }

      isPagination = false;
      homeLoading = false;
    } catch (e) {
      homeLoading = false;
      print("Error in HomeScreen:- $e");
    }
    notifyListeners();
  }

  Future<void> deleteWishList({required String wishListId}) async {
    int wishList =
        wishListedProducts.indexWhere((element) => wishListId == element);
    print("Length of wishListedProducts:- ${wishListedProducts.length}");
    print("Length of wishListed:- ${wishListedIds.length}");
    print("wishListed:- ${wishList}");

    if (wishList != -1) {
      var request = Amplify.API.mutate(
          request: GraphQLRequest<String>(
        document: GraphMutationSchema.deleteWishList(
            wishListId: _wishListedIds[wishList]),
      ));

      var response = await request.response;

      if (response.errors.isEmpty && response.data != null) {
        // getData();
      } else {
        if (response.errors.isNotEmpty) {
          GlobalSnackBar.show(
              context: navigatorKey.currentContext!,
              message: response.errors.first.message,
              type: SnackBarType.ERROR);
          print("response.errors: ${response.errors}");
        }
      }
      _wishListedProducts.removeAt(wishList);
      _wishListedIds.removeAt(wishList);
      notifyListeners();
    }
  }

  Future<void> getAllCategory() async {
    var getProduct = GraphQuerySchema.getListProductCategories();

    var operation = Amplify.API.query(
        request: GraphQLRequest<String>(
      document: getProduct,
    ));
    var response = await operation.response;
    // ProductCategory.fromJson(jsonDecode(response.data!));
    ListProductCategoryModel listProductCategoryModel =
        ListProductCategoryModel.fromJson(jsonDecode(response.data!));
    print(
        "categoryList lengthsssss:------- ${listProductCategoryModel.data!.listProductCategories!.items?.length}");
  }
}
