@Sanity
  Feature: Success valid Order

  Scenario: Success valid Order

    * def createsubs  = call read('classpath:karate/core/CreateSubscriptionWithRandomCustomer.feature')

    * def custId = createsubs.response.data.subscriptions[0].customer.id

    * java.lang.Thread.sleep(10000)

    * def getOrder = call read('classpath:karate/core/getOrderByCustomerId.feature@validCustomerId'){id: '#(custId)'}

    * def orderId = getOrder.response.data.orders[0].id

    * def SuccessValidOrder = call read('classpath:karate/core/Orchestration.feature@successOrderId'){id: '#(orderId)'}

    * def getOrderByItsId = call read('classpath:karate/core/getOrderByItsId.feature@successOrderId'){id: '#(orderId)'}

#    To check if new order created after success the first one
    * def getOrder = call read('classpath:karate/core/getOrderByCustomerId.feature@SuccesOrder'){id: '#(custId)'}

