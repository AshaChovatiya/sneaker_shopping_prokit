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

/** This is an auto generated class representing the WishlistProduct type in your schema. */
@immutable
class WishlistProduct extends Model {
  static const classType = const _WishlistProductModelType();
  final String id;
  final String? _wishlistId;
  final String? _productId;
  final Product? _product;
  final String? _variantId;
  final Variant? _variant;
  final int? _quantity;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;

  WishlistProductModelIdentifier get modelIdentifier {
    return WishlistProductModelIdentifier(id: id);
  }

  String get wishlistId {
    try {
      return _wishlistId!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get productId {
    try {
      return _productId!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
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

  int get quantity {
    try {
      return _quantity!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  TemporalDateTime? get createdAt {
    return _createdAt;
  }

  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const WishlistProduct._internal(
      {required this.id,
      required wishlistId,
      required productId,
      product,
      variantId,
      variant,
      required quantity,
      createdAt,
      updatedAt})
      : _wishlistId = wishlistId,
        _productId = productId,
        _product = product,
        _variantId = variantId,
        _variant = variant,
        _quantity = quantity,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory WishlistProduct(
      {String? id,
      required String wishlistId,
      required String productId,
      Product? product,
      String? variantId,
      Variant? variant,
      required int quantity,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return WishlistProduct._internal(
        id: id == null ? UUID.getUUID() : id,
        wishlistId: wishlistId,
        productId: productId,
        product: product,
        variantId: variantId,
        variant: variant,
        quantity: quantity,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WishlistProduct &&
        id == other.id &&
        _wishlistId == other._wishlistId &&
        _productId == other._productId &&
        _product == other._product &&
        _variantId == other._variantId &&
        _variant == other._variant &&
        _quantity == other._quantity &&
        _createdAt == other._createdAt &&
        _updatedAt == other._updatedAt;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("WishlistProduct {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("wishlistId=" + "$_wishlistId" + ", ");
    buffer.write("productId=" + "$_productId" + ", ");
    buffer.write("variantId=" + "$_variantId" + ", ");
    buffer.write("quantity=" +
        (_quantity != null ? _quantity!.toString() : "null") +
        ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt!.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  WishlistProduct copyWith(
      {String? wishlistId,
      String? productId,
      Product? product,
      String? variantId,
      Variant? variant,
      int? quantity,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return WishlistProduct._internal(
        id: id,
        wishlistId: wishlistId ?? this.wishlistId,
        productId: productId ?? this.productId,
        product: product ?? this.product,
        variantId: variantId ?? this.variantId,
        variant: variant ?? this.variant,
        quantity: quantity ?? this.quantity,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  WishlistProduct.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _wishlistId = json['wishlistId'],
        _productId = json['productId'],
        _product = json['product']?['serializedData'] != null
            ? Product.fromJson(new Map<String, dynamic>.from(
                json['product']['serializedData']))
            : null,
        _variantId = json['variantId'],
        _variant = json['variant']?['serializedData'] != null
            ? Variant.fromJson(new Map<String, dynamic>.from(
                json['variant']['serializedData']))
            : null,
        _quantity = (json['quantity'] as num?)?.toInt(),
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString(json['createdAt'])
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString(json['updatedAt'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'wishlistId': _wishlistId,
        'productId': _productId,
        'product': _product?.toJson(),
        'variantId': _variantId,
        'variant': _variant?.toJson(),
        'quantity': _quantity,
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  Map<String, Object?> toMap() => {
        'id': id,
        'wishlistId': _wishlistId,
        'productId': _productId,
        'product': _product,
        'variantId': _variantId,
        'variant': _variant,
        'quantity': _quantity,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt
      };

  static final QueryModelIdentifier<WishlistProductModelIdentifier>
      MODEL_IDENTIFIER = QueryModelIdentifier<WishlistProductModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField WISHLISTID = QueryField(fieldName: "wishlistId");
  static final QueryField PRODUCTID = QueryField(fieldName: "productId");
  static final QueryField PRODUCT = QueryField(
      fieldName: "product",
      fieldType:
          ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Product'));
  static final QueryField VARIANTID = QueryField(fieldName: "variantId");
  static final QueryField VARIANT = QueryField(
      fieldName: "variant",
      fieldType:
          ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Variant'));
  static final QueryField QUANTITY = QueryField(fieldName: "quantity");
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField UPDATEDAT = QueryField(fieldName: "updatedAt");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "WishlistProduct";
    modelSchemaDefinition.pluralName = "WishlistProducts";

    modelSchemaDefinition.authRules = [
      AuthRule(
          authStrategy: AuthStrategy.PUBLIC, operations: [ModelOperation.READ]),
      AuthRule(authStrategy: AuthStrategy.PRIVATE, operations: [
        ModelOperation.READ,
        ModelOperation.CREATE,
        ModelOperation.UPDATE,
        ModelOperation.DELETE
      ])
    ];

    modelSchemaDefinition.indexes = [
      ModelIndex(
          fields: const ["wishlistId", "createdAt"],
          name: "bywishlistIdcreatedAtWishlistProduct")
    ];

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: WishlistProduct.WISHLISTID,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: WishlistProduct.PRODUCTID,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
        key: WishlistProduct.PRODUCT,
        isRequired: false,
        ofModelName: 'Product',
        associatedKey: Product.ID));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: WishlistProduct.VARIANTID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
        key: WishlistProduct.VARIANT,
        isRequired: false,
        ofModelName: 'Variant',
        associatedKey: Variant.ID));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: WishlistProduct.QUANTITY,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: WishlistProduct.CREATEDAT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: WishlistProduct.UPDATEDAT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));
  });
}

class _WishlistProductModelType extends ModelType<WishlistProduct> {
  const _WishlistProductModelType();

  @override
  WishlistProduct fromJson(Map<String, dynamic> jsonData) {
    return WishlistProduct.fromJson(jsonData);
  }

  @override
  String modelName() {
    return 'WishlistProduct';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [WishlistProduct] in your schema.
 */
@immutable
class WishlistProductModelIdentifier
    implements ModelIdentifier<WishlistProduct> {
  final String id;

  /** Create an instance of WishlistProductModelIdentifier using [id] the primary key. */
  const WishlistProductModelIdentifier({required this.id});

  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{'id': id});

  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
      .entries
      .map((entry) => (<String, dynamic>{entry.key: entry.value}))
      .toList();

  @override
  String serializeAsString() => serializeAsMap().values.join('#');

  @override
  String toString() => 'WishlistProductModelIdentifier(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is WishlistProductModelIdentifier && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
