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
import 'CouponCode.dart';
import 'Order.dart';
import 'OrderProduct.dart';
import 'Payment.dart';
import 'Product.dart';
import 'ProductCategory.dart';
import 'ProductImage.dart';
import 'ProductInventory.dart';
import 'ProductSubCategory.dart';
import 'Review.dart';
import 'ShoppingCart.dart';
import 'ShoppingCartProduct.dart';
import 'Store.dart';
import 'User.dart';
import 'UserAddress.dart';
import 'Variant.dart';
import 'Wishlist.dart';
import 'WishlistProduct.dart';
import 'warehouse.dart';
import 'Address.dart';

export 'Address.dart';
export 'CouponCode.dart';
export 'CouponType.dart';
export 'Order.dart';
export 'OrderProduct.dart';
export 'OrderStatus.dart';
export 'Payment.dart';
export 'PaymentMethod.dart';
export 'Product.dart';
export 'ProductCategory.dart';
export 'ProductImage.dart';
export 'ProductInventory.dart';
export 'ProductStatus.dart';
export 'ProductSubCategory.dart';
export 'Review.dart';
export 'ShoppingCart.dart';
export 'ShoppingCartProduct.dart';
export 'StatusDelivery.dart';
export 'Store.dart';
export 'User.dart';
export 'UserAddress.dart';
export 'Variant.dart';
export 'Wishlist.dart';
export 'WishlistProduct.dart';
export 'warehouse.dart';

class ModelProvider implements ModelProviderInterface {
  @override
  String version = "d1f0b3b72e27f5f96be302a99e9d97ab";
  @override
  List<ModelSchema> modelSchemas = [CouponCode.schema, Order.schema, OrderProduct.schema, Payment.schema, Product.schema, ProductCategory.schema, ProductImage.schema, ProductInventory.schema, ProductSubCategory.schema, Review.schema, ShoppingCart.schema, ShoppingCartProduct.schema, Store.schema, User.schema, UserAddress.schema, Variant.schema, Wishlist.schema, WishlistProduct.schema, warehouse.schema];
  static final ModelProvider _instance = ModelProvider();
  @override
  List<ModelSchema> customTypeSchemas = [Address.schema];

  static ModelProvider get instance => _instance;
  
  ModelType getModelTypeByModelName(String modelName) {
    switch(modelName) {
      case "CouponCode":
        return CouponCode.classType;
      case "Order":
        return Order.classType;
      case "OrderProduct":
        return OrderProduct.classType;
      case "Payment":
        return Payment.classType;
      case "Product":
        return Product.classType;
      case "ProductCategory":
        return ProductCategory.classType;
      case "ProductImage":
        return ProductImage.classType;
      case "ProductInventory":
        return ProductInventory.classType;
      case "ProductSubCategory":
        return ProductSubCategory.classType;
      case "Review":
        return Review.classType;
      case "ShoppingCart":
        return ShoppingCart.classType;
      case "ShoppingCartProduct":
        return ShoppingCartProduct.classType;
      case "Store":
        return Store.classType;
      case "User":
        return User.classType;
      case "UserAddress":
        return UserAddress.classType;
      case "Variant":
        return Variant.classType;
      case "Wishlist":
        return Wishlist.classType;
      case "WishlistProduct":
        return WishlistProduct.classType;
      case "warehouse":
        return warehouse.classType;
      default:
        throw Exception("Failed to find model in model provider for model name: " + modelName);
    }
  }
}