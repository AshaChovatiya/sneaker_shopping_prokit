import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:sneaker_shopping_prokit/model/review_model.dart';

import '../model/ImageModel.dart';
import '../model/ProductListModel.dart';
import '../schema/graph_query.dart';

class ProductDetailsProvider extends ChangeNotifier {
  bool _isLoading = true;
  Items? productDataModel;

  ImageItems? selectedImage;
  ReviewData? _reviewData;

  ReviewData? get reviewData => _reviewData;

  set reviewData(ReviewData? value) {
    _reviewData = value;
    notifyListeners();
  }

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

  getReviewData(String? productId) async {
    var getReview =
        GraphQuerySchema.getProductReviews(productId: productId!, limit: 10);

    try {
      var operation = Amplify.API.query(
          request: GraphQLRequest<String>(
        document: getReview,
      ));
      var response = await operation.response;
      print(response.errors);
      if (response.data != null && response.errors.isEmpty) {
        reviewData = ReviewData.fromJson(jsonDecode(response.data!));
        print(
            "ReviewData:------- ${reviewData!.listReviews?.reviewItems?.length}");
      } else {
        print(response.errors);
      }
    } catch (e) {
      print(e);
    }
  }
}
