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


/** This is an auto generated class representing the UserAddress type in your schema. */
@immutable
class UserAddress extends Model {
  static const classType = const _UserAddressModelType();
  final String id;
  final String? _userID;
  final String? _name;
  final String? _phone;
  final String? _email;
  final String? _country;
  final String? _state;
  final String? _city;
  final String? _pinCode;
  final String? _landmark;
  final String? _address;
  final String? _location;
  final String? _area;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  UserAddressModelIdentifier get modelIdentifier {
      return UserAddressModelIdentifier(
        id: id
      );
  }
  
  String get userID {
    try {
      return _userID!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get name {
    return _name;
  }
  
  String? get phone {
    return _phone;
  }
  
  String? get email {
    return _email;
  }
  
  String? get country {
    return _country;
  }
  
  String? get state {
    return _state;
  }
  
  String? get city {
    return _city;
  }
  
  String? get pinCode {
    return _pinCode;
  }
  
  String? get landmark {
    return _landmark;
  }
  
  String? get address {
    return _address;
  }
  
  String? get location {
    return _location;
  }
  
  String? get area {
    return _area;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const UserAddress._internal({required this.id, required userID, name, phone, email, country, state, city, pinCode, landmark, address, location, area, createdAt, updatedAt}): _userID = userID, _name = name, _phone = phone, _email = email, _country = country, _state = state, _city = city, _pinCode = pinCode, _landmark = landmark, _address = address, _location = location, _area = area, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory UserAddress({String? id, required String userID, String? name, String? phone, String? email, String? country, String? state, String? city, String? pinCode, String? landmark, String? address, String? location, String? area, TemporalDateTime? createdAt, TemporalDateTime? updatedAt}) {
    return UserAddress._internal(
      id: id == null ? UUID.getUUID() : id,
      userID: userID,
      name: name,
      phone: phone,
      email: email,
      country: country,
      state: state,
      city: city,
      pinCode: pinCode,
      landmark: landmark,
      address: address,
      location: location,
      area: area,
      createdAt: createdAt,
      updatedAt: updatedAt);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserAddress &&
      id == other.id &&
      _userID == other._userID &&
      _name == other._name &&
      _phone == other._phone &&
      _email == other._email &&
      _country == other._country &&
      _state == other._state &&
      _city == other._city &&
      _pinCode == other._pinCode &&
      _landmark == other._landmark &&
      _address == other._address &&
      _location == other._location &&
      _area == other._area &&
      _createdAt == other._createdAt &&
      _updatedAt == other._updatedAt;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("UserAddress {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("userID=" + "$_userID" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("phone=" + "$_phone" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("country=" + "$_country" + ", ");
    buffer.write("state=" + "$_state" + ", ");
    buffer.write("city=" + "$_city" + ", ");
    buffer.write("pinCode=" + "$_pinCode" + ", ");
    buffer.write("landmark=" + "$_landmark" + ", ");
    buffer.write("address=" + "$_address" + ", ");
    buffer.write("location=" + "$_location" + ", ");
    buffer.write("area=" + "$_area" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  UserAddress copyWith({String? userID, String? name, String? phone, String? email, String? country, String? state, String? city, String? pinCode, String? landmark, String? address, String? location, String? area, TemporalDateTime? createdAt, TemporalDateTime? updatedAt}) {
    return UserAddress._internal(
      id: id,
      userID: userID ?? this.userID,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      country: country ?? this.country,
      state: state ?? this.state,
      city: city ?? this.city,
      pinCode: pinCode ?? this.pinCode,
      landmark: landmark ?? this.landmark,
      address: address ?? this.address,
      location: location ?? this.location,
      area: area ?? this.area,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt);
  }
  
  UserAddress.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _userID = json['userID'],
      _name = json['name'],
      _phone = json['phone'],
      _email = json['email'],
      _country = json['country'],
      _state = json['state'],
      _city = json['city'],
      _pinCode = json['pinCode'],
      _landmark = json['landmark'],
      _address = json['address'],
      _location = json['location'],
      _area = json['area'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'userID': _userID, 'name': _name, 'phone': _phone, 'email': _email, 'country': _country, 'state': _state, 'city': _city, 'pinCode': _pinCode, 'landmark': _landmark, 'address': _address, 'location': _location, 'area': _area, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'userID': _userID, 'name': _name, 'phone': _phone, 'email': _email, 'country': _country, 'state': _state, 'city': _city, 'pinCode': _pinCode, 'landmark': _landmark, 'address': _address, 'location': _location, 'area': _area, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<UserAddressModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<UserAddressModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField USERID = QueryField(fieldName: "userID");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField PHONE = QueryField(fieldName: "phone");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField COUNTRY = QueryField(fieldName: "country");
  static final QueryField STATE = QueryField(fieldName: "state");
  static final QueryField CITY = QueryField(fieldName: "city");
  static final QueryField PINCODE = QueryField(fieldName: "pinCode");
  static final QueryField LANDMARK = QueryField(fieldName: "landmark");
  static final QueryField ADDRESS = QueryField(fieldName: "address");
  static final QueryField LOCATION = QueryField(fieldName: "location");
  static final QueryField AREA = QueryField(fieldName: "area");
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField UPDATEDAT = QueryField(fieldName: "updatedAt");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "UserAddress";
    modelSchemaDefinition.pluralName = "UserAddresses";
    
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
      ModelIndex(fields: const ["userID", "createdAt"], name: "byuserIDUserAddress")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserAddress.USERID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserAddress.NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserAddress.PHONE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserAddress.EMAIL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserAddress.COUNTRY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserAddress.STATE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserAddress.CITY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserAddress.PINCODE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserAddress.LANDMARK,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserAddress.ADDRESS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserAddress.LOCATION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserAddress.AREA,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserAddress.CREATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserAddress.UPDATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _UserAddressModelType extends ModelType<UserAddress> {
  const _UserAddressModelType();
  
  @override
  UserAddress fromJson(Map<String, dynamic> jsonData) {
    return UserAddress.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'UserAddress';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [UserAddress] in your schema.
 */
@immutable
class UserAddressModelIdentifier implements ModelIdentifier<UserAddress> {
  final String id;

  /** Create an instance of UserAddressModelIdentifier using [id] the primary key. */
  const UserAddressModelIdentifier({
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
  String toString() => 'UserAddressModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is UserAddressModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}