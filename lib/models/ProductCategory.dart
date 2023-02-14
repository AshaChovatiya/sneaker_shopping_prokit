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


/** This is an auto generated class representing the ProductCategory type in your schema. */
@immutable
class ProductCategory extends Model {
  static const classType = const _ProductCategoryModelType();
  final String id;
  final String? _name;
  final String? _description;
  final String? _slug;
  final bool? _isFeatured;
  final int? _totalProducts;
  final int? _priority;
  final String? _imageUrl;
  final List<Product>? _products;
  final List<ProductSubCategory>? _subCategory;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  ProductCategoryModelIdentifier get modelIdentifier {
      return ProductCategoryModelIdentifier(
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
  
  List<ProductSubCategory>? get subCategory {
    return _subCategory;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const ProductCategory._internal({required this.id, required name, description, slug, isFeatured, totalProducts, priority, required imageUrl, products, subCategory, createdAt, updatedAt}): _name = name, _description = description, _slug = slug, _isFeatured = isFeatured, _totalProducts = totalProducts, _priority = priority, _imageUrl = imageUrl, _products = products, _subCategory = subCategory, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory ProductCategory({String? id, required String name, String? description, String? slug, bool? isFeatured, int? totalProducts, int? priority, required String imageUrl, List<Product>? products, List<ProductSubCategory>? subCategory, TemporalDateTime? createdAt, TemporalDateTime? updatedAt}) {
    return ProductCategory._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      description: description,
      slug: slug,
      isFeatured: isFeatured,
      totalProducts: totalProducts,
      priority: priority,
      imageUrl: imageUrl,
      products: products != null ? List<Product>.unmodifiable(products) : products,
      subCategory: subCategory != null ? List<ProductSubCategory>.unmodifiable(subCategory) : subCategory,
      createdAt: createdAt,
      updatedAt: updatedAt);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductCategory &&
      id == other.id &&
      _name == other._name &&
      _description == other._description &&
      _slug == other._slug &&
      _isFeatured == other._isFeatured &&
      _totalProducts == other._totalProducts &&
      _priority == other._priority &&
      _imageUrl == other._imageUrl &&
      DeepCollectionEquality().equals(_products, other._products) &&
      DeepCollectionEquality().equals(_subCategory, other._subCategory) &&
      _createdAt == other._createdAt &&
      _updatedAt == other._updatedAt;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ProductCategory {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("description=" + "$_description" + ", ");
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
  
  ProductCategory copyWith({String? name, String? description, String? slug, bool? isFeatured, int? totalProducts, int? priority, String? imageUrl, List<Product>? products, List<ProductSubCategory>? subCategory, TemporalDateTime? createdAt, TemporalDateTime? updatedAt}) {
    return ProductCategory._internal(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
      slug: slug ?? this.slug,
      isFeatured: isFeatured ?? this.isFeatured,
      totalProducts: totalProducts ?? this.totalProducts,
      priority: priority ?? this.priority,
      imageUrl: imageUrl ?? this.imageUrl,
      products: products ?? this.products,
      subCategory: subCategory ?? this.subCategory,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt);
  }
  
  ProductCategory.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _description = json['description'],
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
      _subCategory = json['subCategory'] is List
        ? (json['subCategory'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => ProductSubCategory.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'description': _description, 'slug': _slug, 'isFeatured': _isFeatured, 'totalProducts': _totalProducts, 'priority': _priority, 'imageUrl': _imageUrl, 'products': _products?.map((Product? e) => e?.toJson()).toList(), 'subCategory': _subCategory?.map((ProductSubCategory? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'name': _name, 'description': _description, 'slug': _slug, 'isFeatured': _isFeatured, 'totalProducts': _totalProducts, 'priority': _priority, 'imageUrl': _imageUrl, 'products': _products, 'subCategory': _subCategory, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<ProductCategoryModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<ProductCategoryModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField SLUG = QueryField(fieldName: "slug");
  static final QueryField ISFEATURED = QueryField(fieldName: "isFeatured");
  static final QueryField TOTALPRODUCTS = QueryField(fieldName: "totalProducts");
  static final QueryField PRIORITY = QueryField(fieldName: "priority");
  static final QueryField IMAGEURL = QueryField(fieldName: "imageUrl");
  static final QueryField PRODUCTS = QueryField(
    fieldName: "products",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Product'));
  static final QueryField SUBCATEGORY = QueryField(
    fieldName: "subCategory",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'ProductSubCategory'));
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField UPDATEDAT = QueryField(fieldName: "updatedAt");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ProductCategory";
    modelSchemaDefinition.pluralName = "ProductCategories";
    
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
      ModelIndex(fields: const ["name", "createdAt"], name: "bynameProductCategory"),
      ModelIndex(fields: const ["slug", "createdAt"], name: "byslugProductCategory")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ProductCategory.NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ProductCategory.DESCRIPTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ProductCategory.SLUG,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ProductCategory.ISFEATURED,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ProductCategory.TOTALPRODUCTS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ProductCategory.PRIORITY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ProductCategory.IMAGEURL,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: ProductCategory.PRODUCTS,
      isRequired: false,
      ofModelName: 'Product',
      associatedKey: Product.CATEGORYID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: ProductCategory.SUBCATEGORY,
      isRequired: false,
      ofModelName: 'ProductSubCategory',
      associatedKey: ProductSubCategory.CATEGORYID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ProductCategory.CREATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ProductCategory.UPDATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _ProductCategoryModelType extends ModelType<ProductCategory> {
  const _ProductCategoryModelType();
  
  @override
  ProductCategory fromJson(Map<String, dynamic> jsonData) {
    return ProductCategory.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'ProductCategory';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [ProductCategory] in your schema.
 */
@immutable
class ProductCategoryModelIdentifier implements ModelIdentifier<ProductCategory> {
  final String id;

  /** Create an instance of ProductCategoryModelIdentifier using [id] the primary key. */
  const ProductCategoryModelIdentifier({
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
  String toString() => 'ProductCategoryModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is ProductCategoryModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}