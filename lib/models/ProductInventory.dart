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


/** This is an auto generated class representing the ProductInventory type in your schema. */
@immutable
class ProductInventory extends Model {
  static const classType = const _ProductInventoryModelType();
  final String id;
  final String? _warehouseId;
  final String? _productId;
  final Product? _product;
  final int? _currentQuantity;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  ProductInventoryModelIdentifier get modelIdentifier {
      return ProductInventoryModelIdentifier(
        id: id
      );
  }
  
  String? get warehouseId {
    return _warehouseId;
  }
  
  String? get productId {
    return _productId;
  }
  
  Product? get product {
    return _product;
  }
  
  int? get currentQuantity {
    return _currentQuantity;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const ProductInventory._internal({required this.id, warehouseId, productId, product, currentQuantity, createdAt, updatedAt}): _warehouseId = warehouseId, _productId = productId, _product = product, _currentQuantity = currentQuantity, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory ProductInventory({String? id, String? warehouseId, String? productId, Product? product, int? currentQuantity, TemporalDateTime? createdAt, TemporalDateTime? updatedAt}) {
    return ProductInventory._internal(
      id: id == null ? UUID.getUUID() : id,
      warehouseId: warehouseId,
      productId: productId,
      product: product,
      currentQuantity: currentQuantity,
      createdAt: createdAt,
      updatedAt: updatedAt);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductInventory &&
      id == other.id &&
      _warehouseId == other._warehouseId &&
      _productId == other._productId &&
      _product == other._product &&
      _currentQuantity == other._currentQuantity &&
      _createdAt == other._createdAt &&
      _updatedAt == other._updatedAt;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ProductInventory {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("warehouseId=" + "$_warehouseId" + ", ");
    buffer.write("productId=" + "$_productId" + ", ");
    buffer.write("currentQuantity=" + (_currentQuantity != null ? _currentQuantity!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ProductInventory copyWith({String? warehouseId, String? productId, Product? product, int? currentQuantity, TemporalDateTime? createdAt, TemporalDateTime? updatedAt}) {
    return ProductInventory._internal(
      id: id,
      warehouseId: warehouseId ?? this.warehouseId,
      productId: productId ?? this.productId,
      product: product ?? this.product,
      currentQuantity: currentQuantity ?? this.currentQuantity,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt);
  }
  
  ProductInventory.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _warehouseId = json['warehouseId'],
      _productId = json['productId'],
      _product = json['product']?['serializedData'] != null
        ? Product.fromJson(new Map<String, dynamic>.from(json['product']['serializedData']))
        : null,
      _currentQuantity = (json['currentQuantity'] as num?)?.toInt(),
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'warehouseId': _warehouseId, 'productId': _productId, 'product': _product?.toJson(), 'currentQuantity': _currentQuantity, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'warehouseId': _warehouseId, 'productId': _productId, 'product': _product, 'currentQuantity': _currentQuantity, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<ProductInventoryModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<ProductInventoryModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField WAREHOUSEID = QueryField(fieldName: "warehouseId");
  static final QueryField PRODUCTID = QueryField(fieldName: "productId");
  static final QueryField PRODUCT = QueryField(
    fieldName: "product",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Product'));
  static final QueryField CURRENTQUANTITY = QueryField(fieldName: "currentQuantity");
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField UPDATEDAT = QueryField(fieldName: "updatedAt");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ProductInventory";
    modelSchemaDefinition.pluralName = "ProductInventories";
    
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
      ModelIndex(fields: const ["warehouseId", "createdAt"], name: "bywarehouseIdProductInventory"),
      ModelIndex(fields: const ["productId", "createdAt"], name: "byproductIdProductInventory")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ProductInventory.WAREHOUSEID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ProductInventory.PRODUCTID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: ProductInventory.PRODUCT,
      isRequired: false,
      ofModelName: 'Product',
      associatedKey: Product.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ProductInventory.CURRENTQUANTITY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ProductInventory.CREATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ProductInventory.UPDATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _ProductInventoryModelType extends ModelType<ProductInventory> {
  const _ProductInventoryModelType();
  
  @override
  ProductInventory fromJson(Map<String, dynamic> jsonData) {
    return ProductInventory.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'ProductInventory';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [ProductInventory] in your schema.
 */
@immutable
class ProductInventoryModelIdentifier implements ModelIdentifier<ProductInventory> {
  final String id;

  /** Create an instance of ProductInventoryModelIdentifier using [id] the primary key. */
  const ProductInventoryModelIdentifier({
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
  String toString() => 'ProductInventoryModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is ProductInventoryModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}