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


/** This is an auto generated class representing the Address type in your schema. */
@immutable
class Address {
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
  
  const Address._internal({name, phone, email, country, state, city, pinCode, landmark, address, location, area}): _name = name, _phone = phone, _email = email, _country = country, _state = state, _city = city, _pinCode = pinCode, _landmark = landmark, _address = address, _location = location, _area = area;
  
  factory Address({String? name, String? phone, String? email, String? country, String? state, String? city, String? pinCode, String? landmark, String? address, String? location, String? area}) {
    return Address._internal(
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
      area: area);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Address &&
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
      _area == other._area;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Address {");
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
    buffer.write("area=" + "$_area");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Address copyWith({String? name, String? phone, String? email, String? country, String? state, String? city, String? pinCode, String? landmark, String? address, String? location, String? area}) {
    return Address._internal(
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
      area: area ?? this.area);
  }
  
  Address.fromJson(Map<String, dynamic> json)  
    : _name = json['name'],
      _phone = json['phone'],
      _email = json['email'],
      _country = json['country'],
      _state = json['state'],
      _city = json['city'],
      _pinCode = json['pinCode'],
      _landmark = json['landmark'],
      _address = json['address'],
      _location = json['location'],
      _area = json['area'];
  
  Map<String, dynamic> toJson() => {
    'name': _name, 'phone': _phone, 'email': _email, 'country': _country, 'state': _state, 'city': _city, 'pinCode': _pinCode, 'landmark': _landmark, 'address': _address, 'location': _location, 'area': _area
  };
  
  Map<String, Object?> toMap() => {
    'name': _name, 'phone': _phone, 'email': _email, 'country': _country, 'state': _state, 'city': _city, 'pinCode': _pinCode, 'landmark': _landmark, 'address': _address, 'location': _location, 'area': _area
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Address";
    modelSchemaDefinition.pluralName = "Addresses";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'name',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'phone',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'email',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'country',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'state',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'city',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'pinCode',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'landmark',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'address',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'location',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'area',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}