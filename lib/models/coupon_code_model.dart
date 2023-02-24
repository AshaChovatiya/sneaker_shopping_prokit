class CouponCodeData {
  ListCouponCodes? listCouponCodes;

  CouponCodeData({this.listCouponCodes});

  CouponCodeData.fromJson(Map<String, dynamic> json) {
    listCouponCodes = json['listCouponCodes'] != null
        ? new ListCouponCodes.fromJson(json['listCouponCodes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.listCouponCodes != null) {
      data['listCouponCodes'] = this.listCouponCodes!.toJson();
    }
    return data;
  }
}

class ListCouponCodes {
  String? nextToken;
  List<CouponCodeItems>? couponCodeItems;

  ListCouponCodes({this.nextToken, this.couponCodeItems});

  ListCouponCodes.fromJson(Map<String, dynamic> json) {
    nextToken = json['nextToken'];
    if (json['items'] != null) {
      couponCodeItems = <CouponCodeItems>[];
      json['items'].forEach((v) {
        couponCodeItems!.add(new CouponCodeItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nextToken'] = this.nextToken;
    if (this.couponCodeItems != null) {
      data['items'] = this.couponCodeItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CouponCodeItems {
  String? code;
  String? couponType;
  String? createdAt;
  String? description;
  double? discount;
  String? expirationDate;
  String? id;
  bool? isActive;
  bool? isFeatured;
  double? maxDiscount;
  int? maxUse;
  int? minOrderValue;
  String? paymentMethod;
  int? totalUsed;
  String? updatedAt;
  String? userId;

  CouponCodeItems(
      {this.code,
      this.couponType,
      this.createdAt,
      this.description,
      this.discount,
      this.expirationDate,
      this.id,
      this.isActive,
      this.isFeatured,
      this.maxDiscount,
      this.maxUse,
      this.minOrderValue,
      this.paymentMethod,
      this.totalUsed,
      this.updatedAt,
      this.userId});

  CouponCodeItems.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    couponType = json['couponType'];
    createdAt = json['createdAt'];
    description = json['description'];
    discount = json['discount'];
    expirationDate = json['expirationDate'];
    id = json['id'];
    isActive = json['isActive'];
    isFeatured = json['isFeatured'];
    maxDiscount = json['maxDiscount'];
    maxUse = json['maxUse'];
    minOrderValue = json['minOrderValue'];
    paymentMethod = json['paymentMethod'];
    totalUsed = json['totalUsed'];
    updatedAt = json['updatedAt'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['couponType'] = this.couponType;
    data['createdAt'] = this.createdAt;
    data['description'] = this.description;
    data['discount'] = this.discount;
    data['expirationDate'] = this.expirationDate;
    data['id'] = this.id;
    data['isActive'] = this.isActive;
    data['isFeatured'] = this.isFeatured;
    data['maxDiscount'] = this.maxDiscount;
    data['maxUse'] = this.maxUse;
    data['minOrderValue'] = this.minOrderValue;
    data['paymentMethod'] = this.paymentMethod;
    data['totalUsed'] = this.totalUsed;
    data['updatedAt'] = this.updatedAt;
    data['userId'] = this.userId;
    return data;
  }
}
