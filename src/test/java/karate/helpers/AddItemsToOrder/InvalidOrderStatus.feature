@Sanity
  Feature: Add item to order with Invalid status

  Scenario: Add item to order with Invalid status

    * def getAllInValidOrders = call read('classpath:karate/core/getAllOrders.feature@SubmittedStatus')

    * def orderId = getAllInValidOrders.response.data.orders[0].id

    * def addToInvalidOrder = call read('classpath:karate/core/AddToOrder.feature@invalidOrderStatus'){id: '#(orderId)', sku: '#(sku1)'}
