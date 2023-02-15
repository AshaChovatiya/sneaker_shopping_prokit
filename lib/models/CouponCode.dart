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


/** This is an auto generated class representing the CouponCode type in your schema. */
@immutable
class CouponCode extends Model {
  static const classType = const _CouponCodeModelType();
  final String id;
  final String? _code;
  final int? _isForAll;
  final String? _storeId;
  final Store? _store;
  final String? _userId;
  final User? _user;
  final double? _discount;
  final TemporalDate? _expirationDate;
  final int? _maxUse;
  final int? _totalUsed;
  final bool? _isActive;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  CouponCodeModelIdentifier get modelIdentifier {
      return CouponCodeModelIdentifier(
        id: id
      );
  }
  
  String get code {
    try {
      return _code!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int? get isForAll {
    return _isForAll;
  }
  
  String? get storeId {
    return _storeId;
  }
  
  Store? get store {
    return _store;
  }
  
  String? get userId {
    return _userId;
  }
  
  User? get user {
    return _user;
  }
  
  double get discount {
    try {
      return _discount!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDate get expirationDate {
    try {
      return _expirationDate!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get maxUse {
    try {
      return _maxUse!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int? get totalUsed {
    return _totalUsed;
  }
  
  bool? get isActive {
    return _isActive;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const CouponCode._internal({required this.id, required code, isForAll, storeId, store, userId, user, required discount, required expirationDate, required maxUse, totalUsed, isActive, createdAt, updatedAt}): _code = code, _isForAll = isForAll, _storeId = storeId, _store = store, _userId = userId, _user = user, _discount = discount, _expirationDate = expirationDate, _maxUse = maxUse, _totalUsed = totalUsed, _isActive = isActive, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory CouponCode({String? id, required String code, int? isForAll, String? storeId, Store? store, String? userId, User? user, required double discount, required TemporalDate expirationDate, required int maxUse, int? totalUsed, bool? isActive, TemporalDateTime? createdAt, TemporalDateTime? updatedAt}) {
    return CouponCode._internal(
      id: id == null ? UUID.getUUID() : id,
      code: code,
      isForAll: isForAll,
      storeId: storeId,
      store: store,
      userId: userId,
      user: user,
      discount: discount,
      expirationDate: expirationDate,
      maxUse: maxUse,
      totalUsed: totalUsed,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CouponCode &&
      id == other.id &&
      _code == other._code &&
      _isForAll == other._isForAll &&
      _storeId == other._storeId &&
      _store == other._store &&
      _userId == other._userId &&
      _user == other._user &&
      _discount == other._discount &&
      _expirationDate == other._expirationDate &&
      _maxUse == other._maxUse &&
      _totalUsed == other._totalUsed &&
      _isActive == other._isActive &&
      _createdAt == other._createdAt &&
      _updatedAt == other._updatedAt;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("CouponCode {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("code=" + "$_code" + ", ");
    buffer.write("isForAll=" + (_isForAll != null ? _isForAll!.toString() : "null") + ", ");
    buffer.write("storeId=" + "$_storeId" + ", ");
    buffer.write("userId=" + "$_userId" + ", ");
    buffer.write("discount=" + (_discount != null ? _discount!.toString() : "null") + ", ");
    buffer.write("expirationDate=" + (_expirationDate != null ? _expirationDate!.format() : "null") + ", ");
    buffer.write("maxUse=" + (_maxUse != null ? _maxUse!.toString() : "null") + ", ");
    buffer.write("totalUsed=" + (_totalUsed != null ? _totalUsed!.toString() : "null") + ", ");
    buffer.write("isActive=" + (_isActive != null ? _isActive!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  CouponCode copyWith({String? code, int? isForAll, String? storeId, Store? store, String? userId, User? user, double? discount, TemporalDate? expirationDate, int? maxUse, int? totalUsed, bool? isActive, TemporalDateTime? createdAt, TemporalDateTime? updatedAt}) {
    return CouponCode._internal(
      id: id,
      code: code ?? this.code,
      isForAll: isForAll ?? this.isForAll,
      storeId: storeId ?? this.storeId,
      store: store ?? this.store,
      userId: userId ?? this.userId,
      user: user ?? this.user,
      discount: discount ?? this.discount,
      expirationDate: expirationDate ?? this.expirationDate,
      maxUse: maxUse ?? this.maxUse,
      totalUsed: totalUsed ?? this.totalUsed,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt);
  }
  
  CouponCode.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _code = json['code'],
      _isForAll = (json['isForAll'] as num?)?.toInt(),
      _storeId = json['storeId'],
      _store = json['store']?['serializedData'] != null
        ? Store.fromJson(new Map<String, dynamic>.from(json['store']['serializedData']))
        : null,
      _userId = json['userId'],
      _user = json['user']?['serializedData'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['user']['serializedData']))
        : null,
      _discount = (json['discount'] as num?)?.toDouble(),
      _expirationDate = json['expirationDate'] != null ? TemporalDate.fromString(json['expirationDate']) : null,
      _maxUse = (json['maxUse'] as num?)?.toInt(),
      _totalUsed = (json['totalUsed'] as num?)?.toInt(),
      _isActive = json['isActive'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'code': _code, 'isForAll': _isForAll, 'storeId': _storeId, 'store': _store?.toJson(), 'userId': _userId, 'user': _user?.toJson(), 'discount': _discount, 'expirationDate': _expirationDate?.format(), 'maxUse': _maxUse, 'totalUsed': _totalUsed, 'isActive': _isActive, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'code': _code, 'isForAll': _isForAll, 'storeId': _storeId, 'store': _store, 'userId': _userId, 'user': _user, 'discount': _discount, 'expirationDate': _expirationDate, 'maxUse': _maxUse, 'totalUsed': _totalUsed, 'isActive': _isActive, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<CouponCodeModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<CouponCodeModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField CODE = QueryField(fieldName: "code");
  static final QueryField ISFORALL = QueryField(fieldName: "isForAll");
  static final QueryField STOREID = QueryField(fieldName: "storeId");
  static final QueryField STORE = QueryField(
    fieldName: "store",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Store'));
  static final QueryField USERID = QueryField(fieldName: "userId");
  static final QueryField USER = QueryField(
    fieldName: "user",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'User'));
  static final QueryField DISCOUNT = QueryField(fieldName: "discount");
  static final QueryField EXPIRATIONDATE = QueryField(fieldName: "expirationDate");
  static final QueryField MAXUSE = QueryField(fieldName: "maxUse");
  static final QueryField TOTALUSED = QueryField(fieldName: "totalUsed");
  static final QueryField ISACTIVE = QueryField(fieldName: "isActive");
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField UPDATEDAT = QueryField(fieldName: "updatedAt");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "CouponCode";
    modelSchemaDefinition.pluralName = "CouponCodes";
    
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
      ModelIndex(fields: const ["code", "createdAt"], name: "bycodeCouponCode"),
      ModelIndex(fields: const ["userId", "createdAt"], name: "byuserIdCouponCode")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CouponCode.CODE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CouponCode.ISFORALL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CouponCode.STOREID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: CouponCode.STORE,
      isRequired: false,
      ofModelName: 'Store',
      associatedKey: Store.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CouponCode.USERID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: CouponCode.USER,
      isRequired: false,
      ofModelName: 'User',
      associatedKey: User.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CouponCode.DISCOUNT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CouponCode.EXPIRATIONDATE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CouponCode.MAXUSE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CouponCode.TOTALUSED,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CouponCode.ISACTIVE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CouponCode.CREATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CouponCode.UPDATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _CouponCodeModelType extends ModelType<CouponCode> {
  const _CouponCodeModelType();
  
  @override
  CouponCode fromJson(Map<String, dynamic> jsonData) {
    return CouponCode.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'CouponCode';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [CouponCode] in your schema.
 */
@immutable
class CouponCodeModelIdentifier implements ModelIdentifier<CouponCode> {
  final String id;

  /** Create an instance of CouponCodeModelIdentifier using [id] the primary key. */
  const CouponCodeModelIdentifier({
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
  String toString() => 'CouponCodeModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is CouponCodeModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}