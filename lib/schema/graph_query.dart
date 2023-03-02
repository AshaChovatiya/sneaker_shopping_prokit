class GraphQuerySchema {
  static getSingleProduct(String productId) {
    return '''query MyQuery {
  getProduct(id: "$productId") {
    id
    title
    brand
    vendor
    categoryId
    subCategoryId
    subCategory {
      id
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
    isFeatured
    category {
      id
      name
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
          createdAt
          updatedAt
        }
        productId
        rating
        comment
        createdAt
        updatedAt
      }
      nextToken
    }
    store {
      id
      createdAt
      updatedAt
      description
      host
      imageUrl
      isActive
      name
      priority
      webUrl
      appId
    }
  }
}''';
  }

  static getListProductCategories() {
    return ''' query MyQuery {
  listProductCategories {
    nextToken
    items {
      description
      id
      imageUrl
      isFeatured
      name
      priority
      slug
      storeId
      totalProducts
      updatedAt
      subCategory {
        items {
          id
          description
          imageUrl
          isFeatured
          name
          priority
          storeId
          totalProducts
          updatedAt
        }
      }
      products {
        items {
          additionalInfo
          barcode
          blockedInventory
          brand
          categoryId
          category {
            description
            id
            imageUrl
            name
            slug
            totalProducts
          }
          color
          isFeatured
          price
        }
      }
    }
  }
}
''';
  }

  static listProduct({String? nextToken}) {
    if (nextToken != null) {
      return '''query MyQuery {
  listProducts (nextToken: "$nextToken", limit: 10) {
    nextToken
    items {
      additionalInfo
      barcode
      blockedInventory
      brand
      categoryId
      color
      costPrice
      createdAt
      currency
       images {
        items {
          height
          id
          imageKey
          productId
          position
          isThumb
        }
      }
      hasVarient
      id
      inventory
      isFeatured
      isInventoryEnabled
      isPublished
      isTaxEnabled
      listingPrice
      longDescription
      position
      price
      productDescription
      productType
      rating
      size
      sku
      slug
      status
      subCategoryId
      thumbImages
      taxable
      tags
      title
      totalOrders
      updatedAt
      weight
      weightUnit
    }
  }
}''';
    }

    return '''query MyQuery {
  listProducts (limit: 10) {
    nextToken
    items {
      additionalInfo
      barcode
      blockedInventory
      brand
      categoryId
      color
      costPrice
      createdAt
      currency
       images {
        items {
          height
          id
          imageKey
          productId
          position
          isThumb
        }
      }
      hasVarient
      id
      inventory
      isFeatured
      isInventoryEnabled
      isPublished
      isTaxEnabled
      listingPrice
      longDescription
      position
      price
      productDescription
      productType
      rating
      size
      sku
      slug
      status
      subCategoryId
      thumbImages
      taxable
      tags
      title
      totalOrders
      updatedAt
      weight
      weightUnit
    }
  }
}''';
  }

  static searchProduct(String query, String? nextToken) {
    if (nextToken == null) {
      return '''query MyQuery {
  searchProducts(filter: {title: {match: "$query"}}, limit: 10,) {
    total
    items {
      id
      barcode
      price
      thumbImages
      title
      currency
      costPrice
      categoryId
      brand
      tags
      slug
      productDescription
      images(limit: 1) {
        items {
          imageKey
          productId
        }
      }
    }
    nextToken
  }
}''';
    }
    return '''query MyQuery {
  searchProducts(filter: {title: {match: "$query"}}, limit: 10, nextToken: "$nextToken") {
    total
    items {
      barcode
      price
      thumbImages
      title
      currency
      costPrice
      categoryId
      brand
      tags
      slug
      productDescription
      images(limit: 1) {
        items {
          imageKey
          productId
        }
      }
    }
    nextToken
  }
}''';
  }

  static String getWishList({required String userId}) {
    return '''query MyQuery {
  listWishlists(filter: {userId: {eq: "$userId"}}) {
    items {
      id
      wishlistProducts {
        items {
          productId
          product {
            title
            totalOrders
            additionalInfo
            currency
            costPrice
            color
            price
            listingPrice
            isFeatured
            size
            status
            thumbImages
            images {
              items {
                imageKey
                id
                productId
              }
            }
          }
        }
      }
    }
  }
}''';
  }

  static String getShoppingCartList({required String userId}) {
    return '''query MyQuery {
  listShoppingCarts(filter: {userId: {eq: "$userId"}}) {
    nextToken
    items {
      userId
      id
      shoppingcartProducts {
        items {
          id
          productId
          quantity
          shoppingcartId
          product {
            brand
            additionalInfo
            costPrice
            price
            productDescription
            sku
            listingPrice
            isFeatured
            thumbImages
            images {
              items {
                imageKey
                productId
                id
              }
            }
            title
            totalOrders
            currency
            color
            size
            status
          }
        }
      }
    }
  }
}
''';
  }

  static String getWishlistProductId({required String userId}) {
    return '''query MyQuery {
  listWishlists(filter: {userId: {eq: "$userId"}}) {
    nextToken
    items {
      wishlistProducts {
        items {
          productId
        }
      }
      id
    }
  }
}''';
  }

  static String getUserDetails(String userId) {
    return '''query MyQuery {
  getUser(id: "$userId") {
    id
    address
    area
    authProvider
    city
    country
    createdAt
    dob
    email
    firstName
    gender
    isActive
    isAdmin
    isCognitoConfirmed
    landmark
    lastName
    location
    phone
    pinCode
    profilePhotoUrl
    state
    totalOrders
    totalSpent
    walletBalance
    walletSpent
  }
}''';
  }

  static String getCouponCode({required String userId}) {
    return '''query MyQuery {
  listCouponCodes(filter: {userId: {eq: "$userId"}}) {
    nextToken
    items {
      code
      couponType
      createdAt
      description
      discount
      expirationDate
      id
      isActive
      isFeatured
      maxDiscount
      maxUse
      minOrderValue
      paymentMethod
      totalUsed
      updatedAt
      userId
    }
  }
}''';
  }

  static String getMyOrder({required String userId}) {
    return '''query MyQuery {
  listOrders(filter: {userId: {eq: "$userId"}}) {
    items {
      id
      products {
        items {
          additionalInfo
          cashOnDeliveryCharges
          centralGstPercentage
          compensationCessPercentage
          currency
          deliveryPartner
          discount
          dispatchDate
          id
          orderId
          quantity
          title
          totalPrice
          status
          productId
          product {
            additionalInfo
            brand
            color
            currency
            id
            price
            productType
            longDescription
            isFeatured
            status
            title
            thumbImages
            listingPrice
            totalOrders
          }
          price
          invoiceDate
          invoiceNumber
          onHold
        }
      }
      currency
      orderDate
      totalAmount
      totalCashOnDeliveryCharges
      totalDiscount
      totalGiftCharges
      totalPrepaidAmount
      totalShippingCharges
      totalStoreCredit
      couponCodeId
      status
    }
  }
}
''';
  }

  static String getUserAddressOrder({required String userId}) {
    return '''query MyQuery {
  byuserIDUserAddress(userID: "$userId") {
    items {
      city
      country
      userID
      updatedAt
      state
      pinCode
      phone
      location
      name
      landmark
      id
      email
      createdAt
      area
      address
    }
  }
}''';
  }

  static String getProductReview({required String productId}) {
    return '''query MyQuery {
  byProductidcreatedAtReview(productId: "$productId") {
    items {
      comment
      id
      productId
      rating
      reviewer {
        email
        name
      }
    }
  }
}''';
  }
}
