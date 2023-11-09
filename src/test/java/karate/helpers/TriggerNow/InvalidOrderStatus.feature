@Sanity
  Feature: Trigger order with Invalid status

  Scenario: Trigger order with Invalid status

    * def getAllInValidOrders = call read('classpath:karate/core/getAllOrders.feature@withNon_EditableStatus')

    * def orderId = getAllInValidOrders.response.data.orders[0].id

    * def TriggerOrder = call read('classpath:karate/core/TriggerNow.feature@invalidOrderStatus'){id: '#(orderId)'}
