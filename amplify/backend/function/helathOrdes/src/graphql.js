exports.getOrder = /* GraphQL */ `
query GetOrder($id: ID!) {
  getOrder(id: $id) {
    id
    code
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
      wishlists {
        nextToken
      }
      shopingcarts {
        nextToken
      }
      reviews {
        nextToken
      }
      orders {
        nextToken
      }
      payments {
        nextToken
      }
      createdAt
      updatedAt
    }
    channelName
    shippingAddress {
      country
      state
      city
      pinCode
      landmark
      address
      location
      area
    }
    BillingAddress {
      country
      state
      city
      pinCode
      landmark
      address
      location
      area
    }
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
    sla
    priority
    orderDate
    status
    products {
      items {
        id
        orderId
        productId
        variantId
        sku
        returnReason
        returnDate
        returnAWB
        returnShippingProvider
        title
        shippingMethodCode
        cashOnDeliveryCharges
        sellingPrice
        shippingCharges
        discount
        totalPrice
        currency
        onHold
        facilityCode
        gstin
        additionalInfo
        centralGstPercentage
        compensationCessPercentage
        integratedGstPercentage
        stateGstPercentage
        taxRate
        unionTerritoryGstPercentage
        deliveryPartner
        dispatchDate
        invoiceDate
        invoiceNumber
        tentativeDeliveryDate
        trackingId
        quantity
        price
        status
        createdAt
        updatedAt
      }
      nextToken
    }
    payments {
      items {
        id
        userId
        orderId
        method
        amount
        createdAt
        updatedAt
      }
      nextToken
    }
    createdAt
    updatedAt
  }
}
`;

exports.listOrders = /* GraphQL */ `
query ListOrders(
  $filter: ModelOrderFilterInput
  $limit: Int
  $nextToken: String
) {
  listOrders(filter: $filter, limit: $limit, nextToken: $nextToken) {
    items {
      id
      code
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
      channelName
      shippingAddress {
        country
        state
        city
        pinCode
        landmark
        address
        location
        area
      }
      BillingAddress {
        country
        state
        city
        pinCode
        landmark
        address
        location
        area
      }
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
      sla
      priority
      orderDate
      status
      products {
        nextToken
      }
      payments {
        nextToken
      }
      createdAt
      updatedAt
    }
    nextToken
  }
}
`;
