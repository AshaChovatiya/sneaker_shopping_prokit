import 'package:sneaker_shopping_prokit/model/ProductListModel.dart';

class ListProductCategoryModel {
  Data? data;

  ListProductCategoryModel({this.data});

  ListProductCategoryModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  ListProductCategories? listProductCategories;

  Data({this.listProductCategories});

  Data.fromJson(Map<String, dynamic> json) {
    listProductCategories = json['listProductCategories'] != null
        ? new ListProductCategories.fromJson(json['listProductCategories'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.listProductCategories != null) {
      data['listProductCategories'] = this.listProductCategories!.toJson();
    }
    return data;
  }
}

class ListProductCategories {
  Null? nextToken;
  List<Items>? items;

  ListProductCategories({this.nextToken, this.items});

  ListProductCategories.fromJson(Map<String, dynamic> json) {
    nextToken = json['nextToken'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nextToken'] = this.nextToken;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategory {
  List<Items>? items;

  SubCategory({this.items});

  SubCategory.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  Null? description;
  String? id;
  Null? imageUrl;
  String? name;
  String? slug;
  Null? totalProducts;

  Category(
      {this.description,
      this.id,
      this.imageUrl,
      this.name,
      this.slug,
      this.totalProducts});

  Category.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
    imageUrl = json['imageUrl'];
    name = json['name'];
    slug = json['slug'];
    totalProducts = json['totalProducts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['id'] = this.id;
    data['imageUrl'] = this.imageUrl;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['totalProducts'] = this.totalProducts;
    return data;
  }
}
