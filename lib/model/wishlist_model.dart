class WishListData {
  ListWishlists? listWishlists;

  WishListData({this.listWishlists});

  WishListData.fromJson(Map<String, dynamic> json) {
    listWishlists = json['listWishlists'] != null
        ? new ListWishlists.fromJson(json['listWishlists'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.listWishlists != null) {
      data['listWishlists'] = this.listWishlists!.toJson();
    }
    return data;
  }
}

class ListWishlists {
  List<Items>? items;

  ListWishlists({this.items});

  ListWishlists.fromJson(Map<String, dynamic> json) {
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

class Items {
  String? id;
  WishlistProducts? wishlistProducts;

  Items({this.id, this.wishlistProducts});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    wishlistProducts = json['wishlistProducts'] != null
        ? new WishlistProducts.fromJson(json['wishlistProducts'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.wishlistProducts != null) {
      data['wishlistProducts'] = this.wishlistProducts!.toJson();
    }
    return data;
  }
}

class WishlistProducts {
  List<WishlistProductItems>? wishlistProductItems;

  WishlistProducts({this.wishlistProductItems});

  WishlistProducts.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      wishlistProductItems = <WishlistProductItems>[];
      json['items'].forEach((v) {
        wishlistProductItems!.add(new WishlistProductItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.wishlistProductItems != null) {
      data['items'] =
          this.wishlistProductItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WishlistProductItems {
  String? productId;
  Product? product;

  WishlistProductItems({this.productId, this.product});

  WishlistProductItems.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  String? title;
  int? totalOrders;
  String? additionalInfo;
  String? currency;
  double? costPrice;
  String? color;
  double? price;
  double? listingPrice;
  bool? isFeatured;
  String? size;
  String? status;
  String? thumbImages;
  Images? images;

  Product(
      {this.title,
      this.totalOrders,
      this.additionalInfo,
      this.currency,
      this.costPrice,
      this.color,
      this.price,
      this.listingPrice,
      this.isFeatured,
      this.size,
      this.status,
      this.thumbImages,
      this.images});

  Product.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    totalOrders = json['totalOrders'];
    additionalInfo = json['additionalInfo'];
    currency = json['currency'];
    costPrice = json['costPrice'];
    color = json['color'];
    price = json['price'];
    listingPrice = json['listingPrice'];
    isFeatured = json['isFeatured'];
    size = json['size'];
    status = json['status'];
    thumbImages = json['thumbImages'];
    images =
        json['images'] != null ? new Images.fromJson(json['images']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['totalOrders'] = this.totalOrders;
    data['additionalInfo'] = this.additionalInfo;
    data['currency'] = this.currency;
    data['costPrice'] = this.costPrice;
    data['color'] = this.color;
    data['price'] = this.price;
    data['listingPrice'] = this.listingPrice;
    data['isFeatured'] = this.isFeatured;
    data['size'] = this.size;
    data['status'] = this.status;
    data['thumbImages'] = this.thumbImages;
    if (this.images != null) {
      data['images'] = this.images!.toJson();
    }
    return data;
  }
}

class Images {
  List<ImagesItems>? imagesItems;

  Images({this.imagesItems});

  Images.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      imagesItems = <ImagesItems>[];
      json['items'].forEach((v) {
        imagesItems!.add(new ImagesItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.imagesItems != null) {
      data['items'] = this.imagesItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ImagesItems {
  String? imageKey;
  String? id;
  String? productId;

  ImagesItems({this.imageKey, this.id, this.productId});

  ImagesItems.fromJson(Map<String, dynamic> json) {
    imageKey = json['imageKey'];
    id = json['id'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageKey'] = this.imageKey;
    data['id'] = this.id;
    data['productId'] = this.productId;
    return data;
  }
}
