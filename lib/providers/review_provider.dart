import 'dart:convert';
import 'dart:io';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';

import '../model/user_data.dart';
import '../schema/graph_mutation_query.dart';
import '../schema/graph_query.dart';
import '../utils/common_snack_bar.dart';

class ReviewProvider extends ChangeNotifier {
  XFile? image;
  bool _isLoading = false;
  String imageString = '';
  late UserData _userData;

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
    isLoading = true;
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
    isLoading = false;
  }

  Future<void> createAndUploadFile() async {
    final exampleFile = File(image!.path);
    try {
      final UploadFileResult result = await Amplify.Storage.uploadFile(
          local: exampleFile,
          key: 'healthstaticbucket210034-dev',
          onProgress: (progress) {
            safePrint('Fraction completed: ${progress.getFractionCompleted()}');
          });
      safePrint('Successfully uploaded file: ${result.key}');
      imageString = result.key;
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
    await createAndUploadFile();
    final userId =
        await Amplify.Auth.getCurrentUser().then((value) => value.userId);
    // Todo Set Email ----
    final bool email = true;
    final userName = userData.getUser?.firstName;
    final request = Amplify.API.mutate(
        request: GraphQLRequest<String>(
      document: GraphMutationSchema.createReviewMutation(
          images: imageString,
          email: email,
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
}
