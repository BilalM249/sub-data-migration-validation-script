@Sanity
Feature: update Order with invalid order status

  Scenario:

    * def getAllInValidOrders = call read('classpath:karate/core/getAllOrders.feature@withNon_EditableStatus')

    * def orderId = getAllInValidOrders.response.data.orders[0].id

    * def updateOrder = call read('classpath:karate/core/updateOrder.feature@invalidOrderStatus'){id : '#(orderId)'}