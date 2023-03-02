import 'dart:convert';
import 'dart:io';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';

import '../model/review_model.dart';
import '../model/user_data.dart';
import '../schema/graph_mutation_query.dart';
import '../schema/graph_query.dart';
import '../utils/common_snack_bar.dart';

class ReviewProvider extends ChangeNotifier {
  XFile? image;
  bool _isLoading = false;
  String imageString = '';
  late UserData _userData;
  final String? productId;
  List<ReviewItems> _reviewItems = [];

  List<ReviewItems> get reviewItems => _reviewItems;

  set reviewItems(List<ReviewItems> value) {
    _reviewItems = value;
    notifyListeners();
  }

  ReviewProvider({this.productId});
  ReviewData? _reviewData;

  ReviewData? get reviewData => _reviewData;

  set reviewData(ReviewData? value) {
    _reviewData = value;
    notifyListeners();
  }

  UserData get userData => _userData;

  set userData(UserData value) {
    _userData = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  pickImage() async {
    image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {}
    notifyListeners();
  }

  deleteImage() {
    image = null;
    notifyListeners();
  }

  Future<void> getUserData() async {
    final userId =
        await Amplify.Auth.getCurrentUser().then((value) => value.userId);

    var request = Amplify.API.query(
        request: GraphQLRequest<String>(
      document: GraphQuerySchema.getUserDetails(userId),
    ));
    var response = await request.response;

    if (response.data != null) {
      userData = UserData.fromJson(jsonDecode(response.data!));
    } else {
      print(response.errors);
    }
  }

  Future<void> createAndUploadFile({required String productId}) async {
    final exampleFile = File(image!.path);
    try {
      final UploadFileResult result = await Amplify.Storage.uploadFile(
          local: exampleFile,
          key:
              'customer_review/${productId}_${DateTime.now().millisecondsSinceEpoch}.jpg',
          onProgress: (progress) {
            safePrint('Fraction completed: ${progress.getFractionCompleted()}');
          });
      safePrint('Successfully uploaded file: ${result.key}');
      imageString = await Amplify.Storage.getUrl(key: result.key)
          .then((value) => value.url.split('?')[0]);
    } on StorageException catch (e) {
      safePrint('Error uploading file: $e');
    }
    notifyListeners();
  }

  Future<void> createReview(
      {required String comment,
      required String title,
      required String productId,
      required int rating}) async {
    isLoading = true;
    await getUserData();
    if (image != null) {
      await createAndUploadFile(productId: productId);
    }
    final userId =
        await Amplify.Auth.getCurrentUser().then((value) => value.userId);
    // Todo Set Email ----
    final userName = userData.getUser?.firstName;
    final email = userData.getUser?.email;
    final request = Amplify.API.mutate(
        request: GraphQLRequest<String>(
      document: GraphMutationSchema.createReviewMutation(
          images: imageString,
          email: email ?? 'notfound@gmail.com',
          name: userName!,
          comment: comment,
          title: title,
          userId: userId,
          productId: productId,
          rating: rating),
    ));

    final response = await request.response;
    if (response.errors.isEmpty && response.data != null) {
      isLoading = false;
    } else {
      if (response.errors.isNotEmpty) {
        errorMessage = response.errors.first.message;
        GlobalSnackBar.show(
            context: navigatorKey.currentContext!,
            message: errorMessage,
            type: SnackBarType.ERROR);
        print(response.errors);
      }
      GlobalSnackBar.show(
          context: navigatorKey.currentContext!,
          message: 'Something went wrong!',
          type: SnackBarType.ERROR);
      isLoading = false;
    }
  }

  Future<void> getReviews(String productId) async {
    var getReview = GraphQuerySchema.getProductReviews(productId: productId!);

    try {
      var operation = Amplify.API.query(
          request: GraphQLRequest<String>(
        document: getReview,
      ));
      var response = await operation.response;
      print(response.errors);
      if (response.data != null && response.errors.isEmpty) {
        reviewData = ReviewData.fromJson(jsonDecode(response.data!));
        reviewItems = reviewData!.listReviews!.reviewItems!;
        print(
            "ReviewData:------- ${reviewData!.listReviews?.reviewItems?.length}");
      } else {
        print(response.errors);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteReview(String reviewId) async {
    var getReview =
        GraphMutationSchema.deleteReviewMutation(reviewId: reviewId);

    var operation = Amplify.API.query(
        request: GraphQLRequest<String>(
      document: getReview,
    ));
    var response = await operation.response;

    if (response.data != null && response.errors.isEmpty) {
      _reviewItems.removeWhere((element) => element.id == reviewId);
      notifyListeners();
    } else {
      if (response.errors.isNotEmpty) {
        print(response.errors);
      } else {
        GlobalSnackBar.show(
            context: navigatorKey.currentContext!,
            message: 'Somethig went wrong!',
            type: SnackBarType.ERROR);
      }
    }
  }
}
