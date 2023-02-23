class ShoppingCartListModel {
  ListShoppingCarts? listShoppingCarts;

  ShoppingCartListModel({this.listShoppingCarts});

  ShoppingCartListModel.fromJson(Map<String, dynamic> json) {
    listShoppingCarts = json['listShoppingCarts'] != null
        ? new ListShoppingCarts.fromJson(json['listShoppingCarts'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.listShoppingCarts != null) {
      data['listShoppingCarts'] = this.listShoppingCarts!.toJson();
    }
    return data;
  }
}

class ListShoppingCarts {
  String? nextToken;
  List<ListShoppingCartsitems>? listShoppingCartsitems;

  ListShoppingCarts({this.nextToken, this.listShoppingCartsitems});

  ListShoppingCarts.fromJson(Map<String, dynamic> json) {
    nextToken = json['nextToken'];
    if (json['items'] != null) {
      listShoppingCartsitems = <ListShoppingCartsitems>[];
      json['items'].forEach((v) {
        listShoppingCartsitems!.add(new ListShoppingCartsitems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nextToken'] = this.nextToken;
    if (this.listShoppingCartsitems != null) {
      data['items'] =
          this.listShoppingCartsitems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListShoppingCartsitems {
  String? userId;
  String? id;
  ShoppingcartProducts? shoppingcartProducts;

  ListShoppingCartsitems({this.userId, this.id, this.shoppingcartProducts});

  ListShoppingCartsitems.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    shoppingcartProducts = json['shoppingcartProducts'] != null
        ? new ShoppingcartProducts.fromJson(json['shoppingcartProducts'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    if (this.shoppingcartProducts != null) {
      data['shoppingcartProducts'] = this.shoppingcartProducts!.toJson();
    }
    return data;
  }
}

class ShoppingcartProducts {
  List<ShoppingcartProductsitems>? shoppingcartProductsitems;

  ShoppingcartProducts({this.shoppingcartProductsitems});

  ShoppingcartProducts.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      shoppingcartProductsitems = <ShoppingcartProductsitems>[];
      json['items'].forEach((v) {
        shoppingcartProductsitems!
            .add(new ShoppingcartProductsitems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.shoppingcartProductsitems != null) {
      data['items'] =
          this.shoppingcartProductsitems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShoppingcartProductsitems {
  String? id;
  String? productId;
  int? quantity;
  String? shoppingcartId;
  Product? product;

  ShoppingcartProductsitems(
      {this.id,
        this.productId,
        this.quantity,
        this.shoppingcartId,
        this.product});

  ShoppingcartProductsitems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    quantity = json['quantity'];
    shoppingcartId = json['shoppingcartId'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productId'] = this.productId;
    data['quantity'] = this.quantity;
    data['shoppingcartId'] = this.shoppingcartId;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  String? brand;
  String? additionalInfo;
  dynamic costPrice;
  dynamic price;
  String? productDescription;
  String? sku;
  dynamic listingPrice;
  String? isFeatured;
  String? thumbImages;
  Images? images;
  String? title;
  String? totalOrders;
  String? currency;
  String? color;
  String? size;
  String? status;

  Product(
      {this.brand,
        this.additionalInfo,
        this.costPrice,
        this.price,
        this.productDescription,
        this.sku,
        this.listingPrice,
        this.isFeatured,
        this.thumbImages,
        this.images,
        this.title,
        this.totalOrders,
        this.currency,
        this.color,
        this.size,
        this.status});

  Product.fromJson(Map<String, dynamic> json) {
    brand = json['brand'];
    additionalInfo = json['additionalInfo'];
    costPrice = json['costPrice'];
    price = json['price'];
    productDescription = json['productDescription'];
    sku = json['sku'];
    listingPrice = json['listingPrice'];
    isFeatured = json['isFeatured'];
    thumbImages = json['thumbImages'];
    images =
    json['images'] != null ? new Images.fromJson(json['images']) : null;
    title = json['title'];
    totalOrders = json['totalOrders'];
    currency = json['currency'];
    color = json['color'];
    size = json['size'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brand'] = this.brand;
    data['additionalInfo'] = this.additionalInfo;
    data['costPrice'] = this.costPrice;
    data['price'] = this.price;
    data['productDescription'] = this.productDescription;
    data['sku'] = this.sku;
    data['listingPrice'] = this.listingPrice;
    data['isFeatured'] = this.isFeatured;
    data['thumbImages'] = this.thumbImages;
    if (this.images != null) {
      data['images'] = this.images!.toJson();
    }
    data['title'] = this.title;
    data['totalOrders'] = this.totalOrders;
    data['currency'] = this.currency;
    data['color'] = this.color;
    data['size'] = this.size;
    data['status'] = this.status;
    return data;
  }
}

class Images {
  List<Items>? items;

  Images({this.items});

  Images.fromJson(Map<String, dynamic> json) {
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
  String? imageKey;
  String? productId;
  String? id;

  Items({this.imageKey, this.productId, this.id});

  Items.fromJson(Map<String, dynamic> json) {
    imageKey = json['imageKey'];
    productId = json['productId'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageKey'] = this.imageKey;
    data['productId'] = this.productId;
    data['id'] = this.id;
    return data;
  }
}
