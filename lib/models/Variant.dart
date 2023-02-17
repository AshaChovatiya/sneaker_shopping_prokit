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


/** This is an auto generated class representing the Variant type in your schema. */
@immutable
class Variant extends Model {
  static const classType = const _VariantModelType();
  final String id;
  final String? _productId;
  final String? _title;
  final double? _price;
  final String? _sku;
  final String? _size;
  final String? _color;
  final ProductStatus? _status;
  final int? _position;
  final String? _currency;
  final double? _costPrice;
  final double? _listingPrice;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;
  final bool? _taxable;
  final String? _barcode;
  final String? _imageUrl;
  final double? _weight;
  final String? _weightUnit;
  final int? _inventory;
  final int? _blockedInventory;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  VariantModelIdentifier get modelIdentifier {
      return VariantModelIdentifier(
        id: id
      );
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
  
  String get title {
    try {
      return _title!;
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
  
  String? get sku {
    return _sku;
  }
  
  String? get size {
    return _size;
  }
  
  String? get color {
    return _color;
  }
  
  ProductStatus? get status {
    return _status;
  }
  
  int? get position {
    return _position;
  }
  
  String? get currency {
    return _currency;
  }
  
  double? get costPrice {
    return _costPrice;
  }
  
  double? get listingPrice {
    return _listingPrice;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  bool? get taxable {
    return _taxable;
  }
  
  String? get barcode {
    return _barcode;
  }
  
  String? get imageUrl {
    return _imageUrl;
  }
  
  double? get weight {
    return _weight;
  }
  
  String? get weightUnit {
    return _weightUnit;
  }
  
  int? get inventory {
    return _inventory;
  }
  
  int? get blockedInventory {
    return _blockedInventory;
  }
  
  const Variant._internal({required this.id, required productId, required title, required price, sku, size, color, status, position, currency, costPrice, listingPrice, createdAt, updatedAt, taxable, barcode, imageUrl, weight, weightUnit, inventory, blockedInventory}): _productId = productId, _title = title, _price = price, _sku = sku, _size = size, _color = color, _status = status, _position = position, _currency = currency, _costPrice = costPrice, _listingPrice = listingPrice, _createdAt = createdAt, _updatedAt = updatedAt, _taxable = taxable, _barcode = barcode, _imageUrl = imageUrl, _weight = weight, _weightUnit = weightUnit, _inventory = inventory, _blockedInventory = blockedInventory;
  
  factory Variant({String? id, required String productId, required String title, required double price, String? sku, String? size, String? color, ProductStatus? status, int? position, String? currency, double? costPrice, double? listingPrice, TemporalDateTime? createdAt, TemporalDateTime? updatedAt, bool? taxable, String? barcode, String? imageUrl, double? weight, String? weightUnit, int? inventory, int? blockedInventory}) {
    return Variant._internal(
      id: id == null ? UUID.getUUID() : id,
      productId: productId,
      title: title,
      price: price,
      sku: sku,
      size: size,
      color: color,
      status: status,
      position: position,
      currency: currency,
      costPrice: costPrice,
      listingPrice: listingPrice,
      createdAt: createdAt,
      updatedAt: updatedAt,
      taxable: taxable,
      barcode: barcode,
      imageUrl: imageUrl,
      weight: weight,
      weightUnit: weightUnit,
      inventory: inventory,
      blockedInventory: blockedInventory);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Variant &&
      id == other.id &&
      _productId == other._productId &&
      _title == other._title &&
      _price == other._price &&
      _sku == other._sku &&
      _size == other._size &&
      _color == other._color &&
      _status == other._status &&
      _position == other._position &&
      _currency == other._currency &&
      _costPrice == other._costPrice &&
      _listingPrice == other._listingPrice &&
      _createdAt == other._createdAt &&
      _updatedAt == other._updatedAt &&
      _taxable == other._taxable &&
      _barcode == other._barcode &&
      _imageUrl == other._imageUrl &&
      _weight == other._weight &&
      _weightUnit == other._weightUnit &&
      _inventory == other._inventory &&
      _blockedInventory == other._blockedInventory;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Variant {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("productId=" + "$_productId" + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("price=" + (_price != null ? _price!.toString() : "null") + ", ");
    buffer.write("sku=" + "$_sku" + ", ");
    buffer.write("size=" + "$_size" + ", ");
    buffer.write("color=" + "$_color" + ", ");
    buffer.write("status=" + (_status != null ? enumToString(_status)! : "null") + ", ");
    buffer.write("position=" + (_position != null ? _position!.toString() : "null") + ", ");
    buffer.write("currency=" + "$_currency" + ", ");
    buffer.write("costPrice=" + (_costPrice != null ? _costPrice!.toString() : "null") + ", ");
    buffer.write("listingPrice=" + (_listingPrice != null ? _listingPrice!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("taxable=" + (_taxable != null ? _taxable!.toString() : "null") + ", ");
    buffer.write("barcode=" + "$_barcode" + ", ");
    buffer.write("imageUrl=" + "$_imageUrl" + ", ");
    buffer.write("weight=" + (_weight != null ? _weight!.toString() : "null") + ", ");
    buffer.write("weightUnit=" + "$_weightUnit" + ", ");
    buffer.write("inventory=" + (_inventory != null ? _inventory!.toString() : "null") + ", ");
    buffer.write("blockedInventory=" + (_blockedInventory != null ? _blockedInventory!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Variant copyWith({String? productId, String? title, double? price, String? sku, String? size, String? color, ProductStatus? status, int? position, String? currency, double? costPrice, double? listingPrice, TemporalDateTime? createdAt, TemporalDateTime? updatedAt, bool? taxable, String? barcode, String? imageUrl, double? weight, String? weightUnit, int? inventory, int? blockedInventory}) {
    return Variant._internal(
      id: id,
      productId: productId ?? this.productId,
      title: title ?? this.title,
      price: price ?? this.price,
      sku: sku ?? this.sku,
      size: size ?? this.size,
      color: color ?? this.color,
      status: status ?? this.status,
      position: position ?? this.position,
      currency: currency ?? this.currency,
      costPrice: costPrice ?? this.costPrice,
      listingPrice: listingPrice ?? this.listingPrice,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      taxable: taxable ?? this.taxable,
      barcode: barcode ?? this.barcode,
      imageUrl: imageUrl ?? this.imageUrl,
      weight: weight ?? this.weight,
      weightUnit: weightUnit ?? this.weightUnit,
      inventory: inventory ?? this.inventory,
      blockedInventory: blockedInventory ?? this.blockedInventory);
  }
  
  Variant.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _productId = json['productId'],
      _title = json['title'],
      _price = (json['price'] as num?)?.toDouble(),
      _sku = json['sku'],
      _size = json['size'],
      _color = json['color'],
      _status = enumFromString<ProductStatus>(json['status'], ProductStatus.values),
      _position = (json['position'] as num?)?.toInt(),
      _currency = json['currency'],
      _costPrice = (json['costPrice'] as num?)?.toDouble(),
      _listingPrice = (json['listingPrice'] as num?)?.toDouble(),
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null,
      _taxable = json['taxable'],
      _barcode = json['barcode'],
      _imageUrl = json['imageUrl'],
      _weight = (json['weight'] as num?)?.toDouble(),
      _weightUnit = json['weightUnit'],
      _inventory = (json['inventory'] as num?)?.toInt(),
      _blockedInventory = (json['blockedInventory'] as num?)?.toInt();
  
  Map<String, dynamic> toJson() => {
    'id': id, 'productId': _productId, 'title': _title, 'price': _price, 'sku': _sku, 'size': _size, 'color': _color, 'status': enumToString(_status), 'position': _position, 'currency': _currency, 'costPrice': _costPrice, 'listingPrice': _listingPrice, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'taxable': _taxable, 'barcode': _barcode, 'imageUrl': _imageUrl, 'weight': _weight, 'weightUnit': _weightUnit, 'inventory': _inventory, 'blockedInventory': _blockedInventory
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'productId': _productId, 'title': _title, 'price': _price, 'sku': _sku, 'size': _size, 'color': _color, 'status': _status, 'position': _position, 'currency': _currency, 'costPrice': _costPrice, 'listingPrice': _listingPrice, 'createdAt': _createdAt, 'updatedAt': _updatedAt, 'taxable': _taxable, 'barcode': _barcode, 'imageUrl': _imageUrl, 'weight': _weight, 'weightUnit': _weightUnit, 'inventory': _inventory, 'blockedInventory': _blockedInventory
  };

  static final QueryModelIdentifier<VariantModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<VariantModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField PRODUCTID = QueryField(fieldName: "productId");
  static final QueryField TITLE = QueryField(fieldName: "title");
  static final QueryField PRICE = QueryField(fieldName: "price");
  static final QueryField SKU = QueryField(fieldName: "sku");
  static final QueryField SIZE = QueryField(fieldName: "size");
  static final QueryField COLOR = QueryField(fieldName: "color");
  static final QueryField STATUS = QueryField(fieldName: "status");
  static final QueryField POSITION = QueryField(fieldName: "position");
  static final QueryField CURRENCY = QueryField(fieldName: "currency");
  static final QueryField COSTPRICE = QueryField(fieldName: "costPrice");
  static final QueryField LISTINGPRICE = QueryField(fieldName: "listingPrice");
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField UPDATEDAT = QueryField(fieldName: "updatedAt");
  static final QueryField TAXABLE = QueryField(fieldName: "taxable");
  static final QueryField BARCODE = QueryField(fieldName: "barcode");
  static final QueryField IMAGEURL = QueryField(fieldName: "imageUrl");
  static final QueryField WEIGHT = QueryField(fieldName: "weight");
  static final QueryField WEIGHTUNIT = QueryField(fieldName: "weightUnit");
  static final QueryField INVENTORY = QueryField(fieldName: "inventory");
  static final QueryField BLOCKEDINVENTORY = QueryField(fieldName: "blockedInventory");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Variant";
    modelSchemaDefinition.pluralName = "Variants";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.READ
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
      ModelIndex(fields: const ["productId", "createdAt"], name: "byProductIdCreatedAtVariant")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Variant.PRODUCTID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Variant.TITLE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Variant.PRICE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Variant.SKU,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Variant.SIZE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Variant.COLOR,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Variant.STATUS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Variant.POSITION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Variant.CURRENCY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Variant.COSTPRICE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Variant.LISTINGPRICE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Variant.CREATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Variant.UPDATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Variant.TAXABLE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Variant.BARCODE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Variant.IMAGEURL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Variant.WEIGHT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Variant.WEIGHTUNIT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Variant.INVENTORY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Variant.BLOCKEDINVENTORY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
  });
}

class _VariantModelType extends ModelType<Variant> {
  const _VariantModelType();
  
  @override
  Variant fromJson(Map<String, dynamic> jsonData) {
    return Variant.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Variant';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Variant] in your schema.
 */
@immutable
class VariantModelIdentifier implements ModelIdentifier<Variant> {
  final String id;

  /** Create an instance of VariantModelIdentifier using [id] the primary key. */
  const VariantModelIdentifier({
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
  String toString() => 'VariantModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is VariantModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}