

import 'package:sneaker_shopping_prokit/model/SubCategory.dart';

class Items {
  Items({
      this.id, 
      this.name, 
      this.storeId, 
      this.store, 
      this.description, 
      this.slug, 
      this.isFeatured, 
      this.totalProducts, 
      this.priority, 
      this.imageUrl, 
      this.products, 
      this.subCategory, 
      this.createdAt, 
      this.updatedAt,});

  Items.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    storeId = json['storeId'];
    store = json['store'];
    description = json['description'];
    slug = json['slug'];
    isFeatured = json['isFeatured'];
    totalProducts = json['totalProducts'];
    priority = json['priority'];
    imageUrl = json['imageUrl'];
    products = json['products'] != null ? json['products'] : null;
    subCategory = json['subCategory'] != null ? SubCategory.fromJson(json['subCategory']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  String? id;
  String? name;
  dynamic storeId;
  dynamic store;
  String? description;
  String ?slug;
  bool? isFeatured;
  dynamic totalProducts;
  int? priority;
  String? imageUrl;
  var products;
  SubCategory? subCategory;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['storeId'] = storeId;
    map['store'] = store;
    map['description'] = description;
    map['slug'] = slug;
    map['isFeatured'] = isFeatured;
    map['totalProducts'] = totalProducts;
    map['priority'] = priority;
    map['imageUrl'] = imageUrl;
    if (products != null) {
      map['products'] = products.toJson();
    }
    if (subCategory != null) {
      map['subCategory'] = subCategory?.toJson();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}