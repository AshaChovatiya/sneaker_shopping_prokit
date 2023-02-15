import 'dart:convert';

import 'package:amplify_api/model_queries.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shopping_prokit/models/ModelProvider.dart';
import 'package:sneaker_shopping_prokit/providers/initial_provider.dart';
import 'package:sneaker_shopping_prokit/service/mutations.dart';

import '../models/Wishlist.dart';

class WishListProvider extends ChangeNotifier {
  bool _isLoading = true;

  bool get isLoading => _isLoading;
  List<WishlistProduct>? _wishList = [];

  List<WishlistProduct>? get wishList => _wishList;

  set wishList(List<WishlistProduct>? value) {
    _wishList = value;
    notifyListeners();
  }

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getWishList(BuildContext context) async {
    isLoading = true;
    final String userId = context.read<InitialProvider>().currentUser!.userId;
    wishList = await AWSMutations.getWishList(userId: userId).catchError((e) {
      print(e);
    });

    isLoading = false;
  }

  /*getProductItemData() async {
    var getProduct = '''query ListProducts(
       
    ) {
      listProducts() {
        items {
          id
          title
          brand
          vendor
          categoryId
          subCategoryId
          subCategory {
            id
            storeId
            store {
              id
              name
              description
              isActive
              webUrl
              appId
              host
              priority
              imageUrl
              products {
                items {
                  id
                  title
                  brand
                  vendor
                  categoryId
                  subCategoryId
                  subCategory {
                    id
                    storeId
                    name
                    description
                    categoryID
                    slug
                    isFeatured
                    totalProducts
                    priority
                    imageUrl
                    createdAt
                    updatedAt
                  }
                  storeId
                  store {
                    id
                    name
                    description
                    isActive
                    webUrl
                    appId
                    host
                    priority
                    imageUrl
                    createdAt
                    updatedAt
                  }
                  isFeatured
                  category {
                    id
                    name
                    storeId
                    description
                    slug
                    isFeatured
                    totalProducts
                    priority
                    imageUrl
                    createdAt
                    updatedAt
                  }
                  productType
                  createdAt
                  slug
                  productDescription
                  longDescription
                  updatedAt
                  isPublished
                  publishedAt
                  price
                  sku
                  size
                  color
                  status
                  position
                  currency
                  costPrice
                  listingPrice
                  taxable
                  barcode
                  tags
                  weight
                  weightUnit
                  inventory
                  blockedInventory
                  rating
                  totalOrders
                  additionalInfo
                  thumbImages
                  isTaxEnabled
                  isInventoryEnabled
                  hasVarient
                  variants {
                    nextToken
                  }
                  images {
                    nextToken
                  }
                  reviews {
                    nextToken
                  }
                }
                nextToken
              }
              createdAt
              updatedAt
            }
            name
            description
            categoryID
            category {
              id
              name
              storeId
              store {
                id
                name
                description
                isActive
                webUrl
                appId
                host
                priority
                imageUrl
                products {
                  items {
                    id
                    title
                    brand
                    vendor
                    categoryId
                    subCategoryId
                    storeId
                    isFeatured
                    productType
                    createdAt
                    slug
                    productDescription
                    longDescription
                    updatedAt
                    isPublished
                    publishedAt
                    price
                    sku
                    size
                    color
                    status
                    position
                    currency
                    costPrice
                    listingPrice
                    taxable
                    barcode
                    tags
                    weight
                    weightUnit
                    inventory
                    blockedInventory
                    rating
                    totalOrders
                    additionalInfo
                    thumbImages
                    isTaxEnabled
                    isInventoryEnabled
                    hasVarient
                  }
                  nextToken
                }
                createdAt
                updatedAt
              }
              description
              slug
              isFeatured
              totalProducts
              priority
              imageUrl
              products {
                items {
                  id
                  title
                  brand
                  vendor
                  categoryId
                  subCategoryId
                  subCategory {
                    id
                    storeId
                    name
                    description
                    categoryID
                    slug
                    isFeatured
                    totalProducts
                    priority
                    imageUrl
                    createdAt
                    updatedAt
                  }
                  storeId
                  store {
                    id
                    name
                    description
                    isActive
                    webUrl
                    appId
                    host
                    priority
                    imageUrl
                    createdAt
                    updatedAt
                  }
                  isFeatured
                  category {
                    id
                    name
                    storeId
                    description
                    slug
                    isFeatured
                    totalProducts
                    priority
                    imageUrl
                    createdAt
                    updatedAt
                  }
                  productType
                  createdAt
                  slug
                  productDescription
                  longDescription
                  updatedAt
                  isPublished
                  publishedAt
                  price
                  sku
                  size
                  color
                  status
                  position
                  currency
                  costPrice
                  listingPrice
                  taxable
                  barcode
                  tags
                  weight
                  weightUnit
                  inventory
                  blockedInventory
                  rating
                  totalOrders
                  additionalInfo
                  thumbImages
                  isTaxEnabled
                  isInventoryEnabled
                  hasVarient
                  variants {
                    nextToken
                  }
                  images {
                    nextToken
                  }
                  reviews {
                    nextToken
                  }
                }
                nextToken
              }
              subCategory {
                items {
                  id
                  storeId
                  store {
                    id
                    name
                    description
                    isActive
                    webUrl
                    appId
                    host
                    priority
                    imageUrl
                    createdAt
                    updatedAt
                  }
                  name
                  description
                  categoryID
                  category {
                    id
                    name
                    storeId
                    description
                    slug
                    isFeatured
                    totalProducts
                    priority
                    imageUrl
                    createdAt
                    updatedAt
                  }
                  slug
                  isFeatured
                  totalProducts
                  priority
                  imageUrl
                  products {
                    nextToken
                  }
                  createdAt
                  updatedAt
                }
                nextToken
              }
              createdAt
              updatedAt
            }
            slug
            isFeatured
            totalProducts
            priority
            imageUrl
            products {
              items {
                id
                title
                brand
                vendor
                categoryId
                subCategoryId
                subCategory {
                  id
                  storeId
                  store {
                    id
                    name
                    description
                    isActive
                    webUrl
                    appId
                    host
                    priority
                    imageUrl
                    createdAt
                    updatedAt
                  }
                  name
                  description
                  categoryID
                  category {
                    id
                    name
                    storeId
                    description
                    slug
                    isFeatured
                    totalProducts
                    priority
                    imageUrl
                    createdAt
                    updatedAt
                  }
                  slug
                  isFeatured
                  totalProducts
                  priority
                  imageUrl
                  products {
                    nextToken
                  }
                  createdAt
                  updatedAt
                }
                storeId
                store {
                  id
                  name
                  description
                  isActive
                  webUrl
                  appId
                  host
                  priority
                  imageUrl
                  products {
                    nextToken
                  }
                  createdAt
                  updatedAt
                }
                isFeatured
                category {
                  id
                  name
                  storeId
                  store {
                    id
                    name
                    description
                    isActive
                    webUrl
                    appId
                    host
                    priority
                    imageUrl
                    createdAt
                    updatedAt
                  }
                  description
                  slug
                  isFeatured
                  totalProducts
                  priority
                  imageUrl
                  products {
                    nextToken
                  }
                  subCategory {
                    nextToken
                  }
                  createdAt
                  updatedAt
                }
                productType
                createdAt
                slug
                productDescription
                longDescription
                updatedAt
                isPublished
                publishedAt
                price
                sku
                size
                color
                status
                position
                currency
                costPrice
                listingPrice
                taxable
                barcode
                tags
                weight
                weightUnit
                inventory
                blockedInventory
                rating
                totalOrders
                additionalInfo
                thumbImages
                isTaxEnabled
                isInventoryEnabled
                hasVarient
                variants {
                  items {
                    id
                    productId
                    title
                    price
                    sku
                    size
                    color
                    status
                    position
                    currency
                    costPrice
                    listingPrice
                    createdAt
                    updatedAt
                    taxable
                    barcode
                    imageUrl
                    weight
                    weightUnit
                    inventory
                    blockedInventory
                  }
                  nextToken
                }
                images {
                  items {
                    id
                    productId
                    position
                    createdAt
                    updatedAt
                    alt
                    width
                    height
                    imageKey
                    isThumb
                  }
                  nextToken
                }
                reviews {
                  items {
                    id
                    userId
                    productId
                    rating
                    comment
                    createdAt
                    updatedAt
                  }
                  nextToken
                }
              }
              nextToken
            }
            createdAt
            updatedAt
          }
          storeId
          store {
            id
            name
            description
            isActive
            webUrl
            appId
            host
            priority
            imageUrl
            products {
              items {
                id
                title
                brand
                vendor
                categoryId
                subCategoryId
                subCategory {
                  id
                  storeId
                  store {
                    id
                    name
                    description
                    isActive
                    webUrl
                    appId
                    host
                    priority
                    imageUrl
                    createdAt
                    updatedAt
                  }
                  name
                  description
                  categoryID
                  category {
                    id
                    name
                    storeId
                    description
                    slug
                    isFeatured
                    totalProducts
                    priority
                    imageUrl
                    createdAt
                    updatedAt
                  }
                  slug
                  isFeatured
                  totalProducts
                  priority
                  imageUrl
                  products {
                    nextToken
                  }
                  createdAt
                  updatedAt
                }
                storeId
                store {
                  id
                  name
                  description
                  isActive
                  webUrl
                  appId
                  host
                  priority
                  imageUrl
                  products {
                    nextToken
                  }
                  createdAt
                  updatedAt
                }
                isFeatured
                category {
                  id
                  name
                  storeId
                  store {
                    id
                    name
                    description
                    isActive
                    webUrl
                    appId
                    host
                    priority
                    imageUrl
                    createdAt
                    updatedAt
                  }
                  description
                  slug
                  isFeatured
                  totalProducts
                  priority
                  imageUrl
                  products {
                    nextToken
                  }
                  subCategory {
                    nextToken
                  }
                  createdAt
                  updatedAt
                }
                productType
                createdAt
                slug
                productDescription
                longDescription
                updatedAt
                isPublished
                publishedAt
                price
                sku
                size
                color
                status
                position
                currency
                costPrice
                listingPrice
                taxable
                barcode
                tags
                weight
                weightUnit
                inventory
                blockedInventory
                rating
                totalOrders
                additionalInfo
                thumbImages
                isTaxEnabled
                isInventoryEnabled
                hasVarient
                variants {
                  items {
                    id
                    productId
                    title
                    price
                    sku
                    size
                    color
                    status
                    position
                    currency
                    costPrice
                    listingPrice
                    createdAt
                    updatedAt
                    taxable
                    barcode
                    imageUrl
                    weight
                    weightUnit
                    inventory
                    blockedInventory
                  }
                  nextToken
                }
                images {
                  items {
                    id
                    productId
                    position
                    createdAt
                    updatedAt
                    alt
                    width
                    height
                    imageKey
                    isThumb
                  }
                  nextToken
                }
                reviews {
                  items {
                    id
                    userId
                    productId
                    rating
                    comment
                    createdAt
                    updatedAt
                  }
                  nextToken
                }
              }
              nextToken
            }
            createdAt
            updatedAt
          }
          isFeatured
          category {
            id
            name
            storeId
            store {
              id
              name
              description
              isActive
              webUrl
              appId
              host
              priority
              imageUrl
              products {
                items {
                  id
                  title
                  brand
                  vendor
                  categoryId
                  subCategoryId
                  subCategory {
                    id
                    storeId
                    name
                    description
                    categoryID
                    slug
                    isFeatured
                    totalProducts
                    priority
                    imageUrl
                    createdAt
                    updatedAt
                  }
                  storeId
                  store {
                    id
                    name
                    description
                    isActive
                    webUrl
                    appId
                    host
                    priority
                    imageUrl
                    createdAt
                    updatedAt
                  }
                  isFeatured
                  category {
                    id
                    name
                    storeId
                    description
                    slug
                    isFeatured
                    totalProducts
                    priority
                    imageUrl
                    createdAt
                    updatedAt
                  }
                  productType
                  createdAt
                  slug
                  productDescription
                  longDescription
                  updatedAt
                  isPublished
                  publishedAt
                  price
                  sku
                  size
                  color
                  status
                  position
                  currency
                  costPrice
                  listingPrice
                  taxable
                  barcode
                  tags
                  weight
                  weightUnit
                  inventory
                  blockedInventory
                  rating
                  totalOrders
                  additionalInfo
                  thumbImages
                  isTaxEnabled
                  isInventoryEnabled
                  hasVarient
                  variants {
                    nextToken
                  }
                  images {
                    nextToken
                  }
                  reviews {
                    nextToken
                  }
                }
                nextToken
              }
              createdAt
              updatedAt
            }
            description
            slug
            isFeatured
            totalProducts
            priority
            imageUrl
            products {
              items {
                id
                title
                brand
                vendor
                categoryId
                subCategoryId
                subCategory {
                  id
                  storeId
                  store {
                    id
                    name
                    description
                    isActive
                    webUrl
                    appId
                    host
                    priority
                    imageUrl
                    createdAt
                    updatedAt
                  }
                  name
                  description
                  categoryID
                  category {
                    id
                    name
                    storeId
                    description
                    slug
                    isFeatured
                    totalProducts
                    priority
                    imageUrl
                    createdAt
                    updatedAt
                  }
                  slug
                  isFeatured
                  totalProducts
                  priority
                  imageUrl
                  products {
                    nextToken
                  }
                  createdAt
                  updatedAt
                }
                storeId
                store {
                  id
                  name
                  description
                  isActive
                  webUrl
                  appId
                  host
                  priority
                  imageUrl
                  products {
                    nextToken
                  }
                  createdAt
                  updatedAt
                }
                isFeatured
                category {
                  id
                  name
                  storeId
                  store {
                    id
                    name
                    description
                    isActive
                    webUrl
                    appId
                    host
                    priority
                    imageUrl
                    createdAt
                    updatedAt
                  }
                  description
                  slug
                  isFeatured
                  totalProducts
                  priority
                  imageUrl
                  products {
                    nextToken
                  }
                  subCategory {
                    nextToken
                  }
                  createdAt
                  updatedAt
                }
                productType
                createdAt
                slug
                productDescription
                longDescription
                updatedAt
                isPublished
                publishedAt
                price
                sku
                size
                color
                status
                position
                currency
                costPrice
                listingPrice
                taxable
                barcode
                tags
                weight
                weightUnit
                inventory
                blockedInventory
                rating
                totalOrders
                additionalInfo
                thumbImages
                isTaxEnabled
                isInventoryEnabled
                hasVarient
                variants {
                  items {
                    id
                    productId
                    title
                    price
                    sku
                    size
                    color
                    status
                    position
                    currency
                    costPrice
                    listingPrice
                    createdAt
                    updatedAt
                    taxable
                    barcode
                    imageUrl
                    weight
                    weightUnit
                    inventory
                    blockedInventory
                  }
                  nextToken
                }
                images {
                  items {
                    id
                    productId
                    position
                    createdAt
                    updatedAt
                    alt
                    width
                    height
                    imageKey
                    isThumb
                  }
                  nextToken
                }
                reviews {
                  items {
                    id
                    userId
                    productId
                    rating
                    comment
                    createdAt
                    updatedAt
                  }
                  nextToken
                }
              }
              nextToken
            }
            subCategory {
              items {
                id
                storeId
                store {
                  id
                  name
                  description
                  isActive
                  webUrl
                  appId
                  host
                  priority
                  imageUrl
                  products {
                    nextToken
                  }
                  createdAt
                  updatedAt
                }
                name
                description
                categoryID
                category {
                  id
                  name
                  storeId
                  store {
                    id
                    name
                    description
                    isActive
                    webUrl
                    appId
                    host
                    priority
                    imageUrl
                    createdAt
                    updatedAt
                  }
                  description
                  slug
                  isFeatured
                  totalProducts
                  priority
                  imageUrl
                  products {
                    nextToken
                  }
                  subCategory {
                    nextToken
                  }
                  createdAt
                  updatedAt
                }
                slug
                isFeatured
                totalProducts
                priority
                imageUrl
                products {
                  items {
                    id
                    title
                    brand
                    vendor
                    categoryId
                    subCategoryId
                    storeId
                    isFeatured
                    productType
                    createdAt
                    slug
                    productDescription
                    longDescription
                    updatedAt
                    isPublished
                    publishedAt
                    price
                    sku
                    size
                    color
                    status
                    position
                    currency
                    costPrice
                    listingPrice
                    taxable
                    barcode
                    tags
                    weight
                    weightUnit
                    inventory
                    blockedInventory
                    rating
                    totalOrders
                    additionalInfo
                    thumbImages
                    isTaxEnabled
                    isInventoryEnabled
                    hasVarient
                  }
                  nextToken
                }
                createdAt
                updatedAt
              }
              nextToken
            }
            createdAt
            updatedAt
          }
          productType
          createdAt
          slug
          productDescription
          longDescription
          updatedAt
          isPublished
          publishedAt
          price
          sku
          size
          color
          status
          position
          currency
          costPrice
          listingPrice
          taxable
          barcode
          tags
          weight
          weightUnit
          inventory
          blockedInventory
          rating
          totalOrders
          additionalInfo
          thumbImages
          isTaxEnabled
          isInventoryEnabled
          hasVarient
          variants {
            items {
              id
              productId
              title
              price
              sku
              size
              color
              status
              position
              currency
              costPrice
              listingPrice
              createdAt
              updatedAt
              taxable
              barcode
              imageUrl
              weight
              weightUnit
              inventory
              blockedInventory
            }
            nextToken
          }
          images {
            items {
              id
              productId
              position
              createdAt
              updatedAt
              alt
              width
              height
              imageKey
              isThumb
            }
            nextToken
          }
          reviews {
            items {
              id
              userId
              user {
                id
                storeId
                store {
                  id
                  name
                  description
                  isActive
                  webUrl
                  appId
                  host
                  priority
                  imageUrl
                  products {
                    nextToken
                  }
                  createdAt
                  updatedAt
                }
                owner
                firstName
                lastName
                email
                phone
                gender
                dob
                country
                state
                city
                pinCode
                landmark
                address
                location
                area
                isActive
                authProvider
                totalOrders
                totalSpent
                walletBalance
                walletSpent
                totalStoreCredit
                isAdmin
                profilePhotoUrl
                wishlists {
                  items {
                    id
                    storeId
                    userId
                    createdAt
                    updatedAt
                  }
                  nextToken
                }
                shopingcarts {
                  items {
                    id
                    storeId
                    userId
                    createdAt
                    updatedAt
                  }
                  nextToken
                }
                reviews {
                  items {
                    id
                    userId
                    productId
                    rating
                    comment
                    createdAt
                    updatedAt
                  }
                  nextToken
                }
                orders {
                  items {
                    id
                    code
                    storeId
                    userId
                    channelName
                    totalStoreCredit
                    CouponCodeId
                    totalCashOnDeliveryCharges
                    totalDiscount
                    totalGiftCharges
                    totalPrepaidAmount
                    totalShippingCharges
                    taxExempted
                    cFormProvided
                    thirdPartyShipping
                    currency
                    sla
                    priority
                    orderDate
                    status
                    createdAt
                    updatedAt
                  }
                  nextToken
                }
                payments {
                  items {
                    id
                    storeId
                    userId
                    orderId
                    method
                    amount
                    createdAt
                    updatedAt
                  }
                  nextToken
                }
                userAddress {
                  items {
                    id
                    userID
                    name
                    phone
                    email
                    country
                    state
                    city
                    pinCode
                    landmark
                    address
                    location
                    area
                    createdAt
                    updatedAt
                  }
                  nextToken
                }
                couponCodes {
                  items {
                    id
                    code
                    isForAll
                    storeId
                    userId
                    discount
                    expirationDate
                    maxUse
                    totalUsed
                    isActive
                    createdAt
                    updatedAt
                  }
                  nextToken
                }
                createdAt
                updatedAt
              }
              productId
              product {
                id
                title
                brand
                vendor
                categoryId
                subCategoryId
                subCategory {
                  id
                  storeId
                  store {
                    id
                    name
                    description
                    isActive
                    webUrl
                    appId
                    host
                    priority
                    imageUrl
                    createdAt
                    updatedAt
                  }
                  name
                  description
                  categoryID
                  category {
                    id
                    name
                    storeId
                    description
                    slug
                    isFeatured
                    totalProducts
                    priority
                    imageUrl
                    createdAt
                    updatedAt
                  }
                  slug
                  isFeatured
                  totalProducts
                  priority
                  imageUrl
                  products {
                    nextToken
                  }
                  createdAt
                  updatedAt
                }
                storeId
                store {
                  id
                  name
                  description
                  isActive
                  webUrl
                  appId
                  host
                  priority
                  imageUrl
                  products {
                    nextToken
                  }
                  createdAt
                  updatedAt
                }
                isFeatured
                category {
                  id
                  name
                  storeId
                  store {
                    id
                    name
                    description
                    isActive
                    webUrl
                    appId
                    host
                    priority
                    imageUrl
                    createdAt
                    updatedAt
                  }
                  description
                  slug
                  isFeatured
                  totalProducts
                  priority
                  imageUrl
                  products {
                    nextToken
                  }
                  subCategory {
                    nextToken
                  }
                  createdAt
                  updatedAt
                }
                productType
                createdAt
                slug
                productDescription
                longDescription
                updatedAt
                isPublished
                publishedAt
                price
                sku
                size
                color
                status
                position
                currency
                costPrice
                listingPrice
                taxable
                barcode
                tags
                weight
                weightUnit
                inventory
                blockedInventory
                rating
                totalOrders
                additionalInfo
                thumbImages
                isTaxEnabled
                isInventoryEnabled
                hasVarient
                variants {
                  items {
                    id
                    productId
                    title
                    price
                    sku
                    size
                    color
                    status
                    position
                    currency
                    costPrice
                    listingPrice
                    createdAt
                    updatedAt
                    taxable
                    barcode
                    imageUrl
                    weight
                    weightUnit
                    inventory
                    blockedInventory
                  }
                  nextToken
                }
                images {
                  items {
                    id
                    productId
                    position
                    createdAt
                    updatedAt
                    alt
                    width
                    height
                    imageKey
                    isThumb
                  }
                  nextToken
                }
                reviews {
                  items {
                    id
                    userId
                    productId
                    rating
                    comment
                    createdAt
                    updatedAt
                  }
                  nextToken
                }
              }
              rating
              comment
              createdAt
              updatedAt
            }
            nextToken
          }
        }
        nextToken
      }
    }''';

    try {
      var operation = Amplify.API.query(
          request: GraphQLRequest<String>(
        document: getProduct,
      ));
      var response = await operation.response;
      print(response.errors);
      var data = response.data;

      print("Response:------- $data");

      Product p = Product.fromJson(jsonDecode(response.data!));
      print("ProductItemData:------- ${p}");
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }*/
}
