class OrderSchema {
  static deliveryOrder(String options) {
    return """query GetProductImage($options: ID!) {
  getProductImage(id: $options) {
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
  }
  """;
  }
}
