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


/** This is an auto generated class representing the Review type in your schema. */
@immutable
class Review extends Model {
  static const classType = const _ReviewModelType();
  final String id;
  final String? _userId;
  final User? _user;
  final String? _productId;
  final Product? _product;
  final int? _rating;
  final String? _comment;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  ReviewModelIdentifier get modelIdentifier {
      return ReviewModelIdentifier(
        id: id
      );
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
  
  User? get user {
    return _user;
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
  
  int get rating {
    try {
      return _rating!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get comment {
    try {
      return _comment!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Review._internal({required this.id, required userId, user, required productId, product, required rating, required comment, createdAt, updatedAt}): _userId = userId, _user = user, _productId = productId, _product = product, _rating = rating, _comment = comment, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Review({String? id, required String userId, User? user, required String productId, Product? product, required int rating, required String comment, TemporalDateTime? createdAt, TemporalDateTime? updatedAt}) {
    return Review._internal(
      id: id == null ? UUID.getUUID() : id,
      userId: userId,
      user: user,
      productId: productId,
      product: product,
      rating: rating,
      comment: comment,
      createdAt: createdAt,
      updatedAt: updatedAt);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Review &&
      id == other.id &&
      _userId == other._userId &&
      _user == other._user &&
      _productId == other._productId &&
      _product == other._product &&
      _rating == other._rating &&
      _comment == other._comment &&
      _createdAt == other._createdAt &&
      _updatedAt == other._updatedAt;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Review {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("userId=" + "$_userId" + ", ");
    buffer.write("productId=" + "$_productId" + ", ");
    buffer.write("rating=" + (_rating != null ? _rating!.toString() : "null") + ", ");
    buffer.write("comment=" + "$_comment" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Review copyWith({String? userId, User? user, String? productId, Product? product, int? rating, String? comment, TemporalDateTime? createdAt, TemporalDateTime? updatedAt}) {
    return Review._internal(
      id: id,
      userId: userId ?? this.userId,
      user: user ?? this.user,
      productId: productId ?? this.productId,
      product: product ?? this.product,
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt);
  }
  
  Review.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _userId = json['userId'],
      _user = json['user']?['serializedData'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['user']['serializedData']))
        : null,
      _productId = json['productId'],
      _product = json['product']?['serializedData'] != null
        ? Product.fromJson(new Map<String, dynamic>.from(json['product']['serializedData']))
        : null,
      _rating = (json['rating'] as num?)?.toInt(),
      _comment = json['comment'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'userId': _userId, 'user': _user?.toJson(), 'productId': _productId, 'product': _product?.toJson(), 'rating': _rating, 'comment': _comment, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'userId': _userId, 'user': _user, 'productId': _productId, 'product': _product, 'rating': _rating, 'comment': _comment, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<ReviewModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<ReviewModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField USERID = QueryField(fieldName: "userId");
  static final QueryField USER = QueryField(
    fieldName: "user",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'User'));
  static final QueryField PRODUCTID = QueryField(fieldName: "productId");
  static final QueryField PRODUCT = QueryField(
    fieldName: "product",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Product'));
  static final QueryField RATING = QueryField(fieldName: "rating");
  static final QueryField COMMENT = QueryField(fieldName: "comment");
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField UPDATEDAT = QueryField(fieldName: "updatedAt");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Review";
    modelSchemaDefinition.pluralName = "Reviews";
    
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
      ModelIndex(fields: const ["userId", "createdAt"], name: "byuserIdcreatedAtReview"),
      ModelIndex(fields: const ["productId", "createdAt"], name: "byProductidcreatedAtReview")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Review.USERID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: Review.USER,
      isRequired: false,
      ofModelName: 'User',
      associatedKey: User.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Review.PRODUCTID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: Review.PRODUCT,
      isRequired: false,
      ofModelName: 'Product',
      associatedKey: Product.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Review.RATING,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Review.COMMENT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Review.CREATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Review.UPDATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _ReviewModelType extends ModelType<Review> {
  const _ReviewModelType();
  
  @override
  Review fromJson(Map<String, dynamic> jsonData) {
    return Review.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Review';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Review] in your schema.
 */
@immutable
class ReviewModelIdentifier implements ModelIdentifier<Review> {
  final String id;

  /** Create an instance of ReviewModelIdentifier using [id] the primary key. */
  const ReviewModelIdentifier({
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
  String toString() => 'ReviewModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is ReviewModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}