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


/** This is an auto generated class representing the ProductSubCategory type in your schema. */
@immutable
class ProductSubCategory extends Model {
  static const classType = const _ProductSubCategoryModelType();
  final String id;
  final String? _storeId;
  final Store? _store;
  final String? _name;
  final String? _description;
  final String? _categoryID;
  final ProductCategory? _category;
  final String? _slug;
  final bool? _isFeatured;
  final int? _totalProducts;
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
  
  ProductSubCategoryModelIdentifier get modelIdentifier {
      return ProductSubCategoryModelIdentifier(
        id: id
      );
  }
  
  String? get storeId {
    return _storeId;
  }
  
  Store? get store {
    return _store;
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
  
  String? get categoryID {
    return _categoryID;
  }
  
  ProductCategory? get category {
    return _category;
  }
  
  String? get slug {
    return _slug;
  }
  
  bool? get isFeatured {
    return _isFeatured;
  }
  
  int? get totalProducts {
    return _totalProducts;
  }
  
  int? get priority {
    return _priority;
  }
  
  String get imageUrl {
    try {
      return _imageUrl!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
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
  
  const ProductSubCategory._internal({required this.id, storeId, store, required name, description, categoryID, category, slug, isFeatured, totalProducts, priority, required imageUrl, products, createdAt, updatedAt}): _storeId = storeId, _store = store, _name = name, _description = description, _categoryID = categoryID, _category = category, _slug = slug, _isFeatured = isFeatured, _totalProducts = totalProducts, _priority = priority, _imageUrl = imageUrl, _products = products, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory ProductSubCategory({String? id, String? storeId, Store? store, required String name, String? description, String? categoryID, ProductCategory? category, String? slug, bool? isFeatured, int? totalProducts, int? priority, required String imageUrl, List<Product>? products, TemporalDateTime? createdAt, TemporalDateTime? updatedAt}) {
    return ProductSubCategory._internal(
      id: id == null ? UUID.getUUID() : id,
      storeId: storeId,
      store: store,
      name: name,
      description: description,
      categoryID: categoryID,
      category: category,
      slug: slug,
      isFeatured: isFeatured,
      totalProducts: totalProducts,
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
    return other is ProductSubCategory &&
      id == other.id &&
      _storeId == other._storeId &&
      _store == other._store &&
      _name == other._name &&
      _description == other._description &&
      _categoryID == other._categoryID &&
      _category == other._category &&
      _slug == other._slug &&
      _isFeatured == other._isFeatured &&
      _totalProducts == other._totalProducts &&
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
    
    buffer.write("ProductSubCategory {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("storeId=" + "$_storeId" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("categoryID=" + "$_categoryID" + ", ");
    buffer.write("slug=" + "$_slug" + ", ");
    buffer.write("isFeatured=" + (_isFeatured != null ? _isFeatured!.toString() : "null") + ", ");
    buffer.write("totalProducts=" + (_totalProducts != null ? _totalProducts!.toString() : "null") + ", ");
    buffer.write("priority=" + (_priority != null ? _priority!.toString() : "null") + ", ");
    buffer.write("imageUrl=" + "$_imageUrl" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ProductSubCategory copyWith({String? storeId, Store? store, String? name, String? description, String? categoryID, ProductCategory? category, String? slug, bool? isFeatured, int? totalProducts, int? priority, String? imageUrl, List<Product>? products, TemporalDateTime? createdAt, TemporalDateTime? updatedAt}) {
    return ProductSubCategory._internal(
      id: id,
      storeId: storeId ?? this.storeId,
      store: store ?? this.store,
      name: name ?? this.name,
      description: description ?? this.description,
      categoryID: categoryID ?? this.categoryID,
      category: category ?? this.category,
      slug: slug ?? this.slug,
      isFeatured: isFeatured ?? this.isFeatured,
      totalProducts: totalProducts ?? this.totalProducts,
      priority: priority ?? this.priority,
      imageUrl: imageUrl ?? this.imageUrl,
      products: products ?? this.products,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt);
  }
  
  ProductSubCategory.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _storeId = json['storeId'],
      _store = json['store']?['serializedData'] != null
        ? Store.fromJson(new Map<String, dynamic>.from(json['store']['serializedData']))
        : null,
      _name = json['name'],
      _description = json['description'],
      _categoryID = json['categoryID'],
      _category = json['category']?['serializedData'] != null
        ? ProductCategory.fromJson(new Map<String, dynamic>.from(json['category']['serializedData']))
        : null,
      _slug = json['slug'],
      _isFeatured = json['isFeatured'],
      _totalProducts = (json['totalProducts'] as num?)?.toInt(),
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
    'id': id, 'storeId': _storeId, 'store': _store?.toJson(), 'name': _name, 'description': _description, 'categoryID': _categoryID, 'category': _category?.toJson(), 'slug': _slug, 'isFeatured': _isFeatured, 'totalProducts': _totalProducts, 'priority': _priority, 'imageUrl': _imageUrl, 'products': _products?.map((Product? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'storeId': _storeId, 'store': _store, 'name': _name, 'description': _description, 'categoryID': _categoryID, 'category': _category, 'slug': _slug, 'isFeatured': _isFeatured, 'totalProducts': _totalProducts, 'priority': _priority, 'imageUrl': _imageUrl, 'products': _products, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<ProductSubCategoryModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<ProductSubCategoryModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField STOREID = QueryField(fieldName: "storeId");
  static final QueryField STORE = QueryField(
    fieldName: "store",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Store'));
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField CATEGORYID = QueryField(fieldName: "categoryID");
  static final QueryField CATEGORY = QueryField(
    fieldName: "category",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'ProductCategory'));
  static final QueryField SLUG = QueryField(fieldName: "slug");
  static final QueryField ISFEATURED = QueryField(fieldName: "isFeatured");
  static final QueryField TOTALPRODUCTS = QueryField(fieldName: "totalProducts");
  static final QueryField PRIORITY = QueryField(fieldName: "priority");
  static final QueryField IMAGEURL = QueryField(fieldName: "imageUrl");
  static final QueryField PRODUCTS = QueryField(
    fieldName: "products",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Product'));
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField UPDATEDAT = QueryField(fieldName: "updatedAt");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ProductSubCategory";
    modelSchemaDefinition.pluralName = "ProductSubCategories";
    
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
      ModelIndex(fields: const ["storeId", "createdAt"], name: "bystoreIdProductSubCategory"),
      ModelIndex(fields: const ["name", "createdAt"], name: "bynameProductSubCategory"),
      ModelIndex(fields: const ["categoryID", "createdAt"], name: "bycategoryIDProductSubCategory"),
      ModelIndex(fields: const ["slug", "createdAt"], name: "byslugProductSubCategory")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ProductSubCategory.STOREID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: ProductSubCategory.STORE,
      isRequired: false,
      ofModelName: 'Store',
      associatedKey: Store.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ProductSubCategory.NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ProductSubCategory.DESCRIPTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ProductSubCategory.CATEGORYID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: ProductSubCategory.CATEGORY,
      isRequired: false,
      ofModelName: 'ProductCategory',
      associatedKey: ProductCategory.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ProductSubCategory.SLUG,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ProductSubCategory.ISFEATURED,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ProductSubCategory.TOTALPRODUCTS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ProductSubCategory.PRIORITY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ProductSubCategory.IMAGEURL,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: ProductSubCategory.PRODUCTS,
      isRequired: false,
      ofModelName: 'Product',
      associatedKey: Product.CATEGORYID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ProductSubCategory.CREATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ProductSubCategory.UPDATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _ProductSubCategoryModelType extends ModelType<ProductSubCategory> {
  const _ProductSubCategoryModelType();
  
  @override
  ProductSubCategory fromJson(Map<String, dynamic> jsonData) {
    return ProductSubCategory.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'ProductSubCategory';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [ProductSubCategory] in your schema.
 */
@immutable
class ProductSubCategoryModelIdentifier implements ModelIdentifier<ProductSubCategory> {
  final String id;

  /** Create an instance of ProductSubCategoryModelIdentifier using [id] the primary key. */
  const ProductSubCategoryModelIdentifier({
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
  String toString() => 'ProductSubCategoryModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is ProductSubCategoryModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}