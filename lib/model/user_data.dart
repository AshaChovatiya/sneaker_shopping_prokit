class UserData {
  GetUser? getUser;

  UserData({this.getUser});

  UserData.fromJson(Map<String, dynamic> json) {
    getUser =
        json['getUser'] != null ? new GetUser.fromJson(json['getUser']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getUser != null) {
      data['getUser'] = this.getUser!.toJson();
    }
    return data;
  }
}

class GetUser {
  String? id;
  String? address;
  String? area;
  String? authProvider;
  String? city;
  String? country;
  String? createdAt;
  String? dob;
  String? email;
  String? firstName;
  String? gender;
  bool? isActive;
  bool? isAdmin;
  bool? isCognitoConfirmed;
  String? landmark;
  String? lastName;
  String? location;
  String? phone;
  String? pinCode;
  String? profilePhotoUrl;
  String? state;
  int? totalOrders;
  double? totalSpent;
  double? walletBalance;
  double? walletSpent;

  GetUser(
      {this.id,
      this.address,
      this.area,
      this.authProvider,
      this.city,
      this.country,
      this.createdAt,
      this.dob,
      this.email,
      this.firstName,
      this.gender,
      this.isActive,
      this.isAdmin,
      this.isCognitoConfirmed,
      this.landmark,
      this.lastName,
      this.location,
      this.phone,
      this.pinCode,
      this.profilePhotoUrl,
      this.state,
      this.totalOrders,
      this.totalSpent,
      this.walletBalance,
      this.walletSpent});

  GetUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    area = json['area'];
    authProvider = json['authProvider'];
    city = json['city'];
    country = json['country'];
    createdAt = json['createdAt'];
    dob = json['dob'];
    email = json['email'];
    firstName = json['firstName'];
    gender = json['gender'];
    isActive = json['isActive'];
    isAdmin = json['isAdmin'];
    isCognitoConfirmed = json['isCognitoConfirmed'];
    landmark = json['landmark'];
    lastName = json['lastName'];
    location = json['location'];
    phone = json['phone'];
    pinCode = json['pinCode'];
    profilePhotoUrl = json['profilePhotoUrl'];
    state = json['state'];
    totalOrders = json['totalOrders'];
    totalSpent = json['totalSpent'];
    walletBalance = json['walletBalance'];
    walletSpent = json['walletSpent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address'] = this.address;
    data['area'] = this.area;
    data['authProvider'] = this.authProvider;
    data['city'] = this.city;
    data['country'] = this.country;
    data['createdAt'] = this.createdAt;
    data['dob'] = this.dob;
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['gender'] = this.gender;
    data['isActive'] = this.isActive;
    data['isAdmin'] = this.isAdmin;
    data['isCognitoConfirmed'] = this.isCognitoConfirmed;
    data['landmark'] = this.landmark;
    data['lastName'] = this.lastName;
    data['location'] = this.location;
    data['phone'] = this.phone;
    data['pinCode'] = this.pinCode;
    data['profilePhotoUrl'] = this.profilePhotoUrl;
    data['state'] = this.state;
    data['totalOrders'] = this.totalOrders;
    data['totalSpent'] = this.totalSpent;
    data['walletBalance'] = this.walletBalance;
    data['walletSpent'] = this.walletSpent;
    return data;
  }
}
