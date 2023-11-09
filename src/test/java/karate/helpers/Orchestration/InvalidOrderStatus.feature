@Sanity
  Feature: Success invalid order status

  Scenario: Success invalid order status

    * def getAllInValidOrders = call read('classpath:karate/core/getAllOrders.feature@with_nonSuccessStatus')

    * def orderId = getAllInValidOrders.response.data.orders[0].id

    * def SuccessInvalidOrder = call read('classpath:karate/core/Orchestration.feature@invalidOrderStatus'){id: '#(orderId)'}
