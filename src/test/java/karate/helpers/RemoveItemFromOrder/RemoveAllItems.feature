@Sanity
  Feature: Remove all items from order

  Scenario: Remove all items from order

    * def createsubs  = call read('classpath:karate/core/createSubscriptionWithSKU.feature@success'){sku : '#(sku1)'}

    * def id = createsubs.response.data.subscriptions[0].id

    * def custId = createsubs.response.data.subscriptions[0].customer.id

    * java.lang.Thread.sleep(10000)

    * def getOrder = call read('classpath:karate/core/getOrderByCustomerId.feature@validCustomerId'){id: '#(custId)'}

    * def orderId = getOrder.response.data.orders[0].id

    * def RemoveFromOrder = call read('classpath:karate/core/RemoveFromOrder.feature@line-item-with-subscription'){id: '#(orderId)'}
