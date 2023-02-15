import 'dart:convert';

import 'package:amplify_api/model_queries.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sneaker_shopping_prokit/model/Items.dart';
import 'package:sneaker_shopping_prokit/models/ModelProvider.dart';

import '../model/ProductCategoryDemo.dart';
import '../schema/graph_mutation_query.dart';

class ProductProvider extends ChangeNotifier {
  List<Product?> productList = [];
  List<Product?> newArrivals = [];
  List<Items> categoryList = [];
  Product? productDataModel;
  bool productDetailLoading = false;

  Future<void> getData() async {
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
    var request = Amplify.API.query(
        request: GraphQLRequest<String>(
      document: OrderSchema.listProduct(),
    ));
    var response = await request.response;
    if (jsonDecode(response.data!)['listProducts']['items'].length > 0) {
      productList.clear();
      for (var i = 0;
          i < jsonDecode(response.data!)['listProducts']['items'].length;
          i++) {
        if (jsonDecode(response.data!)['listProducts']['items'] != null) {
          productList.add(Product.fromJson(
              jsonDecode(response.data!)['listProducts']['items'][i]));
        }
      }
      newArrivals.clear();
      for (var j = 0; j < productList.length; j++) {
        if (productList[j]!.isFeatured == true) {
          newArrivals.add(productList[j]);
        }
      }
    }
    print("Data:------- ${productList.length}");
    getAllCategory();
    notifyListeners();
  }

  getProductItemData(String? productId) async {
    var getProduct = OrderSchema.getSingleProduct(productId!);
    productDetailLoading = true;

    try {
      var operation = Amplify.API.query(
          request: GraphQLRequest<String>(
        document: getProduct,
      ));
      var response = await operation.response;
      print(response.errors);
      productDataModel =
          Product.fromJson(jsonDecode(response.data!)['getProduct']);
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
    var getProduct = OrderSchema.getListProductCategories();

    var operation = Amplify.API.query(
        request: GraphQLRequest<String>(
      document: getProduct,
    ));
    var response = await operation.response;
    ProductCategoryDemo productCategoryDemo =
        ProductCategoryDemo.fromJson(jsonDecode(response.data!));
    print(
        "categoryList lengthsssss:------- ${productCategoryDemo.listProductCategories?.items?.length}");
    if (productCategoryDemo.listProductCategories!.items!.length > 0) {
      categoryList.clear();
        categoryList.addAll(productCategoryDemo.listProductCategories!.items!.toList());

        for (var i = 0; i < productList.length; i++) {
          for (var j = 0; j < productCategoryDemo.listProductCategories!.items!.length; j++) {
            if (productList[i]?.slug == productCategoryDemo.listProductCategories!.items![j].slug) {
              print('---------------- true');
            }
          }
        }
      print("categoryList length:------- ${categoryList.length}");
      notifyListeners();
    }
  }
}
