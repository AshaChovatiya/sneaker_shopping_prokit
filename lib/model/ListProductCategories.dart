import 'Items.dart';

class ListProductCategories {
  ListProductCategories({
      this.items, 
      this.nextToken,});

  ListProductCategories.fromJson(dynamic json) {
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