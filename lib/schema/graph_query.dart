class GraphQuerySchema {
  static getUserDetail(String userId) {
    return ''' query MyQuery {
  getUser(id: "$userId") {
     id
    city
    state
    country
    address
    area
    authProvider
    dob
    email
    firstName
    gender
    location
    totalOrders
    landmark
    isCognitoConfirmed
    phone
    pinCode
    profilePhotoUrl
    userAddress {
      items {
        address
        area
        city
        country
        createdAt
        email
        id
        landmark
        location
        name
        phone
        state
        pinCode
        userID
        updatedAt
      }
    }
  }
}''';
  }

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

  static listProduct() {
    return '''query MyQuery {
  listProducts {
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
    /*return """query ListProducts(
    \$filter: ModelProductFilterInput
   \$limit: Int
    \$nextToken: String
  ) {
    listProducts(filter: \$filter, limit: \$limit, nextToken: \$nextToken) {
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
  }
""";*/
  }

  static searchProduct(String query, String? nextToken) {
    if (nextToken == null) {
      return '''query MyQuery {
  searchProducts(aggregates: {name: "$query", field: title, type: terms}, limit: 10,) {
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
    return '''query MyQuery {
  searchProducts(aggregates: {name: "$query", field: title, type: terms}, limit: 10, nextToken: "$nextToken") {
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
}
