import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shopping_prokit/providers/initial_provider.dart';
import 'package:sneaker_shopping_prokit/service/mutations.dart';

import '../models/ShoppingCartProduct.dart';

class ShoppingCartProvider extends ChangeNotifier {
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  List<ShoppingCartProduct>? _shoppingCart = [];

  List<ShoppingCartProduct>? get shoppingCart => _shoppingCart;

  set shoppingCart(List<ShoppingCartProduct>? value) {
    _shoppingCart = value;
    notifyListeners();
  }

  Future<void> getShoppingCart(BuildContext context) async {
    if (isLoading == false) {
      isLoading = true;
    }

    final String userId = context.read<InitialProvider>().currentUser!.userId;
    shoppingCart =
        await AWSMutations.getShoppingCartList(userId: userId).catchError((e) {
      print(e);
    });
    isLoading = false;
  }
}
