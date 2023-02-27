class MyOrderModel {
  ListOrders? listOrders;

  MyOrderModel({this.listOrders});

  MyOrderModel.fromJson(Map<String, dynamic> json) {
    listOrders = json['listOrders'] != null
        ? new ListOrders.fromJson(json['listOrders'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.listOrders != null) {
      data['listOrders'] = this.listOrders!.toJson();
    }
    return data;
  }
}

class ListOrders {
  List<Items>? items;
  String? nextToken;

  ListOrders({this.items, this.nextToken});

  ListOrders.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    nextToken = json['nextToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['nextToken'] = this.nextToken;
    return data;
  }
}

class Items {
  String? id;
  Products? products;
  String? currency;
  String? orderDate;
  double? totalAmount;
  double? totalCashOnDeliveryCharges;
  double? totalDiscount;
  double? totalGiftCharges;
  double? totalPrepaidAmount;
  double? totalShippingCharges;
  double? totalStoreCredit;
  String? couponCodeId;
  String? status;

  Items(
      {this.id,
        this.products,
        this.currency,
        this.orderDate,
        this.totalAmount,
        this.totalCashOnDeliveryCharges,
        this.totalDiscount,
        this.totalGiftCharges,
        this.totalPrepaidAmount,
        this.totalShippingCharges,
        this.totalStoreCredit,
        this.couponCodeId,this.status});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    products = json['products'] != null
        ? new Products.fromJson(json['products'])
        : null;
    currency = json['currency'];
    orderDate = json['orderDate'];
    totalAmount = json['totalAmount'];
    totalCashOnDeliveryCharges = json['totalCashOnDeliveryCharges'];
    totalDiscount = json['totalDiscount'];
    totalGiftCharges = json['totalGiftCharges'];
    totalPrepaidAmount = json['totalPrepaidAmount'];
    totalShippingCharges = json['totalShippingCharges'];
    totalStoreCredit = json['totalStoreCredit'];
    couponCodeId = json['CouponCodeId'];
    status = json['status'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.products != null) {
      data['products'] = this.products!.toJson();
    }
    data['currency'] = this.currency;
    data['orderDate'] = this.orderDate;
    data['totalAmount'] = this.totalAmount;
    data['totalCashOnDeliveryCharges'] = this.totalCashOnDeliveryCharges;
    data['totalDiscount'] = this.totalDiscount;
    data['totalGiftCharges'] = this.totalGiftCharges;
    data['totalPrepaidAmount'] = this.totalPrepaidAmount;
    data['totalShippingCharges'] = this.totalShippingCharges;
    data['totalStoreCredit'] = this.totalStoreCredit;
    data['CouponCodeId'] = this.couponCodeId;
    return data;
  }
}

class Products {
  List<ProductsItems>? productsItems;

  Products({this.productsItems});

  Products.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      productsItems = <ProductsItems>[];
      json['items'].forEach((v) {
        productsItems!.add(new ProductsItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productsItems != null) {
      data['items'] =
          this.productsItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductsItems {
  String? additionalInfo;
  int? cashOnDeliveryCharges;
  dynamic centralGstPercentage;
  dynamic compensationCessPercentage;
  String? currency;
  String? deliveryPartner;
  dynamic discount;
  String? dispatchDate;
  String? id;
  String? orderId;
  int? quantity;
  String? title;
  double? totalPrice;
  String? status;
  String? productId;
  Product? product;
  double? price;
  String? invoiceDate;
  dynamic invoiceNumber;
  dynamic onHold;

  ProductsItems(
      {this.additionalInfo,
        this.cashOnDeliveryCharges,
        this.centralGstPercentage,
        this.compensationCessPercentage,
        this.currency,
        this.deliveryPartner,
        this.discount,
        this.dispatchDate,
        this.id,
        this.orderId,
        this.quantity,
        this.title,
        this.totalPrice,
        this.status,
        this.productId,
        this.product,
        this.price,
        this.invoiceDate,
        this.invoiceNumber,
        this.onHold});

  ProductsItems.fromJson(Map<String, dynamic> json) {
    additionalInfo = json['additionalInfo'];
    cashOnDeliveryCharges = json['cashOnDeliveryCharges'];
    centralGstPercentage = json['centralGstPercentage'];
    compensationCessPercentage = json['compensationCessPercentage'];
    currency = json['currency'];
    deliveryPartner = json['deliveryPartner'];
    discount = json['discount'];
    dispatchDate = json['dispatchDate'];
    id = json['id'];
    orderId = json['orderId'];
    quantity = json['quantity'];
    title = json['title'];
    totalPrice = json['totalPrice'];
    status = json['status'];
    productId = json['productId'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    price = json['price'];
    invoiceDate = json['invoiceDate'];
    invoiceNumber = json['invoiceNumber'];
    onHold = json['onHold'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['additionalInfo'] = this.additionalInfo;
    data['cashOnDeliveryCharges'] = this.cashOnDeliveryCharges;
    data['centralGstPercentage'] = this.centralGstPercentage;
    data['compensationCessPercentage'] = this.compensationCessPercentage;
    data['currency'] = this.currency;
    data['deliveryPartner'] = this.deliveryPartner;
    data['discount'] = this.discount;
    data['dispatchDate'] = this.dispatchDate;
    data['id'] = this.id;
    data['orderId'] = this.orderId;
    data['quantity'] = this.quantity;
    data['title'] = this.title;
    data['totalPrice'] = this.totalPrice;
    data['status'] = this.status;
    data['productId'] = this.productId;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['price'] = this.price;
    data['invoiceDate'] = this.invoiceDate;
    data['invoiceNumber'] = this.invoiceNumber;
    data['onHold'] = this.onHold;
    return data;
  }
}

class Product {
  String? additionalInfo;
  String? brand;
  String? color;
  String? currency;
  String? id;
  double? price;
  String? productType;
  String? longDescription;
  bool? isFeatured;
  String? status;
  String? title;
  String? thumbImages;
  double? listingPrice;
  double? totalOrders;

  Product(
      {this.additionalInfo,
        this.brand,
        this.color,
        this.currency,
        this.id,
        this.price,
        this.productType,
        this.longDescription,
        this.isFeatured,
        this.status,
        this.title,
        this.thumbImages,
        this.listingPrice,
        this.totalOrders});

  Product.fromJson(Map<String, dynamic> json) {
    additionalInfo = json['additionalInfo'];
    brand = json['brand'];
    color = json['color'];
    currency = json['currency'];
    id = json['id'];
    price = json['price'];
    productType = json['productType'];
    longDescription = json['longDescription'];
    isFeatured = json['isFeatured'];
    status = json['status'];
    title = json['title'];
    thumbImages = json['thumbImages'];
    listingPrice = json['listingPrice'];
    totalOrders = json['totalOrders'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['additionalInfo'] = this.additionalInfo;
    data['brand'] = this.brand;
    data['color'] = this.color;
    data['currency'] = this.currency;
    data['id'] = this.id;
    data['price'] = this.price;
    data['productType'] = this.productType;
    data['longDescription'] = this.longDescription;
    data['isFeatured'] = this.isFeatured;
    data['status'] = this.status;
    data['title'] = this.title;
    data['thumbImages'] = this.thumbImages;
    data['listingPrice'] = this.listingPrice;
    data['totalOrders'] = this.totalOrders;
    return data;
  }
}
