import 'package:sneaker_shopping_prokit/model/ImageModel.dart';

class ProductListModel {
  ListProducts? listProducts;

  ProductListModel({this.listProducts});

  ProductListModel.fromJson(Map<String, dynamic> json) {
    listProducts = ListProducts.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.listProducts != null) {
      data['listProducts'] = this.listProducts!.toJson();
    }
    return data;
  }
}

class ListProducts {
  String? nextToken;
  List<Items>? items;

  ListProducts({this.nextToken, this.items});

  ListProducts.fromJson(Map<String, dynamic> json) {
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

class Items {
  String? additionalInfo;
  String? barcode;
  Images? images;
  dynamic blockedInventory;
  String? brand;
  String? categoryId;
  dynamic color;
  int? costPrice;
  String? createdAt;
  dynamic currency;
  dynamic hasVarient;
  String? id;
  dynamic inventory;
  dynamic isFeatured;
  bool? isInventoryEnabled;
  bool? isPublished;
  bool? isTaxEnabled;
  dynamic listingPrice;
  String? longDescription;
  dynamic position;
  dynamic price;
  String? productDescription;
  String? productType;
  dynamic rating;
  String? size;
  String? sku;
  String? slug;
  String? status;
  String? subCategoryId;
  String? thumbImages;
  dynamic taxable;
  dynamic tags;
  String? title;
  dynamic totalOrders;
  String? updatedAt;
  dynamic weight;
  dynamic weightUnit;

  Items(
      {this.additionalInfo,
      this.barcode,
      this.images,
      this.blockedInventory,
      this.brand,
      this.categoryId,
      this.color,
      this.costPrice,
      this.createdAt,
      this.currency,
      this.hasVarient,
      this.id,
      this.inventory,
      this.isFeatured,
      this.isInventoryEnabled,
      this.isPublished,
      this.isTaxEnabled,
      this.listingPrice,
      this.longDescription,
      this.position,
      this.price,
      this.productDescription,
      this.productType,
      this.rating,
      this.size,
      this.sku,
      this.slug,
      this.status,
      this.subCategoryId,
      this.thumbImages,
      this.taxable,
      this.tags,
      this.title,
      this.totalOrders,
      this.updatedAt,
      this.weight,
      this.weightUnit});

  Items.fromJson(Map<String, dynamic> json) {
    additionalInfo = json['additionalInfo'];
    barcode = json['barcode'];
    blockedInventory = json['blockedInventory'];
    brand = json['brand'];
    images =
        json['images'] != null ? new Images.fromJson(json['images']) : null;
    categoryId = json['categoryId'];
    color = json['color'];
    costPrice = json['costPrice'];
    createdAt = json['createdAt'];
    currency = json['currency'];
    hasVarient = json['hasVarient'];
    id = json['id'];
    inventory = json['inventory'];
    isFeatured = json['isFeatured'];
    isInventoryEnabled = json['isInventoryEnabled'];
    isPublished = json['isPublished'];
    isTaxEnabled = json['isTaxEnabled'];
    listingPrice = json['listingPrice'];
    longDescription = json['longDescription'];
    position = json['position'];
    price = json['price'];
    productDescription = json['productDescription'];
    productType = json['productType'];
    rating = json['rating'];
    size = json['size'];
    sku = json['sku'];
    slug = json['slug'];
    status = json['status'];
    subCategoryId = json['subCategoryId'];
    thumbImages = json['thumbImages'];
    taxable = json['taxable'];
    tags = json['tags'];
    title = json['title'];
    totalOrders = json['totalOrders'];
    updatedAt = json['updatedAt'];
    weight = json['weight'];
    weightUnit = json['weightUnit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['additionalInfo'] = this.additionalInfo;
    data['barcode'] = this.barcode;
    data['images'] = this.images!.toJson();
    data['blockedInventory'] = this.blockedInventory;
    data['brand'] = this.brand;
    data['categoryId'] = this.categoryId;
    data['color'] = this.color;
    data['costPrice'] = this.costPrice;
    data['createdAt'] = this.createdAt;
    data['currency'] = this.currency;
    data['hasVarient'] = this.hasVarient;
    data['id'] = this.id;
    data['inventory'] = this.inventory;
    data['isFeatured'] = this.isFeatured;
    data['isInventoryEnabled'] = this.isInventoryEnabled;
    data['isPublished'] = this.isPublished;
    data['isTaxEnabled'] = this.isTaxEnabled;
    data['listingPrice'] = this.listingPrice;
    data['longDescription'] = this.longDescription;
    data['position'] = this.position;
    data['price'] = this.price;
    data['productDescription'] = this.productDescription;
    data['productType'] = this.productType;
    data['rating'] = this.rating;
    data['size'] = this.size;
    data['sku'] = this.sku;
    data['slug'] = this.slug;
    data['status'] = this.status;
    data['subCategoryId'] = this.subCategoryId;
    data['thumbImages'] = this.thumbImages;
    data['taxable'] = this.taxable;
    data['tags'] = this.tags;
    data['title'] = this.title;
    data['totalOrders'] = this.totalOrders;
    data['updatedAt'] = this.updatedAt;
    data['weight'] = this.weight;
    data['weightUnit'] = this.weightUnit;
    return data;
  }
}
