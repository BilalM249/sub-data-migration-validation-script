@Sanity
  Feature: Out of stock- Failed scenario

  Scenario: Out of stock- Failed scenario

    * def createsubs  = call read('classpath:karate/core/CreateSubscriptionWithRandomCustomer.feature')

    * def custId = createsubs.response.data.subscriptions[0].customer.id
    * def subId = createsubs.response.data.subscriptions[0].id

    * java.lang.Thread.sleep(10000)

    * def getOrder = call read('classpath:karate/core/getOrderByCustomerId.feature@validCustomerId'){id: '#(custId)'}

    * def orderId = getOrder.response.data.orders[0].id
       # 1st try
    * def TriggerOrder = call read('classpath:karate/core/TriggerNow.feature@validOrder'){id: '#(orderId)'}
    * def outOfStock = call read('classpath:karate/core/Orchestration.feature@OutOfStock'){id: '#(orderId)'}
    * def outOfStockOrder = outOfStock.response.data[0].orderId
    * def getOrderByItsId = call read('classpath:karate/core/getOrderByItsId.feature@RetryOrder'){id: '#(outOfStockOrder)'}

      # 2nd try
    * def TriggerOrder = call read('classpath:karate/core/TriggerNow.feature@validOrder'){id: '#(outOfStockOrder)'}
    * def outOfStock = call read('classpath:karate/core/Orchestration.feature@OutOfStock'){id: '#(outOfStockOrder)'}
    * def getOrderByItsId = call read('classpath:karate/core/getOrderByItsId.feature@RetryOrder'){id: '#(outOfStockOrder)'}

      # 3rd try
    * def TriggerOrder = call read('classpath:karate/core/TriggerNow.feature@validOrder'){id: '#(outOfStockOrder)'}
    * def outOfStock = call read('classpath:karate/core/Orchestration.feature@OutOfStock'){id: '#(outOfStockOrder)'}
    * def getOrderByItsId = call read('classpath:karate/core/getOrderByItsId.feature@RetryOrder'){id: '#(outOfStockOrder)'}

       # 4th try
    * def TriggerOrder = call read('classpath:karate/core/TriggerNow.feature@validOrder'){id: '#(outOfStockOrder)'}
    * def outOfStock = call read('classpath:karate/core/Orchestration.feature@OutOfStock'){id: '#(outOfStockOrder)'}
    * def getOrderByItsId = call read('classpath:karate/core/getOrderByItsId.feature@CanceledOrder'){id: '#(outOfStockOrder)'}

    # Check if new order created or not_ It shouldn't // check the customer status it should be ACTIVE
    * def getOrder = call read('classpath:karate/core/getOrderByCustomerId.feature@Orch_Failedscenarios'){id: '#(custId)'}

    # Chesk the sub status it should be INACTIVE
    * def getSub  = call read('classpath:karate/core/getSubscriptionById.feature@orch_FailedScenarios'){id : '#(subId)'}

