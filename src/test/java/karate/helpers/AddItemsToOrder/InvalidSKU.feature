@Sanity
  Feature: Add item to order with Invalid SKU

  Scenario: Add item to order with Invalid SKU

    * def getAllValidOrders = call read('classpath:karate/core/getAllOrders.feature@withOneStatus'){status: 'SCHEDULED'}

    * def orderId = getAllValidOrders.response.data.orders[0].id

    * def addToInvalidOrder = call read('classpath:karate/core/AddToOrder.feature@invalidSKU'){id: '#(orderId)'}
