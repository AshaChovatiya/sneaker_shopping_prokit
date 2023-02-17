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
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the OrderProduct type in your schema. */
@immutable
class OrderProduct extends Model {
  static const classType = const _OrderProductModelType();
  final String id;
  final String? _orderId;
  final String? _productId;
  final Product? _product;
  final String? _variantId;
  final Variant? _variant;
  final String? _sku;
  final String? _returnReason;
  final String? _returnDate;
  final String? _returnAWB;
  final String? _returnShippingProvider;
  final String? _title;
  final String? _shippingMethodCode;
  final double? _cashOnDeliveryCharges;
  final double? _sellingPrice;
  final double? _shippingCharges;
  final double? _discount;
  final double? _totalPrice;
  final String? _currency;
  final bool? _onHold;
  final String? _facilityCode;
  final String? _gstin;
  final String? _additionalInfo;
  final double? _centralGstPercentage;
  final double? _compensationCessPercentage;
  final double? _integratedGstPercentage;
  final double? _stateGstPercentage;
  final double? _taxRate;
  final double? _unionTerritoryGstPercentage;
  final String? _deliveryPartner;
  final TemporalDateTime? _dispatchDate;
  final TemporalDateTime? _invoiceDate;
  final String? _invoiceNumber;
  final TemporalDateTime? _tentativeDeliveryDate;
  final String? _trackingId;
  final int? _quantity;
  final double? _price;
  final OrderStatus? _status;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  OrderProductModelIdentifier get modelIdentifier {
      return OrderProductModelIdentifier(
        id: id
      );
  }
  
  String get orderId {
    try {
      return _orderId!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get productId {
    try {
      return _productId!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Product? get product {
    return _product;
  }
  
  String? get variantId {
    return _variantId;
  }
  
  Variant? get variant {
    return _variant;
  }
  
  String? get sku {
    return _sku;
  }
  
  String? get returnReason {
    return _returnReason;
  }
  
  String? get returnDate {
    return _returnDate;
  }
  
  String? get returnAWB {
    return _returnAWB;
  }
  
  String? get returnShippingProvider {
    return _returnShippingProvider;
  }
  
  String? get title {
    return _title;
  }
  
  String? get shippingMethodCode {
    return _shippingMethodCode;
  }
  
  double? get cashOnDeliveryCharges {
    return _cashOnDeliveryCharges;
  }
  
  double? get sellingPrice {
    return _sellingPrice;
  }
  
  double? get shippingCharges {
    return _shippingCharges;
  }
  
  double? get discount {
    return _discount;
  }
  
  double? get totalPrice {
    return _totalPrice;
  }
  
  String? get currency {
    return _currency;
  }
  
  bool? get onHold {
    return _onHold;
  }
  
  String? get facilityCode {
    return _facilityCode;
  }
  
  String? get gstin {
    return _gstin;
  }
  
  String? get additionalInfo {
    return _additionalInfo;
  }
  
  double? get centralGstPercentage {
    return _centralGstPercentage;
  }
  
  double? get compensationCessPercentage {
    return _compensationCessPercentage;
  }
  
  double? get integratedGstPercentage {
    return _integratedGstPercentage;
  }
  
  double? get stateGstPercentage {
    return _stateGstPercentage;
  }
  
  double? get taxRate {
    return _taxRate;
  }
  
  double? get unionTerritoryGstPercentage {
    return _unionTerritoryGstPercentage;
  }
  
  String? get deliveryPartner {
    return _deliveryPartner;
  }
  
  TemporalDateTime? get dispatchDate {
    return _dispatchDate;
  }
  
  TemporalDateTime? get invoiceDate {
    return _invoiceDate;
  }
  
  String? get invoiceNumber {
    return _invoiceNumber;
  }
  
  TemporalDateTime? get tentativeDeliveryDate {
    return _tentativeDeliveryDate;
  }
  
  String? get trackingId {
    return _trackingId;
  }
  
  int get quantity {
    try {
      return _quantity!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double get price {
    try {
      return _price!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  OrderStatus? get status {
    return _status;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const OrderProduct._internal({required this.id, required orderId, required productId, product, variantId, variant, sku, returnReason, returnDate, returnAWB, returnShippingProvider, title, shippingMethodCode, cashOnDeliveryCharges, sellingPrice, shippingCharges, discount, totalPrice, currency, onHold, facilityCode, gstin, additionalInfo, centralGstPercentage, compensationCessPercentage, integratedGstPercentage, stateGstPercentage, taxRate, unionTerritoryGstPercentage, deliveryPartner, dispatchDate, invoiceDate, invoiceNumber, tentativeDeliveryDate, trackingId, required quantity, required price, status, createdAt, updatedAt}): _orderId = orderId, _productId = productId, _product = product, _variantId = variantId, _variant = variant, _sku = sku, _returnReason = returnReason, _returnDate = returnDate, _returnAWB = returnAWB, _returnShippingProvider = returnShippingProvider, _title = title, _shippingMethodCode = shippingMethodCode, _cashOnDeliveryCharges = cashOnDeliveryCharges, _sellingPrice = sellingPrice, _shippingCharges = shippingCharges, _discount = discount, _totalPrice = totalPrice, _currency = currency, _onHold = onHold, _facilityCode = facilityCode, _gstin = gstin, _additionalInfo = additionalInfo, _centralGstPercentage = centralGstPercentage, _compensationCessPercentage = compensationCessPercentage, _integratedGstPercentage = integratedGstPercentage, _stateGstPercentage = stateGstPercentage, _taxRate = taxRate, _unionTerritoryGstPercentage = unionTerritoryGstPercentage, _deliveryPartner = deliveryPartner, _dispatchDate = dispatchDate, _invoiceDate = invoiceDate, _invoiceNumber = invoiceNumber, _tentativeDeliveryDate = tentativeDeliveryDate, _trackingId = trackingId, _quantity = quantity, _price = price, _status = status, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory OrderProduct({String? id, required String orderId, required String productId, Product? product, String? variantId, Variant? variant, String? sku, String? returnReason, String? returnDate, String? returnAWB, String? returnShippingProvider, String? title, String? shippingMethodCode, double? cashOnDeliveryCharges, double? sellingPrice, double? shippingCharges, double? discount, double? totalPrice, String? currency, bool? onHold, String? facilityCode, String? gstin, String? additionalInfo, double? centralGstPercentage, double? compensationCessPercentage, double? integratedGstPercentage, double? stateGstPercentage, double? taxRate, double? unionTerritoryGstPercentage, String? deliveryPartner, TemporalDateTime? dispatchDate, TemporalDateTime? invoiceDate, String? invoiceNumber, TemporalDateTime? tentativeDeliveryDate, String? trackingId, required int quantity, required double price, OrderStatus? status, TemporalDateTime? createdAt, TemporalDateTime? updatedAt}) {
    return OrderProduct._internal(
      id: id == null ? UUID.getUUID() : id,
      orderId: orderId,
      productId: productId,
      product: product,
      variantId: variantId,
      variant: variant,
      sku: sku,
      returnReason: returnReason,
      returnDate: returnDate,
      returnAWB: returnAWB,
      returnShippingProvider: returnShippingProvider,
      title: title,
      shippingMethodCode: shippingMethodCode,
      cashOnDeliveryCharges: cashOnDeliveryCharges,
      sellingPrice: sellingPrice,
      shippingCharges: shippingCharges,
      discount: discount,
      totalPrice: totalPrice,
      currency: currency,
      onHold: onHold,
      facilityCode: facilityCode,
      gstin: gstin,
      additionalInfo: additionalInfo,
      centralGstPercentage: centralGstPercentage,
      compensationCessPercentage: compensationCessPercentage,
      integratedGstPercentage: integratedGstPercentage,
      stateGstPercentage: stateGstPercentage,
      taxRate: taxRate,
      unionTerritoryGstPercentage: unionTerritoryGstPercentage,
      deliveryPartner: deliveryPartner,
      dispatchDate: dispatchDate,
      invoiceDate: invoiceDate,
      invoiceNumber: invoiceNumber,
      tentativeDeliveryDate: tentativeDeliveryDate,
      trackingId: trackingId,
      quantity: quantity,
      price: price,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderProduct &&
      id == other.id &&
      _orderId == other._orderId &&
      _productId == other._productId &&
      _product == other._product &&
      _variantId == other._variantId &&
      _variant == other._variant &&
      _sku == other._sku &&
      _returnReason == other._returnReason &&
      _returnDate == other._returnDate &&
      _returnAWB == other._returnAWB &&
      _returnShippingProvider == other._returnShippingProvider &&
      _title == other._title &&
      _shippingMethodCode == other._shippingMethodCode &&
      _cashOnDeliveryCharges == other._cashOnDeliveryCharges &&
      _sellingPrice == other._sellingPrice &&
      _shippingCharges == other._shippingCharges &&
      _discount == other._discount &&
      _totalPrice == other._totalPrice &&
      _currency == other._currency &&
      _onHold == other._onHold &&
      _facilityCode == other._facilityCode &&
      _gstin == other._gstin &&
      _additionalInfo == other._additionalInfo &&
      _centralGstPercentage == other._centralGstPercentage &&
      _compensationCessPercentage == other._compensationCessPercentage &&
      _integratedGstPercentage == other._integratedGstPercentage &&
      _stateGstPercentage == other._stateGstPercentage &&
      _taxRate == other._taxRate &&
      _unionTerritoryGstPercentage == other._unionTerritoryGstPercentage &&
      _deliveryPartner == other._deliveryPartner &&
      _dispatchDate == other._dispatchDate &&
      _invoiceDate == other._invoiceDate &&
      _invoiceNumber == other._invoiceNumber &&
      _tentativeDeliveryDate == other._tentativeDeliveryDate &&
      _trackingId == other._trackingId &&
      _quantity == other._quantity &&
      _price == other._price &&
      _status == other._status &&
      _createdAt == other._createdAt &&
      _updatedAt == other._updatedAt;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("OrderProduct {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("orderId=" + "$_orderId" + ", ");
    buffer.write("productId=" + "$_productId" + ", ");
    buffer.write("variantId=" + "$_variantId" + ", ");
    buffer.write("sku=" + "$_sku" + ", ");
    buffer.write("returnReason=" + "$_returnReason" + ", ");
    buffer.write("returnDate=" + "$_returnDate" + ", ");
    buffer.write("returnAWB=" + "$_returnAWB" + ", ");
    buffer.write("returnShippingProvider=" + "$_returnShippingProvider" + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("shippingMethodCode=" + "$_shippingMethodCode" + ", ");
    buffer.write("cashOnDeliveryCharges=" + (_cashOnDeliveryCharges != null ? _cashOnDeliveryCharges!.toString() : "null") + ", ");
    buffer.write("sellingPrice=" + (_sellingPrice != null ? _sellingPrice!.toString() : "null") + ", ");
    buffer.write("shippingCharges=" + (_shippingCharges != null ? _shippingCharges!.toString() : "null") + ", ");
    buffer.write("discount=" + (_discount != null ? _discount!.toString() : "null") + ", ");
    buffer.write("totalPrice=" + (_totalPrice != null ? _totalPrice!.toString() : "null") + ", ");
    buffer.write("currency=" + "$_currency" + ", ");
    buffer.write("onHold=" + (_onHold != null ? _onHold!.toString() : "null") + ", ");
    buffer.write("facilityCode=" + "$_facilityCode" + ", ");
    buffer.write("gstin=" + "$_gstin" + ", ");
    buffer.write("additionalInfo=" + "$_additionalInfo" + ", ");
    buffer.write("centralGstPercentage=" + (_centralGstPercentage != null ? _centralGstPercentage!.toString() : "null") + ", ");
    buffer.write("compensationCessPercentage=" + (_compensationCessPercentage != null ? _compensationCessPercentage!.toString() : "null") + ", ");
    buffer.write("integratedGstPercentage=" + (_integratedGstPercentage != null ? _integratedGstPercentage!.toString() : "null") + ", ");
    buffer.write("stateGstPercentage=" + (_stateGstPercentage != null ? _stateGstPercentage!.toString() : "null") + ", ");
    buffer.write("taxRate=" + (_taxRate != null ? _taxRate!.toString() : "null") + ", ");
    buffer.write("unionTerritoryGstPercentage=" + (_unionTerritoryGstPercentage != null ? _unionTerritoryGstPercentage!.toString() : "null") + ", ");
    buffer.write("deliveryPartner=" + "$_deliveryPartner" + ", ");
    buffer.write("dispatchDate=" + (_dispatchDate != null ? _dispatchDate!.format() : "null") + ", ");
    buffer.write("invoiceDate=" + (_invoiceDate != null ? _invoiceDate!.format() : "null") + ", ");
    buffer.write("invoiceNumber=" + "$_invoiceNumber" + ", ");
    buffer.write("tentativeDeliveryDate=" + (_tentativeDeliveryDate != null ? _tentativeDeliveryDate!.format() : "null") + ", ");
    buffer.write("trackingId=" + "$_trackingId" + ", ");
    buffer.write("quantity=" + (_quantity != null ? _quantity!.toString() : "null") + ", ");
    buffer.write("price=" + (_price != null ? _price!.toString() : "null") + ", ");
    buffer.write("status=" + (_status != null ? enumToString(_status)! : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  OrderProduct copyWith({String? orderId, String? productId, Product? product, String? variantId, Variant? variant, String? sku, String? returnReason, String? returnDate, String? returnAWB, String? returnShippingProvider, String? title, String? shippingMethodCode, double? cashOnDeliveryCharges, double? sellingPrice, double? shippingCharges, double? discount, double? totalPrice, String? currency, bool? onHold, String? facilityCode, String? gstin, String? additionalInfo, double? centralGstPercentage, double? compensationCessPercentage, double? integratedGstPercentage, double? stateGstPercentage, double? taxRate, double? unionTerritoryGstPercentage, String? deliveryPartner, TemporalDateTime? dispatchDate, TemporalDateTime? invoiceDate, String? invoiceNumber, TemporalDateTime? tentativeDeliveryDate, String? trackingId, int? quantity, double? price, OrderStatus? status, TemporalDateTime? createdAt, TemporalDateTime? updatedAt}) {
    return OrderProduct._internal(
      id: id,
      orderId: orderId ?? this.orderId,
      productId: productId ?? this.productId,
      product: product ?? this.product,
      variantId: variantId ?? this.variantId,
      variant: variant ?? this.variant,
      sku: sku ?? this.sku,
      returnReason: returnReason ?? this.returnReason,
      returnDate: returnDate ?? this.returnDate,
      returnAWB: returnAWB ?? this.returnAWB,
      returnShippingProvider: returnShippingProvider ?? this.returnShippingProvider,
      title: title ?? this.title,
      shippingMethodCode: shippingMethodCode ?? this.shippingMethodCode,
      cashOnDeliveryCharges: cashOnDeliveryCharges ?? this.cashOnDeliveryCharges,
      sellingPrice: sellingPrice ?? this.sellingPrice,
      shippingCharges: shippingCharges ?? this.shippingCharges,
      discount: discount ?? this.discount,
      totalPrice: totalPrice ?? this.totalPrice,
      currency: currency ?? this.currency,
      onHold: onHold ?? this.onHold,
      facilityCode: facilityCode ?? this.facilityCode,
      gstin: gstin ?? this.gstin,
      additionalInfo: additionalInfo ?? this.additionalInfo,
      centralGstPercentage: centralGstPercentage ?? this.centralGstPercentage,
      compensationCessPercentage: compensationCessPercentage ?? this.compensationCessPercentage,
      integratedGstPercentage: integratedGstPercentage ?? this.integratedGstPercentage,
      stateGstPercentage: stateGstPercentage ?? this.stateGstPercentage,
      taxRate: taxRate ?? this.taxRate,
      unionTerritoryGstPercentage: unionTerritoryGstPercentage ?? this.unionTerritoryGstPercentage,
      deliveryPartner: deliveryPartner ?? this.deliveryPartner,
      dispatchDate: dispatchDate ?? this.dispatchDate,
      invoiceDate: invoiceDate ?? this.invoiceDate,
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
      tentativeDeliveryDate: tentativeDeliveryDate ?? this.tentativeDeliveryDate,
      trackingId: trackingId ?? this.trackingId,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt);
  }
  
  OrderProduct.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _orderId = json['orderId'],
      _productId = json['productId'],
      _product = json['product']?['serializedData'] != null
        ? Product.fromJson(new Map<String, dynamic>.from(json['product']['serializedData']))
        : null,
      _variantId = json['variantId'],
      _variant = json['variant']?['serializedData'] != null
        ? Variant.fromJson(new Map<String, dynamic>.from(json['variant']['serializedData']))
        : null,
      _sku = json['sku'],
      _returnReason = json['returnReason'],
      _returnDate = json['returnDate'],
      _returnAWB = json['returnAWB'],
      _returnShippingProvider = json['returnShippingProvider'],
      _title = json['title'],
      _shippingMethodCode = json['shippingMethodCode'],
      _cashOnDeliveryCharges = (json['cashOnDeliveryCharges'] as num?)?.toDouble(),
      _sellingPrice = (json['sellingPrice'] as num?)?.toDouble(),
      _shippingCharges = (json['shippingCharges'] as num?)?.toDouble(),
      _discount = (json['discount'] as num?)?.toDouble(),
      _totalPrice = (json['totalPrice'] as num?)?.toDouble(),
      _currency = json['currency'],
      _onHold = json['onHold'],
      _facilityCode = json['facilityCode'],
      _gstin = json['gstin'],
      _additionalInfo = json['additionalInfo'],
      _centralGstPercentage = (json['centralGstPercentage'] as num?)?.toDouble(),
      _compensationCessPercentage = (json['compensationCessPercentage'] as num?)?.toDouble(),
      _integratedGstPercentage = (json['integratedGstPercentage'] as num?)?.toDouble(),
      _stateGstPercentage = (json['stateGstPercentage'] as num?)?.toDouble(),
      _taxRate = (json['taxRate'] as num?)?.toDouble(),
      _unionTerritoryGstPercentage = (json['unionTerritoryGstPercentage'] as num?)?.toDouble(),
      _deliveryPartner = json['deliveryPartner'],
      _dispatchDate = json['dispatchDate'] != null ? TemporalDateTime.fromString(json['dispatchDate']) : null,
      _invoiceDate = json['invoiceDate'] != null ? TemporalDateTime.fromString(json['invoiceDate']) : null,
      _invoiceNumber = json['invoiceNumber'],
      _tentativeDeliveryDate = json['tentativeDeliveryDate'] != null ? TemporalDateTime.fromString(json['tentativeDeliveryDate']) : null,
      _trackingId = json['trackingId'],
      _quantity = (json['quantity'] as num?)?.toInt(),
      _price = (json['price'] as num?)?.toDouble(),
      _status = enumFromString<OrderStatus>(json['status'], OrderStatus.values),
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'orderId': _orderId, 'productId': _productId, 'product': _product?.toJson(), 'variantId': _variantId, 'variant': _variant?.toJson(), 'sku': _sku, 'returnReason': _returnReason, 'returnDate': _returnDate, 'returnAWB': _returnAWB, 'returnShippingProvider': _returnShippingProvider, 'title': _title, 'shippingMethodCode': _shippingMethodCode, 'cashOnDeliveryCharges': _cashOnDeliveryCharges, 'sellingPrice': _sellingPrice, 'shippingCharges': _shippingCharges, 'discount': _discount, 'totalPrice': _totalPrice, 'currency': _currency, 'onHold': _onHold, 'facilityCode': _facilityCode, 'gstin': _gstin, 'additionalInfo': _additionalInfo, 'centralGstPercentage': _centralGstPercentage, 'compensationCessPercentage': _compensationCessPercentage, 'integratedGstPercentage': _integratedGstPercentage, 'stateGstPercentage': _stateGstPercentage, 'taxRate': _taxRate, 'unionTerritoryGstPercentage': _unionTerritoryGstPercentage, 'deliveryPartner': _deliveryPartner, 'dispatchDate': _dispatchDate?.format(), 'invoiceDate': _invoiceDate?.format(), 'invoiceNumber': _invoiceNumber, 'tentativeDeliveryDate': _tentativeDeliveryDate?.format(), 'trackingId': _trackingId, 'quantity': _quantity, 'price': _price, 'status': enumToString(_status), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'orderId': _orderId, 'productId': _productId, 'product': _product, 'variantId': _variantId, 'variant': _variant, 'sku': _sku, 'returnReason': _returnReason, 'returnDate': _returnDate, 'returnAWB': _returnAWB, 'returnShippingProvider': _returnShippingProvider, 'title': _title, 'shippingMethodCode': _shippingMethodCode, 'cashOnDeliveryCharges': _cashOnDeliveryCharges, 'sellingPrice': _sellingPrice, 'shippingCharges': _shippingCharges, 'discount': _discount, 'totalPrice': _totalPrice, 'currency': _currency, 'onHold': _onHold, 'facilityCode': _facilityCode, 'gstin': _gstin, 'additionalInfo': _additionalInfo, 'centralGstPercentage': _centralGstPercentage, 'compensationCessPercentage': _compensationCessPercentage, 'integratedGstPercentage': _integratedGstPercentage, 'stateGstPercentage': _stateGstPercentage, 'taxRate': _taxRate, 'unionTerritoryGstPercentage': _unionTerritoryGstPercentage, 'deliveryPartner': _deliveryPartner, 'dispatchDate': _dispatchDate, 'invoiceDate': _invoiceDate, 'invoiceNumber': _invoiceNumber, 'tentativeDeliveryDate': _tentativeDeliveryDate, 'trackingId': _trackingId, 'quantity': _quantity, 'price': _price, 'status': _status, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<OrderProductModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<OrderProductModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField ORDERID = QueryField(fieldName: "orderId");
  static final QueryField PRODUCTID = QueryField(fieldName: "productId");
  static final QueryField PRODUCT = QueryField(
    fieldName: "product",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Product'));
  static final QueryField VARIANTID = QueryField(fieldName: "variantId");
  static final QueryField VARIANT = QueryField(
    fieldName: "variant",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Variant'));
  static final QueryField SKU = QueryField(fieldName: "sku");
  static final QueryField RETURNREASON = QueryField(fieldName: "returnReason");
  static final QueryField RETURNDATE = QueryField(fieldName: "returnDate");
  static final QueryField RETURNAWB = QueryField(fieldName: "returnAWB");
  static final QueryField RETURNSHIPPINGPROVIDER = QueryField(fieldName: "returnShippingProvider");
  static final QueryField TITLE = QueryField(fieldName: "title");
  static final QueryField SHIPPINGMETHODCODE = QueryField(fieldName: "shippingMethodCode");
  static final QueryField CASHONDELIVERYCHARGES = QueryField(fieldName: "cashOnDeliveryCharges");
  static final QueryField SELLINGPRICE = QueryField(fieldName: "sellingPrice");
  static final QueryField SHIPPINGCHARGES = QueryField(fieldName: "shippingCharges");
  static final QueryField DISCOUNT = QueryField(fieldName: "discount");
  static final QueryField TOTALPRICE = QueryField(fieldName: "totalPrice");
  static final QueryField CURRENCY = QueryField(fieldName: "currency");
  static final QueryField ONHOLD = QueryField(fieldName: "onHold");
  static final QueryField FACILITYCODE = QueryField(fieldName: "facilityCode");
  static final QueryField GSTIN = QueryField(fieldName: "gstin");
  static final QueryField ADDITIONALINFO = QueryField(fieldName: "additionalInfo");
  static final QueryField CENTRALGSTPERCENTAGE = QueryField(fieldName: "centralGstPercentage");
  static final QueryField COMPENSATIONCESSPERCENTAGE = QueryField(fieldName: "compensationCessPercentage");
  static final QueryField INTEGRATEDGSTPERCENTAGE = QueryField(fieldName: "integratedGstPercentage");
  static final QueryField STATEGSTPERCENTAGE = QueryField(fieldName: "stateGstPercentage");
  static final QueryField TAXRATE = QueryField(fieldName: "taxRate");
  static final QueryField UNIONTERRITORYGSTPERCENTAGE = QueryField(fieldName: "unionTerritoryGstPercentage");
  static final QueryField DELIVERYPARTNER = QueryField(fieldName: "deliveryPartner");
  static final QueryField DISPATCHDATE = QueryField(fieldName: "dispatchDate");
  static final QueryField INVOICEDATE = QueryField(fieldName: "invoiceDate");
  static final QueryField INVOICENUMBER = QueryField(fieldName: "invoiceNumber");
  static final QueryField TENTATIVEDELIVERYDATE = QueryField(fieldName: "tentativeDeliveryDate");
  static final QueryField TRACKINGID = QueryField(fieldName: "trackingId");
  static final QueryField QUANTITY = QueryField(fieldName: "quantity");
  static final QueryField PRICE = QueryField(fieldName: "price");
  static final QueryField STATUS = QueryField(fieldName: "status");
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField UPDATEDAT = QueryField(fieldName: "updatedAt");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "OrderProduct";
    modelSchemaDefinition.pluralName = "OrderProducts";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.READ,
          ModelOperation.CREATE,
          ModelOperation.UPDATE
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
      ModelIndex(fields: const ["orderId", "createdAt"], name: "byorderIdcreatedAtOrderProduct")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.ORDERID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.PRODUCTID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: OrderProduct.PRODUCT,
      isRequired: false,
      ofModelName: 'Product',
      associatedKey: Product.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.VARIANTID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: OrderProduct.VARIANT,
      isRequired: false,
      ofModelName: 'Variant',
      associatedKey: Variant.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.SKU,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.RETURNREASON,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.RETURNDATE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.RETURNAWB,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.RETURNSHIPPINGPROVIDER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.TITLE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.SHIPPINGMETHODCODE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.CASHONDELIVERYCHARGES,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.SELLINGPRICE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.SHIPPINGCHARGES,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.DISCOUNT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.TOTALPRICE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.CURRENCY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.ONHOLD,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.FACILITYCODE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.GSTIN,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.ADDITIONALINFO,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.CENTRALGSTPERCENTAGE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.COMPENSATIONCESSPERCENTAGE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.INTEGRATEDGSTPERCENTAGE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.STATEGSTPERCENTAGE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.TAXRATE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.UNIONTERRITORYGSTPERCENTAGE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.DELIVERYPARTNER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.DISPATCHDATE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.INVOICEDATE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.INVOICENUMBER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.TENTATIVEDELIVERYDATE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.TRACKINGID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.QUANTITY,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.PRICE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.STATUS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.CREATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderProduct.UPDATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _OrderProductModelType extends ModelType<OrderProduct> {
  const _OrderProductModelType();
  
  @override
  OrderProduct fromJson(Map<String, dynamic> jsonData) {
    return OrderProduct.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'OrderProduct';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [OrderProduct] in your schema.
 */
@immutable
class OrderProductModelIdentifier implements ModelIdentifier<OrderProduct> {
  final String id;

  /** Create an instance of OrderProductModelIdentifier using [id] the primary key. */
  const OrderProductModelIdentifier({
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
  String toString() => 'OrderProductModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is OrderProductModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}