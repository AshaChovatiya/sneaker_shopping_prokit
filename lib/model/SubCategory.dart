import 'package:sneaker_shopping_prokit/model/Items.dart';

class SubCategory {
  SubCategory({
      this.items,
      this.nextToken,});

  SubCategory.fromJson(dynamic json) {
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
    nextToken = json['nextToken'];
  }
  List<Items>? items;
  dynamic nextToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    map['nextToken'] = nextToken;
    return map;
  }

}