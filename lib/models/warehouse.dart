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


/** This is an auto generated class representing the warehouse type in your schema. */
@immutable
class warehouse extends Model {
  static const classType = const _warehouseModelType();
  final String id;
  final String? _storeId;
  final Store? _store;
  final String? _facilityCode;
  final String? _name;
  final String? _description;
  final bool? _address;
  final int? _totalProducts;
  final int? _totalQuantity;
  final int? _priority;
  final String? _imageUrl;
  final List<ProductInventory>? _productInventory;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  warehouseModelIdentifier get modelIdentifier {
      return warehouseModelIdentifier(
        id: id
      );
  }
  
  String? get storeId {
    return _storeId;
  }
  
  Store? get store {
    return _store;
  }
  
  String? get facilityCode {
    return _facilityCode;
  }
  
  String get name {
    try {
      return _name!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get description {
    return _description;
  }
  
  bool? get address {
    return _address;
  }
  
  int? get totalProducts {
    return _totalProducts;
  }
  
  int? get totalQuantity {
    return _totalQuantity;
  }
  
  int? get priority {
    return _priority;
  }
  
  String? get imageUrl {
    return _imageUrl;
  }
  
  List<ProductInventory>? get productInventory {
    return _productInventory;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const warehouse._internal({required this.id, storeId, store, facilityCode, required name, description, address, totalProducts, totalQuantity, priority, imageUrl, productInventory, createdAt, updatedAt}): _storeId = storeId, _store = store, _facilityCode = facilityCode, _name = name, _description = description, _address = address, _totalProducts = totalProducts, _totalQuantity = totalQuantity, _priority = priority, _imageUrl = imageUrl, _productInventory = productInventory, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory warehouse({String? id, String? storeId, Store? store, String? facilityCode, required String name, String? description, bool? address, int? totalProducts, int? totalQuantity, int? priority, String? imageUrl, List<ProductInventory>? productInventory, TemporalDateTime? createdAt, TemporalDateTime? updatedAt}) {
    return warehouse._internal(
      id: id == null ? UUID.getUUID() : id,
      storeId: storeId,
      store: store,
      facilityCode: facilityCode,
      name: name,
      description: description,
      address: address,
      totalProducts: totalProducts,
      totalQuantity: totalQuantity,
      priority: priority,
      imageUrl: imageUrl,
      productInventory: productInventory != null ? List<ProductInventory>.unmodifiable(productInventory) : productInventory,
      createdAt: createdAt,
      updatedAt: updatedAt);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is warehouse &&
      id == other.id &&
      _storeId == other._storeId &&
      _store == other._store &&
      _facilityCode == other._facilityCode &&
      _name == other._name &&
      _description == other._description &&
      _address == other._address &&
      _totalProducts == other._totalProducts &&
      _totalQuantity == other._totalQuantity &&
      _priority == other._priority &&
      _imageUrl == other._imageUrl &&
      DeepCollectionEquality().equals(_productInventory, other._productInventory) &&
      _createdAt == other._createdAt &&
      _updatedAt == other._updatedAt;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("warehouse {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("storeId=" + "$_storeId" + ", ");
    buffer.write("facilityCode=" + "$_facilityCode" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("address=" + (_address != null ? _address!.toString() : "null") + ", ");
    buffer.write("totalProducts=" + (_totalProducts != null ? _totalProducts!.toString() : "null") + ", ");
    buffer.write("totalQuantity=" + (_totalQuantity != null ? _totalQuantity!.toString() : "null") + ", ");
    buffer.write("priority=" + (_priority != null ? _priority!.toString() : "null") + ", ");
    buffer.write("imageUrl=" + "$_imageUrl" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  warehouse copyWith({String? storeId, Store? store, String? facilityCode, String? name, String? description, bool? address, int? totalProducts, int? totalQuantity, int? priority, String? imageUrl, List<ProductInventory>? productInventory, TemporalDateTime? createdAt, TemporalDateTime? updatedAt}) {
    return warehouse._internal(
      id: id,
      storeId: storeId ?? this.storeId,
      store: store ?? this.store,
      facilityCode: facilityCode ?? this.facilityCode,
      name: name ?? this.name,
      description: description ?? this.description,
      address: address ?? this.address,
      totalProducts: totalProducts ?? this.totalProducts,
      totalQuantity: totalQuantity ?? this.totalQuantity,
      priority: priority ?? this.priority,
      imageUrl: imageUrl ?? this.imageUrl,
      productInventory: productInventory ?? this.productInventory,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt);
  }
  
  warehouse.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _storeId = json['storeId'],
      _store = json['store']?['serializedData'] != null
        ? Store.fromJson(new Map<String, dynamic>.from(json['store']['serializedData']))
        : null,
      _facilityCode = json['facilityCode'],
      _name = json['name'],
      _description = json['description'],
      _address = json['address'],
      _totalProducts = (json['totalProducts'] as num?)?.toInt(),
      _totalQuantity = (json['totalQuantity'] as num?)?.toInt(),
      _priority = (json['priority'] as num?)?.toInt(),
      _imageUrl = json['imageUrl'],
      _productInventory = json['productInventory'] is List
        ? (json['productInventory'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => ProductInventory.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'storeId': _storeId, 'store': _store?.toJson(), 'facilityCode': _facilityCode, 'name': _name, 'description': _description, 'address': _address, 'totalProducts': _totalProducts, 'totalQuantity': _totalQuantity, 'priority': _priority, 'imageUrl': _imageUrl, 'productInventory': _productInventory?.map((ProductInventory? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'storeId': _storeId, 'store': _store, 'facilityCode': _facilityCode, 'name': _name, 'description': _description, 'address': _address, 'totalProducts': _totalProducts, 'totalQuantity': _totalQuantity, 'priority': _priority, 'imageUrl': _imageUrl, 'productInventory': _productInventory, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<warehouseModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<warehouseModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField STOREID = QueryField(fieldName: "storeId");
  static final QueryField STORE = QueryField(
    fieldName: "store",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Store'));
  static final QueryField FACILITYCODE = QueryField(fieldName: "facilityCode");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField ADDRESS = QueryField(fieldName: "address");
  static final QueryField TOTALPRODUCTS = QueryField(fieldName: "totalProducts");
  static final QueryField TOTALQUANTITY = QueryField(fieldName: "totalQuantity");
  static final QueryField PRIORITY = QueryField(fieldName: "priority");
  static final QueryField IMAGEURL = QueryField(fieldName: "imageUrl");
  static final QueryField PRODUCTINVENTORY = QueryField(
    fieldName: "productInventory",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'ProductInventory'));
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField UPDATEDAT = QueryField(fieldName: "updatedAt");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "warehouse";
    modelSchemaDefinition.pluralName = "warehouses";
    
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
      ModelIndex(fields: const ["storeId", "createdAt"], name: "bystoreIdwarehouse")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: warehouse.STOREID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: warehouse.STORE,
      isRequired: false,
      ofModelName: 'Store',
      associatedKey: Store.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: warehouse.FACILITYCODE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: warehouse.NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: warehouse.DESCRIPTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: warehouse.ADDRESS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: warehouse.TOTALPRODUCTS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: warehouse.TOTALQUANTITY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: warehouse.PRIORITY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: warehouse.IMAGEURL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: warehouse.PRODUCTINVENTORY,
      isRequired: false,
      ofModelName: 'ProductInventory',
      associatedKey: ProductInventory.WAREHOUSEID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: warehouse.CREATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: warehouse.UPDATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _warehouseModelType extends ModelType<warehouse> {
  const _warehouseModelType();
  
  @override
  warehouse fromJson(Map<String, dynamic> jsonData) {
    return warehouse.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'warehouse';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [warehouse] in your schema.
 */
@immutable
class warehouseModelIdentifier implements ModelIdentifier<warehouse> {
  final String id;

  /** Create an instance of warehouseModelIdentifier using [id] the primary key. */
  const warehouseModelIdentifier({
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
  String toString() => 'warehouseModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is warehouseModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}