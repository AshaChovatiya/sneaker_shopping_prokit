import 'package:sneaker_shopping_prokit/model/ListProductCategories.dart';

class ProductCategoryDemo {
  ProductCategoryDemo({
      this.listProductCategories,});

  ProductCategoryDemo.fromJson(dynamic json) {
    listProductCategories = ListProductCategories.fromJson(Map<String, dynamic>.from(json['listProductCategories']));
  }
  ListProductCategories? listProductCategories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['listProductCategories'] = listProductCategories;
    return map;
  }

}