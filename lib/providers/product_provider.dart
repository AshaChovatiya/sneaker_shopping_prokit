import 'dart:convert';

import 'package:amplify_api/model_queries.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sneaker_shopping_prokit/model/ImageModel.dart';
import 'package:sneaker_shopping_prokit/model/ListProductCategoryModel.dart';
import 'package:sneaker_shopping_prokit/models/ModelProvider.dart';
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
  ImageItems? selectedImage;

  changeSelectedImage(ImageItems image) {
    selectedImage = image;
    notifyListeners();
  }

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
    try {
      final userId =
          await Amplify.Auth.getCurrentUser().then((value) => value.userId);
      if (isScroll == false) {
        var request = Amplify.API.query(
            request: GraphQLRequest<String>(
          document: GraphQuerySchema.getWishlistProductId(userId: userId),
        ));
        var response = await request.response;

        if (response.data != null) {
          wishListedProducts = List<String>.from(
              jsonDecode(response.data!)['listWishlists']['items']
                  .map((e) => e['wishlistProducts']['items'][0]['productId']));
          wishListedIds = List<String>.from(
              jsonDecode(response.data!)['listWishlists']['items']
                  .map((e) => e['id']));
        }

        print("response.data of WishList! ${response.data!}");
      }
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
    }
    notifyListeners();
  }

  getProductItemData(String? productId) async {
    var getProduct = GraphQuerySchema.getSingleProduct(productId!);
    productDetailLoading = true;

    try {
      var operation = Amplify.API.query(
          request: GraphQLRequest<String>(
        document: getProduct,
      ));
      var response = await operation.response;
      print(response.errors);
      productDataModel =
          Items.fromJson(jsonDecode(response.data!)['getProduct']);
      selectedImage = productDataModel!.images!.items![0];
      print("ProductItemData:------- ${productDataModel!.id}");
      productDetailLoading = false;
    } catch (e) {
      productDetailLoading = false;
    }

    notifyListeners();
  }

  getProductImage(String? productId) async {
    productDetailLoading = true;
    try {
      final request = ModelQueries.get(ProductImage.classType, '$productId');
      final response = await Amplify.API.query(request: request).response;
      var data = response.data;
      print("ProductItemData:------- $data");
      productDetailLoading = false;
    } catch (e) {
      productDetailLoading = false;
    }

    notifyListeners();
  }

  Future<void> deleteWishList({required String wishListId}) async {
    int wishList =
        wishListedProducts.indexWhere((element) => wishListId == element);

    if (wishList != -1) {
      wishListedProducts.removeAt(wishList);
      wishListedIds.removeAt(wishList);
      notifyListeners();
    }

    var request = Amplify.API.mutate(
        request: GraphQLRequest<String>(
      document: GraphMutationSchema.deleteWishList(
          wishListId: wishListedIds[wishList]),
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
  }

  /*Future<void> getAllCategory() async {
    var getProduct = OrderSchema.getListProductCategories();
    // final request = ModelQueries.list(
    //   ProductCategory.classType,
    // );
    // final response = await Amplify.API.query(request: request).response;
    var operation = Amplify.API.query(
        request: GraphQLRequest<String>(
      document: getProduct,
    ));
    var response = await operation.response;
    ProductCategoryDemo productCategoryDemo = ProductCategoryDemo.fromJson(jsonDecode(response.data!));
    print("categoryList lengthsssss:------- ${productCategoryDemo.listProductCategories?.items?.length}");
    if (jsonDecode(response.data!)['listProductCategories']['items'].length >
        0) {
      categoryList.clear();
      for (var j = 0;
          j <
              jsonDecode(response.data!)['listProductCategories']['items']
                  .length;
          j++) {
        categoryList.add(ProductCategory.fromJson(
            jsonDecode(response.data!)['listProductCategories']['items'][j]));


        for (var i = 0; i < productList.length; i++) {
          for (var j = 0;
              j <
                  jsonDecode(response.data!)['listProductCategories']['items']
                      .length;
              j++) {
            if (productList[i]?.slug == jsonDecode(response.data!)['listProductCategories']['items'][j]['slug']) {
              print('---------------- true');
            }
          }
        }
      }
      print("categoryList length:------- ${categoryList.length}");
      notifyListeners();
    }
  }*/

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

//
//   changeAdd() async {
//     String req = '''mutation MyMutation {
//   createUserAddress(input: {email: "abc1@gmail.com", userID: "2e90184d-5691-4f3d-9719-e87c059b7bb4"}) {
//     id
//   }
// }
// ''';
//
//     var operation = Amplify.API.mutate(
//         request: GraphQLRequest<String>(
//       document: req,
//     ));
//
//     var response = await operation.response;
//     var data = response.data;
//     print('-------------$data');
//   }
}
