import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:sneaker_shopping_prokit/models/ModelProvider.dart';

class SearchScreenProvider extends ChangeNotifier {
  bool isSearchLoading = false;
  bool isSearch = false;
  List<ProductCategory?> searchProductCategoriesList = [];

  SearchScreenProvider() {
    searchProductCategories();
  }

  onChangeSearch(bool isSearch) {
    this.isSearch = isSearch;
    notifyListeners();
  }

  Future<void> searchProductCategories({String? search}) async {
    isSearchLoading = true;
    try {
      final request;
      if (isSearch) {
        request = ModelQueries.list(
          ProductCategory.classType,
          where: ProductCategory.NAME.contains(search.toString()),
        );
      } else {
        request = ModelQueries.list(
          ProductCategory.classType,
        );
      }
      final response = await Amplify.API.query(request: request).response;
      searchProductCategoriesList.clear();
      if (response.data!.items.length > 0) {
        searchProductCategoriesList.addAll(response.data!.items);
        print("searchProductCategories Data:- ${response.data?.items.length}");
      }
      isSearchLoading = false;
    } catch (e) {
      isSearchLoading = false;
      print("searchProductCategories error:- $e");
    }
    notifyListeners();
  }
}
