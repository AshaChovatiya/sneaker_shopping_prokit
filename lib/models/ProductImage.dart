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

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the ProductImage type in your schema. */
@immutable
class ProductImage extends Model {
  static const classType = const _ProductImageModelType();
  final String id;
  final String? _productId;
  final int? _position;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;
  final String? _alt;
  final int? _width;
  final int? _height;
  final String? _imageKey;
  final bool? _isThumb;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  ProductImageModelIdentifier get modelIdentifier {
      return ProductImageModelIdentifier(
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
  
  int? get position {
    return _position;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get alt {
    return _alt;
  }
  
  int? get width {
    return _width;
  }
  
  int? get height {
    return _height;
  }
  
  String get imageKey {
    try {
      return _imageKey!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  bool? get isThumb {
    return _isThumb;
  }
  
  const ProductImage._internal({required this.id, required productId, position, createdAt, updatedAt, alt, width, height, required imageKey, isThumb}): _productId = productId, _position = position, _createdAt = createdAt, _updatedAt = updatedAt, _alt = alt, _width = width, _height = height, _imageKey = imageKey, _isThumb = isThumb;
  
  factory ProductImage({String? id, required String productId, int? position, TemporalDateTime? createdAt, TemporalDateTime? updatedAt, String? alt, int? width, int? height, required String imageKey, bool? isThumb}) {
    return ProductImage._internal(
      id: id == null ? UUID.getUUID() : id,
      productId: productId,
      position: position,
      createdAt: createdAt,
      updatedAt: updatedAt,
      alt: alt,
      width: width,
      height: height,
      imageKey: imageKey,
      isThumb: isThumb);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductImage &&
      id == other.id &&
      _productId == other._productId &&
      _position == other._position &&
      _createdAt == other._createdAt &&
      _updatedAt == other._updatedAt &&
      _alt == other._alt &&
      _width == other._width &&
      _height == other._height &&
      _imageKey == other._imageKey &&
      _isThumb == other._isThumb;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ProductImage {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("productId=" + "$_productId" + ", ");
    buffer.write("position=" + (_position != null ? _position!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("alt=" + "$_alt" + ", ");
    buffer.write("width=" + (_width != null ? _width!.toString() : "null") + ", ");
    buffer.write("height=" + (_height != null ? _height!.toString() : "null") + ", ");
    buffer.write("imageKey=" + "$_imageKey" + ", ");
    buffer.write("isThumb=" + (_isThumb != null ? _isThumb!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ProductImage copyWith({String? productId, int? position, TemporalDateTime? createdAt, TemporalDateTime? updatedAt, String? alt, int? width, int? height, String? imageKey, bool? isThumb}) {
    return ProductImage._internal(
      id: id,
      productId: productId ?? this.productId,
      position: position ?? this.position,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      alt: alt ?? this.alt,
      width: width ?? this.width,
      height: height ?? this.height,
      imageKey: imageKey ?? this.imageKey,
      isThumb: isThumb ?? this.isThumb);
  }
  
  ProductImage.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _productId = json['productId'],
      _position = (json['position'] as num?)?.toInt(),
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null,
      _alt = json['alt'],
      _width = (json['width'] as num?)?.toInt(),
      _height = (json['height'] as num?)?.toInt(),
      _imageKey = json['imageKey'],
      _isThumb = json['isThumb'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'productId': _productId, 'position': _position, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'alt': _alt, 'width': _width, 'height': _height, 'imageKey': _imageKey, 'isThumb': _isThumb
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'productId': _productId, 'position': _position, 'createdAt': _createdAt, 'updatedAt': _updatedAt, 'alt': _alt, 'width': _width, 'height': _height, 'imageKey': _imageKey, 'isThumb': _isThumb
  };

  static final QueryModelIdentifier<ProductImageModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<ProductImageModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField PRODUCTID = QueryField(fieldName: "productId");
  static final QueryField POSITION = QueryField(fieldName: "position");
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField UPDATEDAT = QueryField(fieldName: "updatedAt");
  static final QueryField ALT = QueryField(fieldName: "alt");
  static final QueryField WIDTH = QueryField(fieldName: "width");
  static final QueryField HEIGHT = QueryField(fieldName: "height");
  static final QueryField IMAGEKEY = QueryField(fieldName: "imageKey");
  static final QueryField ISTHUMB = QueryField(fieldName: "isThumb");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ProductImage";
    modelSchemaDefinition.pluralName = "ProductImages";
    
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
      ModelIndex(fields: const ["productId", "createdAt"], name: "byProductIdProductImage")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ProductImage.PRODUCTID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ProductImage.POSITION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ProductImage.CREATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ProductImage.UPDATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ProductImage.ALT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ProductImage.WIDTH,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ProductImage.HEIGHT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ProductImage.IMAGEKEY,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ProductImage.ISTHUMB,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
  });
}

class _ProductImageModelType extends ModelType<ProductImage> {
  const _ProductImageModelType();
  
  @override
  ProductImage fromJson(Map<String, dynamic> jsonData) {
    return ProductImage.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'ProductImage';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [ProductImage] in your schema.
 */
@immutable
class ProductImageModelIdentifier implements ModelIdentifier<ProductImage> {
  final String id;

  /** Create an instance of ProductImageModelIdentifier using [id] the primary key. */
  const ProductImageModelIdentifier({
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
  String toString() => 'ProductImageModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is ProductImageModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}