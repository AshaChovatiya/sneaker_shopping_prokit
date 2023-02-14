/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the User type in your schema. */
@immutable
class User extends Model {
  static const classType = const _UserModelType();
  final String id;
  final String? _owner;
  final String? _firstName;
  final String? _lastName;
  final String? _email;
  final String? _phone;
  final String? _gender;
  final TemporalDate? _dob;
  final String? _country;
  final String? _state;
  final String? _city;
  final String? _pinCode;
  final String? _landmark;
  final String? _address;
  final String? _location;
  final String? _area;
  final bool? _isActive;
  final String? _authProvider;
  final int? _totalOrders;
  final double? _totalSpent;
  final double? _walletBalance;
  final double? _walletSpent;
  final double? _totalStoreCredit;
  final bool? _isAdmin;
  final String? _profilePhotoUrl;
  final List<Wishlist>? _wishlists;
  final List<ShoppingCart>? _shopingcarts;
  final List<Review>? _reviews;
  final List<Order>? _orders;
  final List<Payment>? _payments;
  final List<UserAddress>? _userAddress;
  final List<CouponCode>? _couponCodes;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  UserModelIdentifier get modelIdentifier {
      return UserModelIdentifier(
        id: id
      );
  }
  
  String? get owner {
    return _owner;
  }
  
  String? get firstName {
    return _firstName;
  }
  
  String? get lastName {
    return _lastName;
  }
  
  String? get email {
    return _email;
  }
  
  String? get phone {
    return _phone;
  }
  
  String? get gender {
    return _gender;
  }
  
  TemporalDate? get dob {
    return _dob;
  }
  
  String? get country {
    return _country;
  }
  
  String? get state {
    return _state;
  }
  
  String? get city {
    return _city;
  }
  
  String? get pinCode {
    return _pinCode;
  }
  
  String? get landmark {
    return _landmark;
  }
  
  String? get address {
    return _address;
  }
  
  String? get location {
    return _location;
  }
  
  String? get area {
    return _area;
  }
  
  bool? get isActive {
    return _isActive;
  }
  
  String? get authProvider {
    return _authProvider;
  }
  
  int? get totalOrders {
    return _totalOrders;
  }
  
  double? get totalSpent {
    return _totalSpent;
  }
  
  double? get walletBalance {
    return _walletBalance;
  }
  
  double? get walletSpent {
    return _walletSpent;
  }
  
  double? get totalStoreCredit {
    return _totalStoreCredit;
  }
  
  bool? get isAdmin {
    return _isAdmin;
  }
  
  String? get profilePhotoUrl {
    return _profilePhotoUrl;
  }
  
  List<Wishlist>? get wishlists {
    return _wishlists;
  }
  
  List<ShoppingCart>? get shopingcarts {
    return _shopingcarts;
  }
  
  List<Review>? get reviews {
    return _reviews;
  }
  
  List<Order>? get orders {
    return _orders;
  }
  
  List<Payment>? get payments {
    return _payments;
  }
  
  List<UserAddress>? get userAddress {
    return _userAddress;
  }
  
  List<CouponCode>? get couponCodes {
    return _couponCodes;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const User._internal({required this.id, owner, firstName, lastName, email, phone, gender, dob, country, state, city, pinCode, landmark, address, location, area, isActive, authProvider, totalOrders, totalSpent, walletBalance, walletSpent, totalStoreCredit, isAdmin, profilePhotoUrl, wishlists, shopingcarts, reviews, orders, payments, userAddress, couponCodes, createdAt, updatedAt}): _owner = owner, _firstName = firstName, _lastName = lastName, _email = email, _phone = phone, _gender = gender, _dob = dob, _country = country, _state = state, _city = city, _pinCode = pinCode, _landmark = landmark, _address = address, _location = location, _area = area, _isActive = isActive, _authProvider = authProvider, _totalOrders = totalOrders, _totalSpent = totalSpent, _walletBalance = walletBalance, _walletSpent = walletSpent, _totalStoreCredit = totalStoreCredit, _isAdmin = isAdmin, _profilePhotoUrl = profilePhotoUrl, _wishlists = wishlists, _shopingcarts = shopingcarts, _reviews = reviews, _orders = orders, _payments = payments, _userAddress = userAddress, _couponCodes = couponCodes, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory User({String? id, String? owner, String? firstName, String? lastName, String? email, String? phone, String? gender, TemporalDate? dob, String? country, String? state, String? city, String? pinCode, String? landmark, String? address, String? location, String? area, bool? isActive, String? authProvider, int? totalOrders, double? totalSpent, double? walletBalance, double? walletSpent, double? totalStoreCredit, bool? isAdmin, String? profilePhotoUrl, List<Wishlist>? wishlists, List<ShoppingCart>? shopingcarts, List<Review>? reviews, List<Order>? orders, List<Payment>? payments, List<UserAddress>? userAddress, List<CouponCode>? couponCodes, TemporalDateTime? createdAt, TemporalDateTime? updatedAt}) {
    return User._internal(
      id: id == null ? UUID.getUUID() : id,
      owner: owner,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      gender: gender,
      dob: dob,
      country: country,
      state: state,
      city: city,
      pinCode: pinCode,
      landmark: landmark,
      address: address,
      location: location,
      area: area,
      isActive: isActive,
      authProvider: authProvider,
      totalOrders: totalOrders,
      totalSpent: totalSpent,
      walletBalance: walletBalance,
      walletSpent: walletSpent,
      totalStoreCredit: totalStoreCredit,
      isAdmin: isAdmin,
      profilePhotoUrl: profilePhotoUrl,
      wishlists: wishlists != null ? List<Wishlist>.unmodifiable(wishlists) : wishlists,
      shopingcarts: shopingcarts != null ? List<ShoppingCart>.unmodifiable(shopingcarts) : shopingcarts,
      reviews: reviews != null ? List<Review>.unmodifiable(reviews) : reviews,
      orders: orders != null ? List<Order>.unmodifiable(orders) : orders,
      payments: payments != null ? List<Payment>.unmodifiable(payments) : payments,
      userAddress: userAddress != null ? List<UserAddress>.unmodifiable(userAddress) : userAddress,
      couponCodes: couponCodes != null ? List<CouponCode>.unmodifiable(couponCodes) : couponCodes,
      createdAt: createdAt,
      updatedAt: updatedAt);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
      id == other.id &&
      _owner == other._owner &&
      _firstName == other._firstName &&
      _lastName == other._lastName &&
      _email == other._email &&
      _phone == other._phone &&
      _gender == other._gender &&
      _dob == other._dob &&
      _country == other._country &&
      _state == other._state &&
      _city == other._city &&
      _pinCode == other._pinCode &&
      _landmark == other._landmark &&
      _address == other._address &&
      _location == other._location &&
      _area == other._area &&
      _isActive == other._isActive &&
      _authProvider == other._authProvider &&
      _totalOrders == other._totalOrders &&
      _totalSpent == other._totalSpent &&
      _walletBalance == other._walletBalance &&
      _walletSpent == other._walletSpent &&
      _totalStoreCredit == other._totalStoreCredit &&
      _isAdmin == other._isAdmin &&
      _profilePhotoUrl == other._profilePhotoUrl &&
      DeepCollectionEquality().equals(_wishlists, other._wishlists) &&
      DeepCollectionEquality().equals(_shopingcarts, other._shopingcarts) &&
      DeepCollectionEquality().equals(_reviews, other._reviews) &&
      DeepCollectionEquality().equals(_orders, other._orders) &&
      DeepCollectionEquality().equals(_payments, other._payments) &&
      DeepCollectionEquality().equals(_userAddress, other._userAddress) &&
      DeepCollectionEquality().equals(_couponCodes, other._couponCodes) &&
      _createdAt == other._createdAt &&
      _updatedAt == other._updatedAt;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("User {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("owner=" + "$_owner" + ", ");
    buffer.write("firstName=" + "$_firstName" + ", ");
    buffer.write("lastName=" + "$_lastName" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("phone=" + "$_phone" + ", ");
    buffer.write("gender=" + "$_gender" + ", ");
    buffer.write("dob=" + (_dob != null ? _dob!.format() : "null") + ", ");
    buffer.write("country=" + "$_country" + ", ");
    buffer.write("state=" + "$_state" + ", ");
    buffer.write("city=" + "$_city" + ", ");
    buffer.write("pinCode=" + "$_pinCode" + ", ");
    buffer.write("landmark=" + "$_landmark" + ", ");
    buffer.write("address=" + "$_address" + ", ");
    buffer.write("location=" + "$_location" + ", ");
    buffer.write("area=" + "$_area" + ", ");
    buffer.write("isActive=" + (_isActive != null ? _isActive!.toString() : "null") + ", ");
    buffer.write("authProvider=" + "$_authProvider" + ", ");
    buffer.write("totalOrders=" + (_totalOrders != null ? _totalOrders!.toString() : "null") + ", ");
    buffer.write("totalSpent=" + (_totalSpent != null ? _totalSpent!.toString() : "null") + ", ");
    buffer.write("walletBalance=" + (_walletBalance != null ? _walletBalance!.toString() : "null") + ", ");
    buffer.write("walletSpent=" + (_walletSpent != null ? _walletSpent!.toString() : "null") + ", ");
    buffer.write("totalStoreCredit=" + (_totalStoreCredit != null ? _totalStoreCredit!.toString() : "null") + ", ");
    buffer.write("isAdmin=" + (_isAdmin != null ? _isAdmin!.toString() : "null") + ", ");
    buffer.write("profilePhotoUrl=" + "$_profilePhotoUrl" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  User copyWith({String? owner, String? firstName, String? lastName, String? email, String? phone, String? gender, TemporalDate? dob, String? country, String? state, String? city, String? pinCode, String? landmark, String? address, String? location, String? area, bool? isActive, String? authProvider, int? totalOrders, double? totalSpent, double? walletBalance, double? walletSpent, double? totalStoreCredit, bool? isAdmin, String? profilePhotoUrl, List<Wishlist>? wishlists, List<ShoppingCart>? shopingcarts, List<Review>? reviews, List<Order>? orders, List<Payment>? payments, List<UserAddress>? userAddress, List<CouponCode>? couponCodes, TemporalDateTime? createdAt, TemporalDateTime? updatedAt}) {
    return User._internal(
      id: id,
      owner: owner ?? this.owner,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      country: country ?? this.country,
      state: state ?? this.state,
      city: city ?? this.city,
      pinCode: pinCode ?? this.pinCode,
      landmark: landmark ?? this.landmark,
      address: address ?? this.address,
      location: location ?? this.location,
      area: area ?? this.area,
      isActive: isActive ?? this.isActive,
      authProvider: authProvider ?? this.authProvider,
      totalOrders: totalOrders ?? this.totalOrders,
      totalSpent: totalSpent ?? this.totalSpent,
      walletBalance: walletBalance ?? this.walletBalance,
      walletSpent: walletSpent ?? this.walletSpent,
      totalStoreCredit: totalStoreCredit ?? this.totalStoreCredit,
      isAdmin: isAdmin ?? this.isAdmin,
      profilePhotoUrl: profilePhotoUrl ?? this.profilePhotoUrl,
      wishlists: wishlists ?? this.wishlists,
      shopingcarts: shopingcarts ?? this.shopingcarts,
      reviews: reviews ?? this.reviews,
      orders: orders ?? this.orders,
      payments: payments ?? this.payments,
      userAddress: userAddress ?? this.userAddress,
      couponCodes: couponCodes ?? this.couponCodes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt);
  }
  
  User.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _owner = json['owner'],
      _firstName = json['firstName'],
      _lastName = json['lastName'],
      _email = json['email'],
      _phone = json['phone'],
      _gender = json['gender'],
      _dob = json['dob'] != null ? TemporalDate.fromString(json['dob']) : null,
      _country = json['country'],
      _state = json['state'],
      _city = json['city'],
      _pinCode = json['pinCode'],
      _landmark = json['landmark'],
      _address = json['address'],
      _location = json['location'],
      _area = json['area'],
      _isActive = json['isActive'],
      _authProvider = json['authProvider'],
      _totalOrders = (json['totalOrders'] as num?)?.toInt(),
      _totalSpent = (json['totalSpent'] as num?)?.toDouble(),
      _walletBalance = (json['walletBalance'] as num?)?.toDouble(),
      _walletSpent = (json['walletSpent'] as num?)?.toDouble(),
      _totalStoreCredit = (json['totalStoreCredit'] as num?)?.toDouble(),
      _isAdmin = json['isAdmin'],
      _profilePhotoUrl = json['profilePhotoUrl'],
      _wishlists = json['wishlists'] is List
        ? (json['wishlists'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Wishlist.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _shopingcarts = json['shopingcarts'] is List
        ? (json['shopingcarts'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => ShoppingCart.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _reviews = json['reviews'] is List
        ? (json['reviews'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Review.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _orders = json['orders'] is List
        ? (json['orders'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Order.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _payments = json['payments'] is List
        ? (json['payments'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Payment.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _userAddress = json['userAddress'] is List
        ? (json['userAddress'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => UserAddress.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _couponCodes = json['couponCodes'] is List
        ? (json['couponCodes'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => CouponCode.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'owner': _owner, 'firstName': _firstName, 'lastName': _lastName, 'email': _email, 'phone': _phone, 'gender': _gender, 'dob': _dob?.format(), 'country': _country, 'state': _state, 'city': _city, 'pinCode': _pinCode, 'landmark': _landmark, 'address': _address, 'location': _location, 'area': _area, 'isActive': _isActive, 'authProvider': _authProvider, 'totalOrders': _totalOrders, 'totalSpent': _totalSpent, 'walletBalance': _walletBalance, 'walletSpent': _walletSpent, 'totalStoreCredit': _totalStoreCredit, 'isAdmin': _isAdmin, 'profilePhotoUrl': _profilePhotoUrl, 'wishlists': _wishlists?.map((Wishlist? e) => e?.toJson()).toList(), 'shopingcarts': _shopingcarts?.map((ShoppingCart? e) => e?.toJson()).toList(), 'reviews': _reviews?.map((Review? e) => e?.toJson()).toList(), 'orders': _orders?.map((Order? e) => e?.toJson()).toList(), 'payments': _payments?.map((Payment? e) => e?.toJson()).toList(), 'userAddress': _userAddress?.map((UserAddress? e) => e?.toJson()).toList(), 'couponCodes': _couponCodes?.map((CouponCode? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'owner': _owner, 'firstName': _firstName, 'lastName': _lastName, 'email': _email, 'phone': _phone, 'gender': _gender, 'dob': _dob, 'country': _country, 'state': _state, 'city': _city, 'pinCode': _pinCode, 'landmark': _landmark, 'address': _address, 'location': _location, 'area': _area, 'isActive': _isActive, 'authProvider': _authProvider, 'totalOrders': _totalOrders, 'totalSpent': _totalSpent, 'walletBalance': _walletBalance, 'walletSpent': _walletSpent, 'totalStoreCredit': _totalStoreCredit, 'isAdmin': _isAdmin, 'profilePhotoUrl': _profilePhotoUrl, 'wishlists': _wishlists, 'shopingcarts': _shopingcarts, 'reviews': _reviews, 'orders': _orders, 'payments': _payments, 'userAddress': _userAddress, 'couponCodes': _couponCodes, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<UserModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<UserModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField OWNER = QueryField(fieldName: "owner");
  static final QueryField FIRSTNAME = QueryField(fieldName: "firstName");
  static final QueryField LASTNAME = QueryField(fieldName: "lastName");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField PHONE = QueryField(fieldName: "phone");
  static final QueryField GENDER = QueryField(fieldName: "gender");
  static final QueryField DOB = QueryField(fieldName: "dob");
  static final QueryField COUNTRY = QueryField(fieldName: "country");
  static final QueryField STATE = QueryField(fieldName: "state");
  static final QueryField CITY = QueryField(fieldName: "city");
  static final QueryField PINCODE = QueryField(fieldName: "pinCode");
  static final QueryField LANDMARK = QueryField(fieldName: "landmark");
  static final QueryField ADDRESS = QueryField(fieldName: "address");
  static final QueryField LOCATION = QueryField(fieldName: "location");
  static final QueryField AREA = QueryField(fieldName: "area");
  static final QueryField ISACTIVE = QueryField(fieldName: "isActive");
  static final QueryField AUTHPROVIDER = QueryField(fieldName: "authProvider");
  static final QueryField TOTALORDERS = QueryField(fieldName: "totalOrders");
  static final QueryField TOTALSPENT = QueryField(fieldName: "totalSpent");
  static final QueryField WALLETBALANCE = QueryField(fieldName: "walletBalance");
  static final QueryField WALLETSPENT = QueryField(fieldName: "walletSpent");
  static final QueryField TOTALSTORECREDIT = QueryField(fieldName: "totalStoreCredit");
  static final QueryField ISADMIN = QueryField(fieldName: "isAdmin");
  static final QueryField PROFILEPHOTOURL = QueryField(fieldName: "profilePhotoUrl");
  static final QueryField WISHLISTS = QueryField(
    fieldName: "wishlists",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Wishlist'));
  static final QueryField SHOPINGCARTS = QueryField(
    fieldName: "shopingcarts",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'ShoppingCart'));
  static final QueryField REVIEWS = QueryField(
    fieldName: "reviews",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Review'));
  static final QueryField ORDERS = QueryField(
    fieldName: "orders",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Order'));
  static final QueryField PAYMENTS = QueryField(
    fieldName: "payments",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Payment'));
  static final QueryField USERADDRESS = QueryField(
    fieldName: "userAddress",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'UserAddress'));
  static final QueryField COUPONCODES = QueryField(
    fieldName: "couponCodes",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'CouponCode'));
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField UPDATEDAT = QueryField(fieldName: "updatedAt");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "User";
    modelSchemaDefinition.pluralName = "Users";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.READ
        ]),
      AuthRule(
        authStrategy: AuthStrategy.PRIVATE,
        operations: [
          ModelOperation.READ
        ]),
      AuthRule(
        authStrategy: AuthStrategy.OWNER,
        ownerField: "owner",
        identityClaim: "sub",
        provider: AuthRuleProvider.USERPOOLS,
        operations: [
          ModelOperation.READ,
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.OWNER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.FIRSTNAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.LASTNAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.EMAIL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.PHONE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.GENDER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.DOB,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.COUNTRY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.STATE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.CITY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.PINCODE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.LANDMARK,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.ADDRESS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.LOCATION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.AREA,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.ISACTIVE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.AUTHPROVIDER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.TOTALORDERS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.TOTALSPENT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.WALLETBALANCE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.WALLETSPENT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.TOTALSTORECREDIT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.ISADMIN,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.PROFILEPHOTOURL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: User.WISHLISTS,
      isRequired: false,
      ofModelName: 'Wishlist',
      associatedKey: Wishlist.USERID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: User.SHOPINGCARTS,
      isRequired: false,
      ofModelName: 'ShoppingCart',
      associatedKey: ShoppingCart.USERID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: User.REVIEWS,
      isRequired: false,
      ofModelName: 'Review',
      associatedKey: Review.USERID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: User.ORDERS,
      isRequired: false,
      ofModelName: 'Order',
      associatedKey: Order.USERID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: User.PAYMENTS,
      isRequired: false,
      ofModelName: 'Payment',
      associatedKey: Payment.USERID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: User.USERADDRESS,
      isRequired: false,
      ofModelName: 'UserAddress',
      associatedKey: UserAddress.USERID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: User.COUPONCODES,
      isRequired: false,
      ofModelName: 'CouponCode',
      associatedKey: CouponCode.USERID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.CREATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.UPDATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _UserModelType extends ModelType<User> {
  const _UserModelType();
  
  @override
  User fromJson(Map<String, dynamic> jsonData) {
    return User.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'User';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [User] in your schema.
 */
@immutable
class UserModelIdentifier implements ModelIdentifier<User> {
  final String id;

  /** Create an instance of UserModelIdentifier using [id] the primary key. */
  const UserModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'UserModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is UserModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}