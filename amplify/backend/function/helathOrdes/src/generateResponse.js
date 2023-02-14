const validateResponse = (data, type) => {
  if (type === "boolean") return data || false;
  if (type === "str") return data || null;
  if (type === "int") return data || 0;
  if (type === "obj") return data || {};
  if (type === "arr") return data || [];
};
const getOrdersResponse = ( orderData ) => {
  const response = {
    "orders": [
      {
        "id": validateResponse(orderData?.id, "str"), //"string",
        "code":validateResponse(orderData?.id, "str"), //"string",
        "orderDate": validateResponse(orderData?.orderDate, "str"),
        "orderStatus": validateResponse(orderData?.status, "str"),  // "CREATED",
        "sla":  validateResponse(orderData?.orderDate, "str"),
        "priority":  validateResponse(orderData?.priority, "str"),// 0,
        "paymentType":  validateResponse(orderData?.invalid, "str"),//"PREPAID",
        "orderPrice": {
          "currency":  validateResponse(orderData?.invalid, "str"), //"INR",
          "totalCashOnDeliveryCharges":  validateResponse(orderData?.totalCashOnDeliveryCharges, "int"),//  0,
          "totalDiscount": validateResponse(orderData?.totalDiscount, "int"),// 0,
          "totalGiftCharges": validateResponse(orderData?.totalGiftCharges, "int"),// 0,
          "totalStoreCredit":  validateResponse(orderData?.totalStoreCredit, "int"),// 0,
          "totalPrepaidAmount": validateResponse(orderData?.totalPrepaidAmount, "int"),// 0,
          "totalShippingCharges": validateResponse(orderData?.totalShippingCharges, "int"),// 0
        },
        "orderItems": [
          {
            "orderItemId":  validateResponse(orderData?.invalid, "str"),//"string",
            "status":  validateResponse(orderData?.invalid, "str"), // "CREATED",
            "productId":  validateResponse(orderData?.invalid, "str"),// //"string",
            "variantId":  validateResponse(orderData?.invalid, "str"),//"string",
            "sku":  validateResponse(orderData?.invalid, "str"), //"string",
            "returnReason":  validateResponse(orderData?.invalid, "str"), //"string",
            "returnDate": validateResponse(orderData?.invalid, "str"), //"string",
            "returnAWB": validateResponse(orderData?.invalid, "str"), //"string",
            "returnShippingProvider":  validateResponse(orderData?.invalid, "str"),//"string",
            "title":  validateResponse(orderData?.invalid, "str"),//"string",
            "shippingMethodCode": validateResponse(orderData?.invalid, "str"),// "STD",
            "orderItemPrice": {
              "cashOnDeliveryCharges": validateResponse(orderData?.totalCashOnDeliveryCharges, "str"),// 0,
              "sellingPrice":  validateResponse(orderData?.invalid, "str"),//0,
              "shippingCharges":  validateResponse(orderData?.totalShippingCharges, "str"),//0,
              "discount":  validateResponse(orderData?.totalDiscount, "str"),//0,
              "totalPrice":  validateResponse(orderData?.invalid, "str"),//0,
              "transferPrice":  validateResponse(orderData?.invalid, "str"),//0,
              "currency":  validateResponse(orderData?.invalid, "str"),//"string"
            },
            "quantity":  validateResponse(orderData?.invalid, "str"),//0,
            "giftWrap": {
              "giftWrapMessage":  validateResponse(orderData?.invalid, "str"),////"string",
              "giftWrapCharges":  validateResponse(orderData?.invalid, "str"),//0
            },
            "onHold": validateResponse(orderData?.invalid, "str"),// false,
            "packetNumber": validateResponse(orderData?.invalid, "str"),// 0,
            "facilityCode" :  validateResponse(orderData?.invalid, "str"),////"string"
          }
        ],
        "taxExempted":  validateResponse(orderData?.taxExempted, "str"),//false,
        "cFormProvided": validateResponse(orderData?.cFormProvided, "str"),// false,
        "thirdPartyShipping": validateResponse(orderData?.thirdPartyShipping, "str"),// false,
        "shippingAddress": {
          "addressLine1":  validateResponse(orderData?.invalid, "str"),////"string",
          "addressLine2":  validateResponse(orderData?.invalid, "str"),////"string",
          "city": validateResponse(orderData?.shippingAddress?.city, "str"),// //"string",
          "country": validateResponse(orderData?.shippingAddress?.country, "str"),// //"string",
          "email":  validateResponse(orderData?.shippingAddress?.country, "str"),////"string",
          "name":  validateResponse(orderData?.shippingAddress?.country, "str"),////"string",
          "phone":  validateResponse(orderData?.shippingAddress?.country, "str"),////"string",
          "pincode":  validateResponse(orderData?.shippingAddress?.pinCode, "str"),//"string",
          "state":  validateResponse(orderData?.shippingAddress?.state, "str"),//"string"
        },
        "billingAddress": {
          "addressLine1": validateResponse(orderData?.BillingAddress?.invalid, "str"), //"string",
          "addressLine2":  validateResponse(orderData?.BillingAddress?.invalid, "str"),//"string",
          "city":  validateResponse(orderData?.BillingAddress?.city, "str"),//"string",
          "country":  validateResponse(orderData?.BillingAddress?.country, "str"),//"string",
          "email":  validateResponse(orderData?.BillingAddress?.invalid, "str"),//"string",
          "name":  validateResponse(orderData?.BillingAddress?.invalid, "str"),//"string",
          "phone":  validateResponse(orderData?.BillingAddress?.invalid, "str"),//"string",
          "pincode":  validateResponse(orderData?.BillingAddress?.pinCode, "str"),//"string",
          "state": validateResponse(orderData?.BillingAddress?.state, "str"), //"string"
        },
        "gstin" :  validateResponse(orderData?.invalid, "str"),//"string",
        "additionalInfo":  validateResponse(orderData?.invalid, "str"),//"string"
      }
    ]
  }
  return response;
};

const orderStatusResponse = (orderData) => {
  console.log(
      `🔥 ~ file: generateResponse.js:94 ~ orderStatusResponse ~ orderData`,
      orderData
  );
  const response = {
      orders: [
          {
              id: validateResponse(orderData?.id, "str"), //"string",
              orderDate: validateResponse(orderData?.orderDate, "str"),
              orderStatus: validateResponse(orderData?.status, "str"), //+"CREATED",
              sla: validateResponse(orderData?.status, "str"), //  "2017-01-02T08:12:53",
              priority: validateResponse(orderData?.invalid, "str"), // 0,
              paymentType: validateResponse(orderData?.invalid, "str"), // "string",
              orderPrice: {
                  currency: validateResponse(orderData?.invalid, "str"), //  "string",
                  totalCashOnDeliveryCharges: validateResponse(
                      orderData?.totalCashOnDeliveryCharges,
                      "str"
                  ), //  0,
                  totalDiscount: validateResponse(
                      orderData?.totalDiscount,
                      "str"
                  ), // 0,
                  totalGiftCharges: validateResponse(
                      orderData?.totalGiftCharges,
                      "str"
                  ), //  0,
                  totalPrepaidAmount: validateResponse(
                      orderData?.totalPrepaidAmount,
                      "str"
                  ), //  0,
                  totalShippingCharges: validateResponse(
                      orderData?.totalShippingCharges,
                      "str"
                  ), //  0
              },
              orderItems: [
                  {
                      orderItemId: validateResponse(orderData?.id, "str"), //  "string",
                      status: validateResponse(orderData?.status, "str"), // "CANCELLED",
                      productId: validateResponse(orderData?.invalid, "str"), //  "string",
                      variantId: validateResponse(orderData?.invalid, "str"), //  "string",
                      sku: validateResponse(orderData?.invalid, "str"), //  "string",
                      returnReason: validateResponse(
                          orderData?.invalid,
                          "str"
                      ), //  "string",
                      returnDate: validateResponse(orderData?.invalid, "str"), //  "string",
                      returnAWB: validateResponse(orderData?.invalid, "str"), //  "string",
                      returnShippingProvider: validateResponse(
                          orderData?.invalid,
                          "str"
                      ), // "string",
                      title: validateResponse(orderData?.invalid, "str"), //  "string",
                      shippingMethodCode: validateResponse(
                          orderData?.invalid,
                          "str"
                      ), //  "STD",
                      orderItemPrice: {
                          cashOnDeliveryCharges: validateResponse(
                              orderData?.invalid,
                              "str"
                          ), //  0,
                          sellingPrice: validateResponse(
                              orderData?.invalid,
                              "str"
                          ), // 0,
                          shippingCharges: validateResponse(
                              orderData?.invalid,
                              "str"
                          ), //  0,
                          discount: validateResponse(
                              orderData?.invalid,
                              "str"
                          ), //  0,
                          totalPrice: validateResponse(
                              orderData?.invalid,
                              "str"
                          ), // 0,
                          transferPrice: validateResponse(
                              orderData?.invalid,
                              "str"
                          ), //  0,
                          currency: validateResponse(
                              orderData?.invalid,
                              "str"
                          ), //  "string"
                      },
                      quantity: validateResponse(orderData?.invalid, "str"), //  0,
                      giftWrap: {
                          giftWrapMessage: validateResponse(
                              orderData?.invalid,
                              "str"
                          ), // "string",
                          giftWrapCharges: validateResponse(
                              orderData?.invalid,
                              "str"
                          ), //  0
                      },
                      onHold: validateResponse(orderData?.invalid, "str"), //  false,
                      packetNumber: validateResponse(
                          orderData?.invalid,
                          "str"
                      ), //  0
                  },
              ],
              taxExempted: validateResponse(orderData?.taxExempted, "str"), //  false,
              cFormProvided: validateResponse(
                  orderData?.cFormProvided,
                  "str"
              ), //  false,
              thirdPartyShipping: validateResponse(
                  orderData?.thirdPartyShipping,
                  "str"
              ), // false,
              shippingAddress: {
                  addressLine1: validateResponse(orderData?.invalid, "str"), //  "string",
                  addressLine2: validateResponse(orderData?.invalid, "str"), // "string",
                  city: validateResponse(
                      orderData?.shippingAddress.city,
                      "str"
                  ), // "string",
                  country: validateResponse(
                      orderData?.shippingAddress.country,
                      "str"
                  ), // "string",
                  email: validateResponse(orderData?.invalid, "str"), //  "string",
                  name: validateResponse(orderData?.invalid, "str"), // "string",
                  phone: validateResponse(orderData?.invalid, "str"), //  "string",
                  pincode: validateResponse(
                      orderData?.shippingAddress?.pinCode,
                      "str"
                  ), // "string",
                  state: validateResponse(
                      orderData?.shippingAddress?.state,
                      "str"
                  ), //  "string"
              },
              billingAddress: {
                  addressLine1: validateResponse(orderData?.invalid, "str"), // "string",
                  addressLine2: validateResponse(orderData?.invalid, "str"), //  "string",
                  city: validateResponse(
                      orderData?.BillingAddress?.city,
                      "str"
                  ), //  "string",
                  country: validateResponse(
                      orderData?.BillingAddress?.country,
                      "str"
                  ), //  "string",
                  email: validateResponse(orderData?.invalid, "str"), // "string",
                  name: validateResponse(orderData?.invalid, "str"), // "string",
                  phone: validateResponse(orderData?.invalid, "str"), // "string",
                  pincode: validateResponse(orderData?.invalid, "str"), // "string",
                  state: validateResponse(
                      orderData?.BillingAddress?.country,
                      "str"
                  ), // "string"
              },
              additionalInfo: validateResponse(orderData?.invalid, "str"), //  "string"
          },
      ],
  };
  return response;
};

module.exports = {
  getOrdersResponse,
  orderStatusResponse,
};

// orderData {
//   id: '334abe4f-a27d-4cb6-abb6-14302d74034e',
//   code: null,
//   userId: '74b38194-0b0b-403d-acf4-b0c30973e567',
//   user: {
//     id: '74b38194-0b0b-403d-acf4-b0c30973e567',
//     owner: '74b38194-0b0b-403d-acf4-b0c30973e567',
//     firstName: 'Brijesh Agarwal',
//     lastName: 'Brijesh Agarwal',
//     email: 'brijesh.agarwal26@gmail.com',
//     phone: null,
//     gender: null,
//     dob: null,
//     country: null,
//     state: null,
//     city: null,
//     pinCode: null,
//     landmark: null,
//     address: null,
//     location: null,
//     area: null,
//     isActive: true,
//     authProvider: null,
//     totalOrders: null,
//     totalSpent: null,
//     walletBalance: null,
//     walletSpent: null,
//     totalStoreCredit: null,
//     isAdmin: false,
//     profilePhotoUrl: null,
//     wishlists: { nextToken: null },
//     shopingcarts: { nextToken: null },
//     reviews: { nextToken: null },
//     orders: { nextToken: null },
//     payments: { nextToken: null },
//     createdAt: '2023-02-06T07:35:26.368Z',
//     updatedAt: '2023-02-06T07:35:26.368Z'
//   },
//   channelName: null,
//   shippingAddress: {
//     country: 'in',
//     state: 'GJ',
//     city: 'Surat',
//     pinCode: '395007',
//     landmark: '',
//     address: 'A/3A, the Palm Avenue, VIP Road, Near LP Savani School, Vesu.',
//     location: '',
//     area: ''
//   },
//   BillingAddress: {
//     country: 'us',
//     state: 'GJ',
//     city: 'Surat',
//     pinCode: '395007',
//     landmark: '',
//     address: 'A/3A, the Palm Avenue, VIP Road, Near LP Savani School, Vesu.',
//     location: '',
//     area: ''
//   },
//   totalStoreCredit: null,
//   CouponCodeId: null,
//   totalCashOnDeliveryCharges: null,
//   totalDiscount: null,
//   totalGiftCharges: null,
//   totalPrepaidAmount: null,
//   totalShippingCharges: null,
//   taxExempted: null,
//   cFormProvided: null,
//   thirdPartyShipping: null,
//   sla: null,
//   priority: null,
//   orderDate: null,
//   status: 'PROCESSING',
//   products: { items: [], nextToken: null },
//   payments: { items: [], nextToken: null },
//   createdAt: '2023-02-06T10:11:52.435Z',
//   updatedAt: '2023-02-06T10:11:52.435Z'
// }
