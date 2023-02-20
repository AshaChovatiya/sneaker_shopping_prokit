import 'dart:convert';

import 'package:amplify_api/model_queries.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sneaker_shopping_prokit/model/ListProductCategoryModel.dart';
import 'package:sneaker_shopping_prokit/models/ModelProvider.dart';

import '../model/ProductListModel.dart';
import '../schema/graph_query.dart';

class ProductProvider extends ChangeNotifier {
  ProductListModel? productList = ProductListModel();
  ProductListModel? newArrivals = ProductListModel();
  List<Items> categoryList = [];
  Items? productDataModel;
  bool productDetailLoading = false;
  bool homeLoading = false;

  Future<void> getData() async {
    // changeAdd();
    // String getProductImage = '''
    //     query GetProductImage(1: ID!) {
    //       getProductImage(id: 1) {
    //         id
    //         productId
    //         position
    //         createdAt
    //         updatedAt
    //         alt
    //         width
    //         height
    //         imageKey
    //         isThumb
    //       }
    //     }
    //   ''';
    // final response = await Amplify.API
    //     .query<String>(
    //         request: GraphQLRequest(document: '''
    //     query GetProductImage(\$id: ID!) {
    //       getProductImage(id: \$id) {
    //         id
    //         productId
    //         position
    //         createdAt
    //         updatedAt
    //         alt
    //         width
    //         height
    //         imageKey
    //         isThumb
    //       }
    //     }
    //   ''', variables: {
    //       'id': '',
    //     }))
    //     .response;
    // print("DData:- ${response.data}");
    // final request = ModelQueries.list(
    //   Product.classType,
    // );
    try {
      homeLoading = true;
      var request = Amplify.API.query(
          request: GraphQLRequest<String>(
        document: GraphQuerySchema.listProduct(),
      ));
      var response = await request.response;
      productList =
          ProductListModel.fromJson(jsonDecode(response.data!)['listProducts']);

      newArrivals = ProductListModel();
      if (productList!.listProducts != null)
        for (var j = 0; j < productList!.listProducts!.items!.length; j++) {
          if (productList!.listProducts!.items![j].isFeatured == true) {
            newArrivals!.listProducts!.items!
                .add(productList!.listProducts!.items![j]);
          }
        }
      print("Data:------- ${productList?.listProducts!.items!.length}");

      await getAllCategory();
      homeLoading = false;
      notifyListeners();
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
