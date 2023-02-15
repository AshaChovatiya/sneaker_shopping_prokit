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


/** This is an auto generated class representing the Product type in your schema. */
@immutable
class Product extends Model {
  static const classType = const _ProductModelType();
  final String id;
  final String? _title;
  final String? _brand;
  final String? _vendor;
  final String? _categoryId;
  final String? _subCategoryId;
  final ProductSubCategory? _subCategory;
  final String? _storeId;
  final Store? _store;
  final bool? _isFeatured;
  final ProductCategory? _category;
  final String? _productType;
  final TemporalDateTime? _createdAt;
  final String? _slug;
  final String? _productDescription;
  final String? _longDescription;
  final TemporalDateTime? _updatedAt;
  final bool? _isPublished;
  final TemporalDateTime? _publishedAt;
  final double? _price;
  final String? _sku;
  final String? _size;
  final String? _color;
  final ProductStatus? _status;
  final int? _position;
  final String? _currency;
  final double? _costPrice;
  final double? _listingPrice;
  final bool? _taxable;
  final String? _barcode;
  final String? _tags;
  final double? _weight;
  final String? _weightUnit;
  final int? _inventory;
  final int? _blockedInventory;
  final double? _rating;
  final int? _totalOrders;
  final String? _additionalInfo;
  final String? _thumbImages;
  final bool? _isTaxEnabled;
  final bool? _isInventoryEnabled;
  final bool? _hasVarient;
  final List<Variant>? _variants;
  final List<ProductImage>? _images;
  final List<Review>? _reviews;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  ProductModelIdentifier get modelIdentifier {
      return ProductModelIdentifier(
        id: id
      );
  }
  
  String get title {
    try {
      return _title!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get brand {
    return _brand;
  }
  
  String? get vendor {
    return _vendor;
  }
  
  String? get categoryId {
    return _categoryId;
  }
  
  String? get subCategoryId {
    return _subCategoryId;
  }
  
  ProductSubCategory? get subCategory {
    return _subCategory;
  }
  
  String? get storeId {
    return _storeId;
  }
  
  Store? get store {
    return _store;
  }
  
  bool? get isFeatured {
    return _isFeatured;
  }
  
  ProductCategory? get category {
    return _category;
  }
  
  String? get productType {
    return _productType;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  String? get slug {
    return _slug;
  }
  
  String? get productDescription {
    return _productDescription;
  }
  
  String? get longDescription {
    return _longDescription;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  bool? get isPublished {
    return _isPublished;
  }
  
  TemporalDateTime? get publishedAt {
    return _publishedAt;
  }
  
  double get price {
    try {
      return _price!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get sku {
    return _sku;
  }
  
  String? get size {
    return _size;
  }
  
  String? get color {
    return _color;
  }
  
  ProductStatus? get status {
    return _status;
  }
  
  int? get position {
    return _position;
  }
  
  String? get currency {
    return _currency;
  }
  
  double? get costPrice {
    return _costPrice;
  }
  
  double? get listingPrice {
    return _listingPrice;
  }
  
  bool? get taxable {
    return _taxable;
  }
  
  String? get barcode {
    return _barcode;
  }
  
  String? get tags {
    return _tags;
  }
  
  double? get weight {
    return _weight;
  }
  
  String? get weightUnit {
    return _weightUnit;
  }
  
  int? get inventory {
    return _inventory;
  }
  
  int? get blockedInventory {
    return _blockedInventory;
  }
  
  double? get rating {
    return _rating;
  }
  
  int? get totalOrders {
    return _totalOrders;
  }
  
  String? get additionalInfo {
    return _additionalInfo;
  }
  
  String? get thumbImages {
    return _thumbImages;
  }
  
  bool? get isTaxEnabled {
    return _isTaxEnabled;
  }
  
  bool? get isInventoryEnabled {
    return _isInventoryEnabled;
  }
  
  bool? get hasVarient {
    return _hasVarient;
  }
  
  List<Variant>? get variants {
    return _variants;
  }
  
  List<ProductImage>? get images {
    return _images;
  }
  
  List<Review>? get reviews {
    return _reviews;
  }
  
  const Product._internal({required this.id, required title, brand, vendor, categoryId, subCategoryId, subCategory, storeId, store, isFeatured, category, productType, createdAt, slug, productDescription, longDescription, updatedAt, isPublished, publishedAt, required price, sku, size, color, status, position, currency, costPrice, listingPrice, taxable, barcode, tags, weight, weightUnit, inventory, blockedInventory, rating, totalOrders, additionalInfo, thumbImages, isTaxEnabled, isInventoryEnabled, hasVarient, variants, images, reviews}): _title = title, _brand = brand, _vendor = vendor, _categoryId = categoryId, _subCategoryId = subCategoryId, _subCategory = subCategory, _storeId = storeId, _store = store, _isFeatured = isFeatured, _category = category, _productType = productType, _createdAt = createdAt, _slug = slug, _productDescription = productDescription, _longDescription = longDescription, _updatedAt = updatedAt, _isPublished = isPublished, _publishedAt = publishedAt, _price = price, _sku = sku, _size = size, _color = color, _status = status, _position = position, _currency = currency, _costPrice = costPrice, _listingPrice = listingPrice, _taxable = taxable, _barcode = barcode, _tags = tags, _weight = weight, _weightUnit = weightUnit, _inventory = inventory, _blockedInventory = blockedInventory, _rating = rating, _totalOrders = totalOrders, _additionalInfo = additionalInfo, _thumbImages = thumbImages, _isTaxEnabled = isTaxEnabled, _isInventoryEnabled = isInventoryEnabled, _hasVarient = hasVarient, _variants = variants, _images = images, _reviews = reviews;
  
  factory Product({String? id, required String title, String? brand, String? vendor, String? categoryId, String? subCategoryId, ProductSubCategory? subCategory, String? storeId, Store? store, bool? isFeatured, ProductCategory? category, String? productType, TemporalDateTime? createdAt, String? slug, String? productDescription, String? longDescription, TemporalDateTime? updatedAt, bool? isPublished, TemporalDateTime? publishedAt, required double price, String? sku, String? size, String? color, ProductStatus? status, int? position, String? currency, double? costPrice, double? listingPrice, bool? taxable, String? barcode, String? tags, double? weight, String? weightUnit, int? inventory, int? blockedInventory, double? rating, int? totalOrders, String? additionalInfo, String? thumbImages, bool? isTaxEnabled, bool? isInventoryEnabled, bool? hasVarient, List<Variant>? variants, List<ProductImage>? images, List<Review>? reviews}) {
    return Product._internal(
      id: id == null ? UUID.getUUID() : id,
      title: title,
      brand: brand,
      vendor: vendor,
      categoryId: categoryId,
      subCategoryId: subCategoryId,
      subCategory: subCategory,
      storeId: storeId,
      store: store,
      isFeatured: isFeatured,
      category: category,
      productType: productType,
      createdAt: createdAt,
      slug: slug,
      productDescription: productDescription,
      longDescription: longDescription,
      updatedAt: updatedAt,
      isPublished: isPublished,
      publishedAt: publishedAt,
      price: price,
      sku: sku,
      size: size,
      color: color,
      status: status,
      position: position,
      currency: currency,
      costPrice: costPrice,
      listingPrice: listingPrice,
      taxable: taxable,
      barcode: barcode,
      tags: tags,
      weight: weight,
      weightUnit: weightUnit,
      inventory: inventory,
      blockedInventory: blockedInventory,
      rating: rating,
      totalOrders: totalOrders,
      additionalInfo: additionalInfo,
      thumbImages: thumbImages,
      isTaxEnabled: isTaxEnabled,
      isInventoryEnabled: isInventoryEnabled,
      hasVarient: hasVarient,
      variants: variants != null ? List<Variant>.unmodifiable(variants) : variants,
      images: images != null ? List<ProductImage>.unmodifiable(images) : images,
      reviews: reviews != null ? List<Review>.unmodifiable(reviews) : reviews);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Product &&
      id == other.id &&
      _title == other._title &&
      _brand == other._brand &&
      _vendor == other._vendor &&
      _categoryId == other._categoryId &&
      _subCategoryId == other._subCategoryId &&
      _subCategory == other._subCategory &&
      _storeId == other._storeId &&
      _store == other._store &&
      _isFeatured == other._isFeatured &&
      _category == other._category &&
      _productType == other._productType &&
      _createdAt == other._createdAt &&
      _slug == other._slug &&
      _productDescription == other._productDescription &&
      _longDescription == other._longDescription &&
      _updatedAt == other._updatedAt &&
      _isPublished == other._isPublished &&
      _publishedAt == other._publishedAt &&
      _price == other._price &&
      _sku == other._sku &&
      _size == other._size &&
      _color == other._color &&
      _status == other._status &&
      _position == other._position &&
      _currency == other._currency &&
      _costPrice == other._costPrice &&
      _listingPrice == other._listingPrice &&
      _taxable == other._taxable &&
      _barcode == other._barcode &&
      _tags == other._tags &&
      _weight == other._weight &&
      _weightUnit == other._weightUnit &&
      _inventory == other._inventory &&
      _blockedInventory == other._blockedInventory &&
      _rating == other._rating &&
      _totalOrders == other._totalOrders &&
      _additionalInfo == other._additionalInfo &&
      _thumbImages == other._thumbImages &&
      _isTaxEnabled == other._isTaxEnabled &&
      _isInventoryEnabled == other._isInventoryEnabled &&
      _hasVarient == other._hasVarient &&
      DeepCollectionEquality().equals(_variants, other._variants) &&
      DeepCollectionEquality().equals(_images, other._images) &&
      DeepCollectionEquality().equals(_reviews, other._reviews);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Product {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("brand=" + "$_brand" + ", ");
    buffer.write("vendor=" + "$_vendor" + ", ");
    buffer.write("categoryId=" + "$_categoryId" + ", ");
    buffer.write("subCategoryId=" + "$_subCategoryId" + ", ");
    buffer.write("storeId=" + "$_storeId" + ", ");
    buffer.write("isFeatured=" + (_isFeatured != null ? _isFeatured!.toString() : "null") + ", ");
    buffer.write("productType=" + "$_productType" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("slug=" + "$_slug" + ", ");
    buffer.write("productDescription=" + "$_productDescription" + ", ");
    buffer.write("longDescription=" + "$_longDescription" + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("isPublished=" + (_isPublished != null ? _isPublished!.toString() : "null") + ", ");
    buffer.write("publishedAt=" + (_publishedAt != null ? _publishedAt!.format() : "null") + ", ");
    buffer.write("price=" + (_price != null ? _price!.toString() : "null") + ", ");
    buffer.write("sku=" + "$_sku" + ", ");
    buffer.write("size=" + "$_size" + ", ");
    buffer.write("color=" + "$_color" + ", ");
    buffer.write("status=" + (_status != null ? enumToString(_status)! : "null") + ", ");
    buffer.write("position=" + (_position != null ? _position!.toString() : "null") + ", ");
    buffer.write("currency=" + "$_currency" + ", ");
    buffer.write("costPrice=" + (_costPrice != null ? _costPrice!.toString() : "null") + ", ");
    buffer.write("listingPrice=" + (_listingPrice != null ? _listingPrice!.toString() : "null") + ", ");
    buffer.write("taxable=" + (_taxable != null ? _taxable!.toString() : "null") + ", ");
    buffer.write("barcode=" + "$_barcode" + ", ");
    buffer.write("tags=" + "$_tags" + ", ");
    buffer.write("weight=" + (_weight != null ? _weight!.toString() : "null") + ", ");
    buffer.write("weightUnit=" + "$_weightUnit" + ", ");
    buffer.write("inventory=" + (_inventory != null ? _inventory!.toString() : "null") + ", ");
    buffer.write("blockedInventory=" + (_blockedInventory != null ? _blockedInventory!.toString() : "null") + ", ");
    buffer.write("rating=" + (_rating != null ? _rating!.toString() : "null") + ", ");
    buffer.write("totalOrders=" + (_totalOrders != null ? _totalOrders!.toString() : "null") + ", ");
    buffer.write("additionalInfo=" + "$_additionalInfo" + ", ");
    buffer.write("thumbImages=" + "$_thumbImages" + ", ");
    buffer.write("isTaxEnabled=" + (_isTaxEnabled != null ? _isTaxEnabled!.toString() : "null") + ", ");
    buffer.write("isInventoryEnabled=" + (_isInventoryEnabled != null ? _isInventoryEnabled!.toString() : "null") + ", ");
    buffer.write("hasVarient=" + (_hasVarient != null ? _hasVarient!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Product copyWith({String? title, String? brand, String? vendor, String? categoryId, String? subCategoryId, ProductSubCategory? subCategory, String? storeId, Store? store, bool? isFeatured, ProductCategory? category, String? productType, TemporalDateTime? createdAt, String? slug, String? productDescription, String? longDescription, TemporalDateTime? updatedAt, bool? isPublished, TemporalDateTime? publishedAt, double? price, String? sku, String? size, String? color, ProductStatus? status, int? position, String? currency, double? costPrice, double? listingPrice, bool? taxable, String? barcode, String? tags, double? weight, String? weightUnit, int? inventory, int? blockedInventory, double? rating, int? totalOrders, String? additionalInfo, String? thumbImages, bool? isTaxEnabled, bool? isInventoryEnabled, bool? hasVarient, List<Variant>? variants, List<ProductImage>? images, List<Review>? reviews}) {
    return Product._internal(
      id: id,
      title: title ?? this.title,
      brand: brand ?? this.brand,
      vendor: vendor ?? this.vendor,
      categoryId: categoryId ?? this.categoryId,
      subCategoryId: subCategoryId ?? this.subCategoryId,
      subCategory: subCategory ?? this.subCategory,
      storeId: storeId ?? this.storeId,
      store: store ?? this.store,
      isFeatured: isFeatured ?? this.isFeatured,
      category: category ?? this.category,
      productType: productType ?? this.productType,
      createdAt: createdAt ?? this.createdAt,
      slug: slug ?? this.slug,
      productDescription: productDescription ?? this.productDescription,
      longDescription: longDescription ?? this.longDescription,
      updatedAt: updatedAt ?? this.updatedAt,
      isPublished: isPublished ?? this.isPublished,
      publishedAt: publishedAt ?? this.publishedAt,
      price: price ?? this.price,
      sku: sku ?? this.sku,
      size: size ?? this.size,
      color: color ?? this.color,
      status: status ?? this.status,
      position: position ?? this.position,
      currency: currency ?? this.currency,
      costPrice: costPrice ?? this.costPrice,
      listingPrice: listingPrice ?? this.listingPrice,
      taxable: taxable ?? this.taxable,
      barcode: barcode ?? this.barcode,
      tags: tags ?? this.tags,
      weight: weight ?? this.weight,
      weightUnit: weightUnit ?? this.weightUnit,
      inventory: inventory ?? this.inventory,
      blockedInventory: blockedInventory ?? this.blockedInventory,
      rating: rating ?? this.rating,
      totalOrders: totalOrders ?? this.totalOrders,
      additionalInfo: additionalInfo ?? this.additionalInfo,
      thumbImages: thumbImages ?? this.thumbImages,
      isTaxEnabled: isTaxEnabled ?? this.isTaxEnabled,
      isInventoryEnabled: isInventoryEnabled ?? this.isInventoryEnabled,
      hasVarient: hasVarient ?? this.hasVarient,
      variants: variants ?? this.variants,
      images: images ?? this.images,
      reviews: reviews ?? this.reviews);
  }
  
  Product.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _title = json['title'],
      _brand = json['brand'],
      _vendor = json['vendor'],
      _categoryId = json['categoryId'],
      _subCategoryId = json['subCategoryId'],
      _subCategory = json['subCategory']?['serializedData'] != null
        ? ProductSubCategory.fromJson(new Map<String, dynamic>.from(json['subCategory']['serializedData']))
        : null,
      _storeId = json['storeId'],
      _store = json['store']?['serializedData'] != null
        ? Store.fromJson(new Map<String, dynamic>.from(json['store']['serializedData']))
        : null,
      _isFeatured = json['isFeatured'],
      _category = json['category']?['serializedData'] != null
        ? ProductCategory.fromJson(new Map<String, dynamic>.from(json['category']['serializedData']))
        : null,
      _productType = json['productType'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _slug = json['slug'],
      _productDescription = json['productDescription'],
      _longDescription = json['longDescription'],
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null,
      _isPublished = json['isPublished'],
      _publishedAt = json['publishedAt'] != null ? TemporalDateTime.fromString(json['publishedAt']) : null,
      _price = (json['price'] as num?)?.toDouble(),
      _sku = json['sku'],
      _size = json['size'],
      _color = json['color'],
      _status = enumFromString<ProductStatus>(json['status'], ProductStatus.values),
      _position = (json['position'] as num?)?.toInt(),
      _currency = json['currency'],
      _costPrice = (json['costPrice'] as num?)?.toDouble(),
      _listingPrice = (json['listingPrice'] as num?)?.toDouble(),
      _taxable = json['taxable'],
      _barcode = json['barcode'],
      _tags = json['tags'],
      _weight = (json['weight'] as num?)?.toDouble(),
      _weightUnit = json['weightUnit'],
      _inventory = (json['inventory'] as num?)?.toInt(),
      _blockedInventory = (json['blockedInventory'] as num?)?.toInt(),
      _rating = (json['rating'] as num?)?.toDouble(),
      _totalOrders = (json['totalOrders'] as num?)?.toInt(),
      _additionalInfo = json['additionalInfo'],
      _thumbImages = json['thumbImages'],
      _isTaxEnabled = json['isTaxEnabled'],
      _isInventoryEnabled = json['isInventoryEnabled'],
      _hasVarient = json['hasVarient'],
      _variants = json['variants'] is List
        ? (json['variants'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Variant.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _images = json['images'] is List
        ? (json['images'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => ProductImage.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _reviews = json['reviews'] is List
        ? (json['reviews'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Review.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'title': _title, 'brand': _brand, 'vendor': _vendor, 'categoryId': _categoryId, 'subCategoryId': _subCategoryId, 'subCategory': _subCategory?.toJson(), 'storeId': _storeId, 'store': _store?.toJson(), 'isFeatured': _isFeatured, 'category': _category?.toJson(), 'productType': _productType, 'createdAt': _createdAt?.format(), 'slug': _slug, 'productDescription': _productDescription, 'longDescription': _longDescription, 'updatedAt': _updatedAt?.format(), 'isPublished': _isPublished, 'publishedAt': _publishedAt?.format(), 'price': _price, 'sku': _sku, 'size': _size, 'color': _color, 'status': enumToString(_status), 'position': _position, 'currency': _currency, 'costPrice': _costPrice, 'listingPrice': _listingPrice, 'taxable': _taxable, 'barcode': _barcode, 'tags': _tags, 'weight': _weight, 'weightUnit': _weightUnit, 'inventory': _inventory, 'blockedInventory': _blockedInventory, 'rating': _rating, 'totalOrders': _totalOrders, 'additionalInfo': _additionalInfo, 'thumbImages': _thumbImages, 'isTaxEnabled': _isTaxEnabled, 'isInventoryEnabled': _isInventoryEnabled, 'hasVarient': _hasVarient, 'variants': _variants?.map((Variant? e) => e?.toJson()).toList(), 'images': _images?.map((ProductImage? e) => e?.toJson()).toList(), 'reviews': _reviews?.map((Review? e) => e?.toJson()).toList()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'title': _title, 'brand': _brand, 'vendor': _vendor, 'categoryId': _categoryId, 'subCategoryId': _subCategoryId, 'subCategory': _subCategory, 'storeId': _storeId, 'store': _store, 'isFeatured': _isFeatured, 'category': _category, 'productType': _productType, 'createdAt': _createdAt, 'slug': _slug, 'productDescription': _productDescription, 'longDescription': _longDescription, 'updatedAt': _updatedAt, 'isPublished': _isPublished, 'publishedAt': _publishedAt, 'price': _price, 'sku': _sku, 'size': _size, 'color': _color, 'status': _status, 'position': _position, 'currency': _currency, 'costPrice': _costPrice, 'listingPrice': _listingPrice, 'taxable': _taxable, 'barcode': _barcode, 'tags': _tags, 'weight': _weight, 'weightUnit': _weightUnit, 'inventory': _inventory, 'blockedInventory': _blockedInventory, 'rating': _rating, 'totalOrders': _totalOrders, 'additionalInfo': _additionalInfo, 'thumbImages': _thumbImages, 'isTaxEnabled': _isTaxEnabled, 'isInventoryEnabled': _isInventoryEnabled, 'hasVarient': _hasVarient, 'variants': _variants, 'images': _images, 'reviews': _reviews
  };

  static final QueryModelIdentifier<ProductModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<ProductModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField TITLE = QueryField(fieldName: "title");
  static final QueryField BRAND = QueryField(fieldName: "brand");
  static final QueryField VENDOR = QueryField(fieldName: "vendor");
  static final QueryField CATEGORYID = QueryField(fieldName: "categoryId");
  static final QueryField SUBCATEGORYID = QueryField(fieldName: "subCategoryId");
  static final QueryField SUBCATEGORY = QueryField(
    fieldName: "subCategory",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'ProductSubCategory'));
  static final QueryField STOREID = QueryField(fieldName: "storeId");
  static final QueryField STORE = QueryField(
    fieldName: "store",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Store'));
  static final QueryField ISFEATURED = QueryField(fieldName: "isFeatured");
  static final QueryField CATEGORY = QueryField(
    fieldName: "category",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'ProductCategory'));
  static final QueryField PRODUCTTYPE = QueryField(fieldName: "productType");
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField SLUG = QueryField(fieldName: "slug");
  static final QueryField PRODUCTDESCRIPTION = QueryField(fieldName: "productDescription");
  static final QueryField LONGDESCRIPTION = QueryField(fieldName: "longDescription");
  static final QueryField UPDATEDAT = QueryField(fieldName: "updatedAt");
  static final QueryField ISPUBLISHED = QueryField(fieldName: "isPublished");
  static final QueryField PUBLISHEDAT = QueryField(fieldName: "publishedAt");
  static final QueryField PRICE = QueryField(fieldName: "price");
  static final QueryField SKU = QueryField(fieldName: "sku");
  static final QueryField SIZE = QueryField(fieldName: "size");
  static final QueryField COLOR = QueryField(fieldName: "color");
  static final QueryField STATUS = QueryField(fieldName: "status");
  static final QueryField POSITION = QueryField(fieldName: "position");
  static final QueryField CURRENCY = QueryField(fieldName: "currency");
  static final QueryField COSTPRICE = QueryField(fieldName: "costPrice");
  static final QueryField LISTINGPRICE = QueryField(fieldName: "listingPrice");
  static final QueryField TAXABLE = QueryField(fieldName: "taxable");
  static final QueryField BARCODE = QueryField(fieldName: "barcode");
  static final QueryField TAGS = QueryField(fieldName: "tags");
  static final QueryField WEIGHT = QueryField(fieldName: "weight");
  static final QueryField WEIGHTUNIT = QueryField(fieldName: "weightUnit");
  static final QueryField INVENTORY = QueryField(fieldName: "inventory");
  static final QueryField BLOCKEDINVENTORY = QueryField(fieldName: "blockedInventory");
  static final QueryField RATING = QueryField(fieldName: "rating");
  static final QueryField TOTALORDERS = QueryField(fieldName: "totalOrders");
  static final QueryField ADDITIONALINFO = QueryField(fieldName: "additionalInfo");
  static final QueryField THUMBIMAGES = QueryField(fieldName: "thumbImages");
  static final QueryField ISTAXENABLED = QueryField(fieldName: "isTaxEnabled");
  static final QueryField ISINVENTORYENABLED = QueryField(fieldName: "isInventoryEnabled");
  static final QueryField HASVARIENT = QueryField(fieldName: "hasVarient");
  static final QueryField VARIANTS = QueryField(
    fieldName: "variants",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Variant'));
  static final QueryField IMAGES = QueryField(
    fieldName: "images",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'ProductImage'));
  static final QueryField REVIEWS = QueryField(
    fieldName: "reviews",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Review'));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Product";
    modelSchemaDefinition.pluralName = "Products";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.READ,
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE
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
      ModelIndex(fields: const ["title", "createdAt"], name: "bytitleProduct"),
      ModelIndex(fields: const ["categoryId", "createdAt"], name: "bycategoryIdProduct"),
      ModelIndex(fields: const ["subCategoryId", "createdAt"], name: "bysubCategoryIdProduct"),
      ModelIndex(fields: const ["storeId", "createdAt"], name: "bystoreIdProduct"),
      ModelIndex(fields: const ["slug", "createdAt"], name: "byslugProduct")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.TITLE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.BRAND,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.VENDOR,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.CATEGORYID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.SUBCATEGORYID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: Product.SUBCATEGORY,
      isRequired: false,
      ofModelName: 'ProductSubCategory',
      associatedKey: ProductSubCategory.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.STOREID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: Product.STORE,
      isRequired: false,
      ofModelName: 'Store',
      associatedKey: Store.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.ISFEATURED,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: Product.CATEGORY,
      isRequired: false,
      ofModelName: 'ProductCategory',
      associatedKey: ProductCategory.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.PRODUCTTYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.CREATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.SLUG,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.PRODUCTDESCRIPTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.LONGDESCRIPTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.UPDATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.ISPUBLISHED,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.PUBLISHEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.PRICE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.SKU,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.SIZE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.COLOR,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.STATUS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.POSITION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.CURRENCY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.COSTPRICE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.LISTINGPRICE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.TAXABLE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.BARCODE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.TAGS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.WEIGHT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.WEIGHTUNIT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.INVENTORY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.BLOCKEDINVENTORY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.RATING,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.TOTALORDERS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.ADDITIONALINFO,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.THUMBIMAGES,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.ISTAXENABLED,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.ISINVENTORYENABLED,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Product.HASVARIENT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Product.VARIANTS,
      isRequired: false,
      ofModelName: 'Variant',
      associatedKey: Variant.PRODUCTID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Product.IMAGES,
      isRequired: false,
      ofModelName: 'ProductImage',
      associatedKey: ProductImage.PRODUCTID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Product.REVIEWS,
      isRequired: false,
      ofModelName: 'Review',
      associatedKey: Review.PRODUCTID
    ));
  });
}

class _ProductModelType extends ModelType<Product> {
  const _ProductModelType();
  
  @override
  Product fromJson(Map<String, dynamic> jsonData) {
    return Product.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Product';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Product] in your schema.
 */
@immutable
class ProductModelIdentifier implements ModelIdentifier<Product> {
  final String id;

  /** Create an instance of ProductModelIdentifier using [id] the primary key. */
  const ProductModelIdentifier({
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
  String toString() => 'ProductModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is ProductModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}