import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/widgets.dart';

import '../model/ImageModel.dart';
import '../model/ProductListModel.dart';
import '../schema/graph_query.dart';

class ProductDetailsProvider extends ChangeNotifier {
  bool _isLoading = true;
  Items? productDataModel;

  ImageItems? selectedImage;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  getProductItemData(String? productId) async {
    var getProduct = GraphQuerySchema.getSingleProduct(productId!);

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
      isLoading = false;
    } catch (e) {
      isLoading = false;
    }

    notifyListeners();
  }

  changeSelectedImage(ImageItems image) {
    selectedImage = image;
    notifyListeners();
  }
}
