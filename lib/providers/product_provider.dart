import 'package:amplify_api/model_queries.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sneaker_shopping_prokit/models/ModelProvider.dart';

class ProductProvider extends ChangeNotifier {
  List<Product?> productList = [];
  List<Product?> newArrivals = [];
  List<ProductCategory?> categoryList = [];
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
    final request = ModelQueries.list(
      Product.classType,
    );
    final response = await Amplify.API.query(request: request).response;
    print("DData:- ${response.data?.items.length}");
    if (response.data!.items.length > 0) {
      productList.clear();
      for (var i = 0; i < response.data!.items.length; i++) {
        if (response.data!.items[i] != null) {
          productList.add(response.data!.items[i]);
        }
      }
      print("Data:------- ${productList.length}");
      for (var j = 0; j < productList.length; j++) {
        if (productList[j]!.isFeatured == true) {
          newArrivals.add(productList[j]);
        }
      }
    }
    getAllCategory();
    notifyListeners();
  }

  getProductItemData(String? productId) async {
    productDetailLoading = true;
    try {
      final request = ModelQueries.get(Product.classType, '$productId');
      final response = await Amplify.API.query(request: request).response;
      productDataModel = response.data;
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
      print("ProductItemData:------- ${data}");
      productDetailLoading = false;
    } catch (e) {
      productDetailLoading = false;
    }

    notifyListeners();
  }

  Future<void> getAllCategory() async {
    final request = ModelQueries.list(
      ProductCategory.classType,
    );
    final response = await Amplify.API.query(request: request).response;
    if (response.data!.items.length > 0) {
      print("getAllCategory:------- ${response.data!.items.length}");
      // for (var j = 0; j < response.data!.items.length; j++) {
      categoryList.addAll(response.data!.items);
      // }
      print("categoryList length:------- ${categoryList.length}");
      print("categoryList length:------- ${categoryList.length}");

      for (var i = 0; i < productList.length; i++) {
        for (var j = 0; j < response.data!.items.length; j++) {
          if (productList[i]?.id == response.data!.items[j]!.id) {
            print('---------------- true');
          }
        }
      }
    }
    notifyListeners();
  }
}
