@Sanity
  Feature: Skip order with Invalid status

  Scenario: Skip with Invalid status

    * def getAllInValidOrders = call read('classpath:karate/core/getAllOrders.feature@withNon_EditableStatus')

    * def orderId = getAllInValidOrders.response.data.orders[0].id

    * def SkipOrder = call read('classpath:karate/core/SkipOrder.feature@invalidOrderStatus'){id: '#(orderId)'}
