@Sanity
  Feature: Customer Not Found- Failed scenario

  Scenario: Customer Not Found- Failed scenario

    * def createsubs  = call read('classpath:karate/core/CreateSubscriptionWithRandomCustomer.feature')

    * def custId = createsubs.response.data.subscriptions[0].customer.id
    * def subId = createsubs.response.data.subscriptions[0].id

    * java.lang.Thread.sleep(10000)

    * def getOrder = call read('classpath:karate/core/getOrderByCustomerId.feature@validCustomerId'){id: '#(custId)'}

    * def orderId = getOrder.response.data.orders[0].id

       # 1st try
    * def TriggerOrder = call read('classpath:karate/core/TriggerNow.feature@validOrder'){id: '#(orderId)'}
    * def customerNotFound = call read('classpath:karate/core/Orchestration.feature@customerNotFound'){id: '#(orderId)'}
    * def customerNotFoundOrder = customerNotFound.response.data[0].orderId
    * def getOrderByItsId = call read('classpath:karate/core/getOrderByItsId.feature@RetryOrder'){id: '#(customerNotFoundOrder)'}

      # 2nd try
    * def TriggerOrder = call read('classpath:karate/core/TriggerNow.feature@validOrder'){id: '#(customerNotFoundOrder)'}
    * def customerNotFound = call read('classpath:karate/core/Orchestration.feature@customerNotFound'){id: '#(customerNotFoundOrder)'}
    * def getOrderByItsId = call read('classpath:karate/core/getOrderByItsId.feature@RetryOrder'){id: '#(customerNotFoundOrder)'}

      # 3rd try
    * def TriggerOrder = call read('classpath:karate/core/TriggerNow.feature@validOrder'){id: '#(customerNotFoundOrder)'}
    * def customerNotFound = call read('classpath:karate/core/Orchestration.feature@customerNotFound'){id: '#(customerNotFoundOrder)'}
    * def getOrderByItsId = call read('classpath:karate/core/getOrderByItsId.feature@RetryOrder'){id: '#(customerNotFoundOrder)'}

       # 4th try
    * def TriggerOrder = call read('classpath:karate/core/TriggerNow.feature@validOrder'){id: '#(customerNotFoundOrder)'}
    * def customerNotFound = call read('classpath:karate/core/Orchestration.feature@customerNotFound'){id: '#(customerNotFoundOrder)'}
    * def getOrderByItsId = call read('classpath:karate/core/getOrderByItsId.feature@orch_FailedOrder'){id: '#(customerNotFoundOrder)'}

    # Check if new order created or not_ It shouldn't // check the customer status it should be INACTIVE
    * def getOrder = call read('classpath:karate/core/getOrderByCustomerId.feature@orch_FailedOrder'){id: '#(custId)'}


    # Chesk the sub status it should be INACTIVE
    * def getSub  = call read('classpath:karate/core/getSubscriptionById.feature@orch_FailedScenarios'){id : '#(subId)'}



