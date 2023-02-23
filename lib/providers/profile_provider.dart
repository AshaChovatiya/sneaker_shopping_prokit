import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/widgets.dart';

import '../schema/graph_query.dart';

class ProfileProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getUserData() async {
    var request = Amplify.API.query(
        request: GraphQLRequest<String>(
      document: GraphQuerySchema.getUserData(),
    ));
    var response = await request.response;
  }
}
