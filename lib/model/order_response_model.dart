class OrderResponseData {
  CreateOrder? createOrder;

  OrderResponseData({this.createOrder});

  OrderResponseData.fromJson(Map<String, dynamic> json) {
    createOrder = json['createOrder'] != null
        ? new CreateOrder.fromJson(json['createOrder'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.createOrder != null) {
      data['createOrder'] = this.createOrder!.toJson();
    }
    return data;
  }
}

class CreateOrder {
  String? id;
  double? totalAmount;
  double? totalCashOnDeliveryCharges;
  double? totalDiscount;
  double? totalShippingCharges;
  String? currency;

  CreateOrder(
      {this.id,
      this.totalAmount,
      this.totalCashOnDeliveryCharges,
      this.totalDiscount,
      this.totalShippingCharges,
      this.currency});

  CreateOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    totalAmount = json['totalAmount'];
    totalCashOnDeliveryCharges = json['totalCashOnDeliveryCharges'];
    totalDiscount = json['totalDiscount'];
    totalShippingCharges = json['totalShippingCharges'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['totalAmount'] = this.totalAmount;
    data['totalCashOnDeliveryCharges'] = this.totalCashOnDeliveryCharges;
    data['totalDiscount'] = this.totalDiscount;
    data['totalShippingCharges'] = this.totalShippingCharges;
    data['currency'] = this.currency;
    return data;
  }
}
