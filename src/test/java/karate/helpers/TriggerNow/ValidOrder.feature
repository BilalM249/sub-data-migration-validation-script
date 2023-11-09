@Sanity
  Feature: Trigger Valid Order

  Scenario: Trigger Valid Order

    * def createsubs  = call read('classpath:karate/core/CreateSubscriptionWithRandomCustomer.feature')

    * def custId = createsubs.response.data.subscriptions[0].customer.id

    * java.lang.Thread.sleep(10000)

    * def getOrder = call read('classpath:karate/core/getOrderByCustomerId.feature@validCustomerId'){id: '#(custId)'}

    * def orderId = getOrder.response.data.orders[0].id

    * def TriggerOrder = call read('classpath:karate/core/TriggerNow.feature@validOrder'){id: '#(orderId)'}
