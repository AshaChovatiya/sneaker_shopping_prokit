class SearchProduct {
  SearchProducts? searchProducts;

  SearchProduct({this.searchProducts});

  SearchProduct.fromJson(Map<String, dynamic> json) {
    try {
      searchProducts = json['searchProducts'] != null
          ? new SearchProducts.fromJson(json['searchProducts'])
          : null;
    } catch (e) {
      print("SearchProduct Error:- $e");
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.searchProducts != null) {
      data['searchProducts'] = this.searchProducts!.toJson();
    }
    return data;
  }
}

class SearchProducts {
  int? total;
  String? nextToken;
  List<SearchProductItems>? searchProductItems;

  SearchProducts({this.total, this.searchProductItems});

  SearchProducts.fromJson(Map<String, dynamic> json) {
    try {
      total = json['total'];
      nextToken = json['nextToken'];
      if (json['items'] != null) {
        searchProductItems = <SearchProductItems>[];
        json['items'].forEach((v) {
          searchProductItems!.add(new SearchProductItems.fromJson(v));
        });
      }
    } catch (e) {
      print("SearchProducts Error:- $e");
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['nextToken'] = this.nextToken;
    if (this.searchProductItems != null) {
      data['items'] = this.searchProductItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SearchProductItems {
  String? barcode;
  double? price;
  String? thumbImages;
  String? title;
  String? currency;
  double? costPrice;
  String? categoryId;
  String? brand;
  String? tags;
  String? slug;
  double? productDescription;
  Images? images;

  SearchProductItems(
      {this.barcode,
      this.price,
      this.thumbImages,
      this.title,
      this.currency,
      this.costPrice,
      this.categoryId,
      this.brand,
      this.tags,
      this.slug,
      this.productDescription,
      this.images});

  SearchProductItems.fromJson(Map<String, dynamic> json) {
    try {
      barcode = json['barcode'];
      price = json['price'];
      thumbImages = json['thumbImages'];
      title = json['title'];
      currency = json['currency'];
      costPrice = json['costPrice'];
      categoryId = json['categoryId'];
      brand = json['brand'];
      tags = json['tags'];
      slug = json['slug'];
      productDescription = json['productDescription'];
      images =
          json['images'] != null ? new Images.fromJson(json['images']) : null;
    } catch (e) {
      print("SearchProductItems Error:- $e");
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['barcode'] = this.barcode;
    data['price'] = this.price;
    data['thumbImages'] = this.thumbImages;
    data['title'] = this.title;
    data['currency'] = this.currency;
    data['costPrice'] = this.costPrice;
    data['categoryId'] = this.categoryId;
    data['brand'] = this.brand;
    data['tags'] = this.tags;
    data['slug'] = this.slug;
    data['productDescription'] = this.productDescription;
    if (this.images != null) {
      data['images'] = this.images!.toJson();
    }
    return data;
  }
}

class Images {
  List<ProductImagesItems>? productImagesItems;

  Images({this.productImagesItems});

  Images.fromJson(Map<String, dynamic> json) {
    try {
      if (json['items'] != null) {
        productImagesItems = <ProductImagesItems>[];
        json['items'].forEach((v) {
          productImagesItems!.add(new ProductImagesItems.fromJson(v));
        });
      }
    } catch (e) {
      print("Images Error:- $e");
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productImagesItems != null) {
      data['items'] = this.productImagesItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductImagesItems {
  String? imageKey;
  String? productId;

  ProductImagesItems({this.imageKey, this.productId});

  ProductImagesItems.fromJson(Map<String, dynamic> json) {
    try {
      imageKey = json['imageKey'];
      productId = json['productId'];
    } catch (e) {
      print("ProductImagesItems Error:- $e");
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageKey'] = this.imageKey;
    data['productId'] = this.productId;
    return data;
  }
}
