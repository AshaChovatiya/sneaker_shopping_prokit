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


/** This is an auto generated class representing the Wishlist type in your schema. */
@immutable
class Wishlist extends Model {
  static const classType = const _WishlistModelType();
  final String id;
  final String? _storeId;
  final Store? _store;
  final String? _userId;
  final List<WishlistProduct>? _wishlistProducts;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  WishlistModelIdentifier get modelIdentifier {
      return WishlistModelIdentifier(
        id: id
      );
  }
  
  String? get storeId {
    return _storeId;
  }
  
  Store? get store {
    return _store;
  }
  
  String get userId {
    try {
      return _userId!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<WishlistProduct>? get wishlistProducts {
    return _wishlistProducts;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Wishlist._internal({required this.id, storeId, store, required userId, wishlistProducts, createdAt, updatedAt}): _storeId = storeId, _store = store, _userId = userId, _wishlistProducts = wishlistProducts, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Wishlist({String? id, String? storeId, Store? store, required String userId, List<WishlistProduct>? wishlistProducts, TemporalDateTime? createdAt, TemporalDateTime? updatedAt}) {
    return Wishlist._internal(
      id: id == null ? UUID.getUUID() : id,
      storeId: storeId,
      store: store,
      userId: userId,
      wishlistProducts: wishlistProducts != null ? List<WishlistProduct>.unmodifiable(wishlistProducts) : wishlistProducts,
      createdAt: createdAt,
      updatedAt: updatedAt);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Wishlist &&
      id == other.id &&
      _storeId == other._storeId &&
      _store == other._store &&
      _userId == other._userId &&
      DeepCollectionEquality().equals(_wishlistProducts, other._wishlistProducts) &&
      _createdAt == other._createdAt &&
      _updatedAt == other._updatedAt;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Wishlist {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("storeId=" + "$_storeId" + ", ");
    buffer.write("userId=" + "$_userId" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Wishlist copyWith({String? storeId, Store? store, String? userId, List<WishlistProduct>? wishlistProducts, TemporalDateTime? createdAt, TemporalDateTime? updatedAt}) {
    return Wishlist._internal(
      id: id,
      storeId: storeId ?? this.storeId,
      store: store ?? this.store,
      userId: userId ?? this.userId,
      wishlistProducts: wishlistProducts ?? this.wishlistProducts,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt);
  }
  
  Wishlist.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _storeId = json['storeId'],
      _store = json['store']?['serializedData'] != null
        ? Store.fromJson(new Map<String, dynamic>.from(json['store']['serializedData']))
        : null,
      _userId = json['userId'],
      _wishlistProducts = json['wishlistProducts'] is List
        ? (json['wishlistProducts'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => WishlistProduct.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'storeId': _storeId, 'store': _store?.toJson(), 'userId': _userId, 'wishlistProducts': _wishlistProducts?.map((WishlistProduct? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'storeId': _storeId, 'store': _store, 'userId': _userId, 'wishlistProducts': _wishlistProducts, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<WishlistModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<WishlistModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField STOREID = QueryField(fieldName: "storeId");
  static final QueryField STORE = QueryField(
    fieldName: "store",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Store'));
  static final QueryField USERID = QueryField(fieldName: "userId");
  static final QueryField WISHLISTPRODUCTS = QueryField(
    fieldName: "wishlistProducts",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'WishlistProduct'));
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField UPDATEDAT = QueryField(fieldName: "updatedAt");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Wishlist";
    modelSchemaDefinition.pluralName = "Wishlists";
    
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
      ModelIndex(fields: const ["storeId", "createdAt"], name: "bystoreIdWishlist"),
      ModelIndex(fields: const ["userId", "createdAt"], name: "byuserIdcreatedAtWishlist")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Wishlist.STOREID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: Wishlist.STORE,
      isRequired: false,
      ofModelName: 'Store',
      associatedKey: Store.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Wishlist.USERID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Wishlist.WISHLISTPRODUCTS,
      isRequired: false,
      ofModelName: 'WishlistProduct',
      associatedKey: WishlistProduct.WISHLISTID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Wishlist.CREATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Wishlist.UPDATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _WishlistModelType extends ModelType<Wishlist> {
  const _WishlistModelType();
  
  @override
  Wishlist fromJson(Map<String, dynamic> jsonData) {
    return Wishlist.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Wishlist';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Wishlist] in your schema.
 */
@immutable
class WishlistModelIdentifier implements ModelIdentifier<Wishlist> {
  final String id;

  /** Create an instance of WishlistModelIdentifier using [id] the primary key. */
  const WishlistModelIdentifier({
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
  String toString() => 'WishlistModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is WishlistModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}