class UserAddressModel {
  ByuserIDUserAddress? byuserIDUserAddress;

  UserAddressModel({this.byuserIDUserAddress});

  UserAddressModel.fromJson(Map<String, dynamic> json) {
    byuserIDUserAddress = json['byuserIDUserAddress'] != null
        ? new ByuserIDUserAddress.fromJson(json['byuserIDUserAddress'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.byuserIDUserAddress != null) {
      data['byuserIDUserAddress'] = this.byuserIDUserAddress!.toJson();
    }
    return data;
  }
}

class ByuserIDUserAddress {
  List<UserAddressList>? userAddressList;

  ByuserIDUserAddress({this.userAddressList});

  ByuserIDUserAddress.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      userAddressList = <UserAddressList>[];
      json['items'].forEach((v) {
        userAddressList!.add(new UserAddressList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userAddressList != null) {
      data['items'] =
          this.userAddressList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserAddressList {
  String? city;
  String? country;
  String? userID;
  String? updatedAt;
  String? state;
  String? pinCode;
  String? phone;
  String? location;
  String? name;
  String? landmark;
  String? id;
  String? email;
  String? createdAt;
  String? area;
  String? address;

  UserAddressList(
      {this.city,
        this.country,
        this.userID,
        this.updatedAt,
        this.state,
        this.pinCode,
        this.phone,
        this.location,
        this.name,
        this.landmark,
        this.id,
        this.email,
        this.createdAt,
        this.area,
        this.address});

  UserAddressList.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    country = json['country'];
    userID = json['userID'];
    updatedAt = json['updatedAt'];
    state = json['state'];
    pinCode = json['pinCode'];
    phone = json['phone'];
    location = json['location'];
    name = json['name'];
    landmark = json['landmark'];
    id = json['id'];
    email = json['email'];
    createdAt = json['createdAt'];
    area = json['area'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['country'] = this.country;
    data['userID'] = this.userID;
    data['updatedAt'] = this.updatedAt;
    data['state'] = this.state;
    data['pinCode'] = this.pinCode;
    data['phone'] = this.phone;
    data['location'] = this.location;
    data['name'] = this.name;
    data['landmark'] = this.landmark;
    data['id'] = this.id;
    data['email'] = this.email;
    data['createdAt'] = this.createdAt;
    data['area'] = this.area;
    data['address'] = this.address;
    return data;
  }
}
