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


/** This is an auto generated class representing the Order type in your schema. */
@immutable
class Order extends Model {
  static const classType = const _OrderModelType();
  final String id;
  final String? _code;
  final String? _userId;
  final User? _user;
  final String? _channelName;
  final Address? _shippingAddress;
  final Address? _BillingAddress;
  final double? _totalStoreCredit;
  final String? _CouponCodeId;
  final double? _totalCashOnDeliveryCharges;
  final double? _totalDiscount;
  final double? _totalGiftCharges;
  final double? _totalPrepaidAmount;
  final double? _totalShippingCharges;
  final bool? _taxExempted;
  final bool? _cFormProvided;
  final bool? _thirdPartyShipping;
  final TemporalDateTime? _sla;
  final int? _priority;
  final TemporalDateTime? _orderDate;
  final OrderStatus? _status;
  final List<OrderProduct>? _products;
  final List<Payment>? _payments;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  OrderModelIdentifier get modelIdentifier {
      return OrderModelIdentifier(
        id: id
      );
  }
  
  String? get code {
    return _code;
  }
  
  String? get userId {
    return _userId;
  }
  
  User? get user {
    return _user;
  }
  
  String? get channelName {
    return _channelName;
  }
  
  Address? get shippingAddress {
    return _shippingAddress;
  }
  
  Address? get BillingAddress {
    return _BillingAddress;
  }
  
  double? get totalStoreCredit {
    return _totalStoreCredit;
  }
  
  String? get CouponCodeId {
    return _CouponCodeId;
  }
  
  double? get totalCashOnDeliveryCharges {
    return _totalCashOnDeliveryCharges;
  }
  
  double? get totalDiscount {
    return _totalDiscount;
  }
  
  double? get totalGiftCharges {
    return _totalGiftCharges;
  }
  
  double? get totalPrepaidAmount {
    return _totalPrepaidAmount;
  }
  
  double? get totalShippingCharges {
    return _totalShippingCharges;
  }
  
  bool? get taxExempted {
    return _taxExempted;
  }
  
  bool? get cFormProvided {
    return _cFormProvided;
  }
  
  bool? get thirdPartyShipping {
    return _thirdPartyShipping;
  }
  
  TemporalDateTime? get sla {
    return _sla;
  }
  
  int? get priority {
    return _priority;
  }
  
  TemporalDateTime? get orderDate {
    return _orderDate;
  }
  
  OrderStatus get status {
    try {
      return _status!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<OrderProduct>? get products {
    return _products;
  }
  
  List<Payment>? get payments {
    return _payments;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Order._internal({required this.id, code, userId, user, channelName, shippingAddress, BillingAddress, totalStoreCredit, CouponCodeId, totalCashOnDeliveryCharges, totalDiscount, totalGiftCharges, totalPrepaidAmount, totalShippingCharges, taxExempted, cFormProvided, thirdPartyShipping, sla, priority, orderDate, required status, products, payments, createdAt, updatedAt}): _code = code, _userId = userId, _user = user, _channelName = channelName, _shippingAddress = shippingAddress, _BillingAddress = BillingAddress, _totalStoreCredit = totalStoreCredit, _CouponCodeId = CouponCodeId, _totalCashOnDeliveryCharges = totalCashOnDeliveryCharges, _totalDiscount = totalDiscount, _totalGiftCharges = totalGiftCharges, _totalPrepaidAmount = totalPrepaidAmount, _totalShippingCharges = totalShippingCharges, _taxExempted = taxExempted, _cFormProvided = cFormProvided, _thirdPartyShipping = thirdPartyShipping, _sla = sla, _priority = priority, _orderDate = orderDate, _status = status, _products = products, _payments = payments, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Order({String? id, String? code, String? userId, User? user, String? channelName, Address? shippingAddress, Address? BillingAddress, double? totalStoreCredit, String? CouponCodeId, double? totalCashOnDeliveryCharges, double? totalDiscount, double? totalGiftCharges, double? totalPrepaidAmount, double? totalShippingCharges, bool? taxExempted, bool? cFormProvided, bool? thirdPartyShipping, TemporalDateTime? sla, int? priority, TemporalDateTime? orderDate, required OrderStatus status, List<OrderProduct>? products, List<Payment>? payments, TemporalDateTime? createdAt, TemporalDateTime? updatedAt}) {
    return Order._internal(
      id: id == null ? UUID.getUUID() : id,
      code: code,
      userId: userId,
      user: user,
      channelName: channelName,
      shippingAddress: shippingAddress,
      BillingAddress: BillingAddress,
      totalStoreCredit: totalStoreCredit,
      CouponCodeId: CouponCodeId,
      totalCashOnDeliveryCharges: totalCashOnDeliveryCharges,
      totalDiscount: totalDiscount,
      totalGiftCharges: totalGiftCharges,
      totalPrepaidAmount: totalPrepaidAmount,
      totalShippingCharges: totalShippingCharges,
      taxExempted: taxExempted,
      cFormProvided: cFormProvided,
      thirdPartyShipping: thirdPartyShipping,
      sla: sla,
      priority: priority,
      orderDate: orderDate,
      status: status,
      products: products != null ? List<OrderProduct>.unmodifiable(products) : products,
      payments: payments != null ? List<Payment>.unmodifiable(payments) : payments,
      createdAt: createdAt,
      updatedAt: updatedAt);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Order &&
      id == other.id &&
      _code == other._code &&
      _userId == other._userId &&
      _user == other._user &&
      _channelName == other._channelName &&
      _shippingAddress == other._shippingAddress &&
      _BillingAddress == other._BillingAddress &&
      _totalStoreCredit == other._totalStoreCredit &&
      _CouponCodeId == other._CouponCodeId &&
      _totalCashOnDeliveryCharges == other._totalCashOnDeliveryCharges &&
      _totalDiscount == other._totalDiscount &&
      _totalGiftCharges == other._totalGiftCharges &&
      _totalPrepaidAmount == other._totalPrepaidAmount &&
      _totalShippingCharges == other._totalShippingCharges &&
      _taxExempted == other._taxExempted &&
      _cFormProvided == other._cFormProvided &&
      _thirdPartyShipping == other._thirdPartyShipping &&
      _sla == other._sla &&
      _priority == other._priority &&
      _orderDate == other._orderDate &&
      _status == other._status &&
      DeepCollectionEquality().equals(_products, other._products) &&
      DeepCollectionEquality().equals(_payments, other._payments) &&
      _createdAt == other._createdAt &&
      _updatedAt == other._updatedAt;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Order {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("code=" + "$_code" + ", ");
    buffer.write("userId=" + "$_userId" + ", ");
    buffer.write("channelName=" + "$_channelName" + ", ");
    buffer.write("shippingAddress=" + (_shippingAddress != null ? _shippingAddress!.toString() : "null") + ", ");
    buffer.write("BillingAddress=" + (_BillingAddress != null ? _BillingAddress!.toString() : "null") + ", ");
    buffer.write("totalStoreCredit=" + (_totalStoreCredit != null ? _totalStoreCredit!.toString() : "null") + ", ");
    buffer.write("CouponCodeId=" + "$_CouponCodeId" + ", ");
    buffer.write("totalCashOnDeliveryCharges=" + (_totalCashOnDeliveryCharges != null ? _totalCashOnDeliveryCharges!.toString() : "null") + ", ");
    buffer.write("totalDiscount=" + (_totalDiscount != null ? _totalDiscount!.toString() : "null") + ", ");
    buffer.write("totalGiftCharges=" + (_totalGiftCharges != null ? _totalGiftCharges!.toString() : "null") + ", ");
    buffer.write("totalPrepaidAmount=" + (_totalPrepaidAmount != null ? _totalPrepaidAmount!.toString() : "null") + ", ");
    buffer.write("totalShippingCharges=" + (_totalShippingCharges != null ? _totalShippingCharges!.toString() : "null") + ", ");
    buffer.write("taxExempted=" + (_taxExempted != null ? _taxExempted!.toString() : "null") + ", ");
    buffer.write("cFormProvided=" + (_cFormProvided != null ? _cFormProvided!.toString() : "null") + ", ");
    buffer.write("thirdPartyShipping=" + (_thirdPartyShipping != null ? _thirdPartyShipping!.toString() : "null") + ", ");
    buffer.write("sla=" + (_sla != null ? _sla!.format() : "null") + ", ");
    buffer.write("priority=" + (_priority != null ? _priority!.toString() : "null") + ", ");
    buffer.write("orderDate=" + (_orderDate != null ? _orderDate!.format() : "null") + ", ");
    buffer.write("status=" + (_status != null ? enumToString(_status)! : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Order copyWith({String? code, String? userId, User? user, String? channelName, Address? shippingAddress, Address? BillingAddress, double? totalStoreCredit, String? CouponCodeId, double? totalCashOnDeliveryCharges, double? totalDiscount, double? totalGiftCharges, double? totalPrepaidAmount, double? totalShippingCharges, bool? taxExempted, bool? cFormProvided, bool? thirdPartyShipping, TemporalDateTime? sla, int? priority, TemporalDateTime? orderDate, OrderStatus? status, List<OrderProduct>? products, List<Payment>? payments, TemporalDateTime? createdAt, TemporalDateTime? updatedAt}) {
    return Order._internal(
      id: id,
      code: code ?? this.code,
      userId: userId ?? this.userId,
      user: user ?? this.user,
      channelName: channelName ?? this.channelName,
      shippingAddress: shippingAddress ?? this.shippingAddress,
      BillingAddress: BillingAddress ?? this.BillingAddress,
      totalStoreCredit: totalStoreCredit ?? this.totalStoreCredit,
      CouponCodeId: CouponCodeId ?? this.CouponCodeId,
      totalCashOnDeliveryCharges: totalCashOnDeliveryCharges ?? this.totalCashOnDeliveryCharges,
      totalDiscount: totalDiscount ?? this.totalDiscount,
      totalGiftCharges: totalGiftCharges ?? this.totalGiftCharges,
      totalPrepaidAmount: totalPrepaidAmount ?? this.totalPrepaidAmount,
      totalShippingCharges: totalShippingCharges ?? this.totalShippingCharges,
      taxExempted: taxExempted ?? this.taxExempted,
      cFormProvided: cFormProvided ?? this.cFormProvided,
      thirdPartyShipping: thirdPartyShipping ?? this.thirdPartyShipping,
      sla: sla ?? this.sla,
      priority: priority ?? this.priority,
      orderDate: orderDate ?? this.orderDate,
      status: status ?? this.status,
      products: products ?? this.products,
      payments: payments ?? this.payments,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt);
  }
  
  Order.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _code = json['code'],
      _userId = json['userId'],
      _user = json['user']?['serializedData'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['user']['serializedData']))
        : null,
      _channelName = json['channelName'],
      _shippingAddress = json['shippingAddress']?['serializedData'] != null
        ? Address.fromJson(new Map<String, dynamic>.from(json['shippingAddress']['serializedData']))
        : null,
      _BillingAddress = json['BillingAddress']?['serializedData'] != null
        ? Address.fromJson(new Map<String, dynamic>.from(json['BillingAddress']['serializedData']))
        : null,
      _totalStoreCredit = (json['totalStoreCredit'] as num?)?.toDouble(),
      _CouponCodeId = json['CouponCodeId'],
      _totalCashOnDeliveryCharges = (json['totalCashOnDeliveryCharges'] as num?)?.toDouble(),
      _totalDiscount = (json['totalDiscount'] as num?)?.toDouble(),
      _totalGiftCharges = (json['totalGiftCharges'] as num?)?.toDouble(),
      _totalPrepaidAmount = (json['totalPrepaidAmount'] as num?)?.toDouble(),
      _totalShippingCharges = (json['totalShippingCharges'] as num?)?.toDouble(),
      _taxExempted = json['taxExempted'],
      _cFormProvided = json['cFormProvided'],
      _thirdPartyShipping = json['thirdPartyShipping'],
      _sla = json['sla'] != null ? TemporalDateTime.fromString(json['sla']) : null,
      _priority = (json['priority'] as num?)?.toInt(),
      _orderDate = json['orderDate'] != null ? TemporalDateTime.fromString(json['orderDate']) : null,
      _status = enumFromString<OrderStatus>(json['status'], OrderStatus.values),
      _products = json['products'] is List
        ? (json['products'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => OrderProduct.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _payments = json['payments'] is List
        ? (json['payments'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Payment.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'code': _code, 'userId': _userId, 'user': _user?.toJson(), 'channelName': _channelName, 'shippingAddress': _shippingAddress?.toJson(), 'BillingAddress': _BillingAddress?.toJson(), 'totalStoreCredit': _totalStoreCredit, 'CouponCodeId': _CouponCodeId, 'totalCashOnDeliveryCharges': _totalCashOnDeliveryCharges, 'totalDiscount': _totalDiscount, 'totalGiftCharges': _totalGiftCharges, 'totalPrepaidAmount': _totalPrepaidAmount, 'totalShippingCharges': _totalShippingCharges, 'taxExempted': _taxExempted, 'cFormProvided': _cFormProvided, 'thirdPartyShipping': _thirdPartyShipping, 'sla': _sla?.format(), 'priority': _priority, 'orderDate': _orderDate?.format(), 'status': enumToString(_status), 'products': _products?.map((OrderProduct? e) => e?.toJson()).toList(), 'payments': _payments?.map((Payment? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'code': _code, 'userId': _userId, 'user': _user, 'channelName': _channelName, 'shippingAddress': _shippingAddress, 'BillingAddress': _BillingAddress, 'totalStoreCredit': _totalStoreCredit, 'CouponCodeId': _CouponCodeId, 'totalCashOnDeliveryCharges': _totalCashOnDeliveryCharges, 'totalDiscount': _totalDiscount, 'totalGiftCharges': _totalGiftCharges, 'totalPrepaidAmount': _totalPrepaidAmount, 'totalShippingCharges': _totalShippingCharges, 'taxExempted': _taxExempted, 'cFormProvided': _cFormProvided, 'thirdPartyShipping': _thirdPartyShipping, 'sla': _sla, 'priority': _priority, 'orderDate': _orderDate, 'status': _status, 'products': _products, 'payments': _payments, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<OrderModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<OrderModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField CODE = QueryField(fieldName: "code");
  static final QueryField USERID = QueryField(fieldName: "userId");
  static final QueryField USER = QueryField(
    fieldName: "user",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'User'));
  static final QueryField CHANNELNAME = QueryField(fieldName: "channelName");
  static final QueryField SHIPPINGADDRESS = QueryField(fieldName: "shippingAddress");
  static final QueryField BILLINGADDRESS = QueryField(fieldName: "BillingAddress");
  static final QueryField TOTALSTORECREDIT = QueryField(fieldName: "totalStoreCredit");
  static final QueryField COUPONCODEID = QueryField(fieldName: "CouponCodeId");
  static final QueryField TOTALCASHONDELIVERYCHARGES = QueryField(fieldName: "totalCashOnDeliveryCharges");
  static final QueryField TOTALDISCOUNT = QueryField(fieldName: "totalDiscount");
  static final QueryField TOTALGIFTCHARGES = QueryField(fieldName: "totalGiftCharges");
  static final QueryField TOTALPREPAIDAMOUNT = QueryField(fieldName: "totalPrepaidAmount");
  static final QueryField TOTALSHIPPINGCHARGES = QueryField(fieldName: "totalShippingCharges");
  static final QueryField TAXEXEMPTED = QueryField(fieldName: "taxExempted");
  static final QueryField CFORMPROVIDED = QueryField(fieldName: "cFormProvided");
  static final QueryField THIRDPARTYSHIPPING = QueryField(fieldName: "thirdPartyShipping");
  static final QueryField SLA = QueryField(fieldName: "sla");
  static final QueryField PRIORITY = QueryField(fieldName: "priority");
  static final QueryField ORDERDATE = QueryField(fieldName: "orderDate");
  static final QueryField STATUS = QueryField(fieldName: "status");
  static final QueryField PRODUCTS = QueryField(
    fieldName: "products",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'OrderProduct'));
  static final QueryField PAYMENTS = QueryField(
    fieldName: "payments",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Payment'));
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField UPDATEDAT = QueryField(fieldName: "updatedAt");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Order";
    modelSchemaDefinition.pluralName = "Orders";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.READ,
          ModelOperation.CREATE
        ]),
      AuthRule(
        authStrategy: AuthStrategy.PRIVATE,
        operations: [
          ModelOperation.READ,
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      ModelIndex(fields: const ["userId", "createdAt"], name: "byuserIdcreatedAtOrder")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Order.CODE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Order.USERID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: Order.USER,
      isRequired: false,
      ofModelName: 'User',
      associatedKey: User.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Order.CHANNELNAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'shippingAddress',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'Address')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'BillingAddress',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'Address')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Order.TOTALSTORECREDIT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Order.COUPONCODEID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Order.TOTALCASHONDELIVERYCHARGES,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Order.TOTALDISCOUNT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Order.TOTALGIFTCHARGES,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Order.TOTALPREPAIDAMOUNT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Order.TOTALSHIPPINGCHARGES,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Order.TAXEXEMPTED,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Order.CFORMPROVIDED,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Order.THIRDPARTYSHIPPING,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Order.SLA,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Order.PRIORITY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Order.ORDERDATE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Order.STATUS,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Order.PRODUCTS,
      isRequired: false,
      ofModelName: 'OrderProduct',
      associatedKey: OrderProduct.ORDERID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Order.PAYMENTS,
      isRequired: false,
      ofModelName: 'Payment',
      associatedKey: Payment.ORDERID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Order.CREATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Order.UPDATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _OrderModelType extends ModelType<Order> {
  const _OrderModelType();
  
  @override
  Order fromJson(Map<String, dynamic> jsonData) {
    return Order.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Order';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Order] in your schema.
 */
@immutable
class OrderModelIdentifier implements ModelIdentifier<Order> {
  final String id;

  /** Create an instance of OrderModelIdentifier using [id] the primary key. */
  const OrderModelIdentifier({
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
  String toString() => 'OrderModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is OrderModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}