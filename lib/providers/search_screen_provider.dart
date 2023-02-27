import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:sneaker_shopping_prokit/models/ModelProvider.dart';
import 'package:sneaker_shopping_prokit/schema/graph_query.dart';

import '../model/search_product_model.dart';

class SearchScreenProvider extends ChangeNotifier {
  bool isSearchLoading = false;
  bool isPagination = false;
  bool isSearch = false;
  bool _isCompleted = false;

  bool get isCompleted => _isCompleted;

  set isCompleted(bool value) {
    _isCompleted = value;
    notifyListeners();
  }

  List<ProductCategory?> searchProductCategoriesList = [];
  SearchProduct searchProduct = SearchProduct();
  List<SearchProductItems>? _searchProductItems = [];

  List<SearchProductItems>? get searchProductItems => _searchProductItems;

  set searchProductItems(List<SearchProductItems>? value) {
    if (value == null) return;
    _searchProductItems?.addAll(value);
    notifyListeners();
  }

  Future<void> signOutCurrentUserGlobally() async {
    try {
      await Amplify.Auth.signOut(options: SignOutOptions(globalSignOut: true));
    } on AmplifyException catch (e) {
      print(e.message);
    }
  }

  onChangeSearch(bool isSearch) {
    this.isSearch = isSearch;
    notifyListeners();
  }

  Future<void> searchProductData(
      {String? search, bool isScroll = false}) async {
    if (isScroll == false) {
      isCompleted = false;
    }
    if (isPagination || isCompleted) return;
    if (isScroll) {
      isPagination = true;
      isSearchLoading = false;
    } else {
      isPagination = false;
      isSearchLoading = true;
    }

    notifyListeners();
    var request = Amplify.API.query(
        request: GraphQLRequest<String>(
      document: GraphQuerySchema.searchProduct(search.toString(),
          isScroll ? searchProduct.searchProducts!.nextToken : null),
    ));
    var response = await request.response;

    if (response.errors.isEmpty) {
      searchProduct = SearchProduct.fromJson(jsonDecode(response.data!));

      if (!isScroll) {
        _searchProductItems = [];
        searchProductItems = searchProduct.searchProducts!.searchProductItems;
        isSearchLoading = false;
        notifyListeners();
        return;
      }

      searchProductItems = searchProduct.searchProducts!.searchProductItems;

      if (searchProduct.searchProducts!.nextToken == null) {
        isCompleted = true;
      }

      print("searchProductData:- ${searchProductItems?.length}");
      print("NextToken:- ${searchProduct.searchProducts!.nextToken}");
    } else {
      print("searchProductData error:- ${response.errors}");
    }

    isSearchLoading = false;
    isPagination = false;
    notifyListeners();
  }
}
