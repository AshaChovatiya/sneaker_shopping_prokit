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


/** This is an auto generated class representing the Store type in your schema. */
@immutable
class Store extends Model {
  static const classType = const _StoreModelType();
  final String id;
  final String? _name;
  final String? _description;
  final bool? _isActive;
  final String? _webUrl;
  final String? _appId;
  final String? _host;
  final int? _priority;
  final String? _imageUrl;
  final List<Product>? _products;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  StoreModelIdentifier get modelIdentifier {
      return StoreModelIdentifier(
        id: id
      );
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
  
  bool? get isActive {
    return _isActive;
  }
  
  String? get webUrl {
    return _webUrl;
  }
  
  String? get appId {
    return _appId;
  }
  
  String? get host {
    return _host;
  }
  
  int? get priority {
    return _priority;
  }
  
  String? get imageUrl {
    return _imageUrl;
  }
  
  List<Product>? get products {
    return _products;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Store._internal({required this.id, required name, description, isActive, webUrl, appId, host, priority, imageUrl, products, createdAt, updatedAt}): _name = name, _description = description, _isActive = isActive, _webUrl = webUrl, _appId = appId, _host = host, _priority = priority, _imageUrl = imageUrl, _products = products, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Store({String? id, required String name, String? description, bool? isActive, String? webUrl, String? appId, String? host, int? priority, String? imageUrl, List<Product>? products, TemporalDateTime? createdAt, TemporalDateTime? updatedAt}) {
    return Store._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      description: description,
      isActive: isActive,
      webUrl: webUrl,
      appId: appId,
      host: host,
      priority: priority,
      imageUrl: imageUrl,
      products: products != null ? List<Product>.unmodifiable(products) : products,
      createdAt: createdAt,
      updatedAt: updatedAt);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Store &&
      id == other.id &&
      _name == other._name &&
      _description == other._description &&
      _isActive == other._isActive &&
      _webUrl == other._webUrl &&
      _appId == other._appId &&
      _host == other._host &&
      _priority == other._priority &&
      _imageUrl == other._imageUrl &&
      DeepCollectionEquality().equals(_products, other._products) &&
      _createdAt == other._createdAt &&
      _updatedAt == other._updatedAt;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Store {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("isActive=" + (_isActive != null ? _isActive!.toString() : "null") + ", ");
    buffer.write("webUrl=" + "$_webUrl" + ", ");
    buffer.write("appId=" + "$_appId" + ", ");
    buffer.write("host=" + "$_host" + ", ");
    buffer.write("priority=" + (_priority != null ? _priority!.toString() : "null") + ", ");
    buffer.write("imageUrl=" + "$_imageUrl" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Store copyWith({String? name, String? description, bool? isActive, String? webUrl, String? appId, String? host, int? priority, String? imageUrl, List<Product>? products, TemporalDateTime? createdAt, TemporalDateTime? updatedAt}) {
    return Store._internal(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
      isActive: isActive ?? this.isActive,
      webUrl: webUrl ?? this.webUrl,
      appId: appId ?? this.appId,
      host: host ?? this.host,
      priority: priority ?? this.priority,
      imageUrl: imageUrl ?? this.imageUrl,
      products: products ?? this.products,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt);
  }
  
  Store.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _description = json['description'],
      _isActive = json['isActive'],
      _webUrl = json['webUrl'],
      _appId = json['appId'],
      _host = json['host'],
      _priority = (json['priority'] as num?)?.toInt(),
      _imageUrl = json['imageUrl'],
      _products = json['products'] is List
        ? (json['products'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Product.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'description': _description, 'isActive': _isActive, 'webUrl': _webUrl, 'appId': _appId, 'host': _host, 'priority': _priority, 'imageUrl': _imageUrl, 'products': _products?.map((Product? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'name': _name, 'description': _description, 'isActive': _isActive, 'webUrl': _webUrl, 'appId': _appId, 'host': _host, 'priority': _priority, 'imageUrl': _imageUrl, 'products': _products, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<StoreModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<StoreModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField ISACTIVE = QueryField(fieldName: "isActive");
  static final QueryField WEBURL = QueryField(fieldName: "webUrl");
  static final QueryField APPID = QueryField(fieldName: "appId");
  static final QueryField HOST = QueryField(fieldName: "host");
  static final QueryField PRIORITY = QueryField(fieldName: "priority");
  static final QueryField IMAGEURL = QueryField(fieldName: "imageUrl");
  static final QueryField PRODUCTS = QueryField(
    fieldName: "products",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Product'));
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField UPDATEDAT = QueryField(fieldName: "updatedAt");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Store";
    modelSchemaDefinition.pluralName = "Stores";
    
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Store.NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Store.DESCRIPTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Store.ISACTIVE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Store.WEBURL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Store.APPID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Store.HOST,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Store.PRIORITY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Store.IMAGEURL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Store.PRODUCTS,
      isRequired: false,
      ofModelName: 'Product',
      associatedKey: Product.STOREID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Store.CREATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Store.UPDATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _StoreModelType extends ModelType<Store> {
  const _StoreModelType();
  
  @override
  Store fromJson(Map<String, dynamic> jsonData) {
    return Store.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Store';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Store] in your schema.
 */
@immutable
class StoreModelIdentifier implements ModelIdentifier<Store> {
  final String id;

  /** Create an instance of StoreModelIdentifier using [id] the primary key. */
  const StoreModelIdentifier({
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
  String toString() => 'StoreModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is StoreModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}