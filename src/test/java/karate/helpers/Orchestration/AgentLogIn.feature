@Sanity
  Feature: Agent Log in- Failed scenario

  Scenario: Agent Log in- Failed scenario

    * def createsubs  = call read('classpath:karate/core/CreateSubscriptionWithRandomCustomer.feature')

    * def custId = createsubs.response.data.subscriptions[0].customer.id
    * def subId = createsubs.response.data.subscriptions[0].id

    * java.lang.Thread.sleep(10000)

    * def getOrder = call read('classpath:karate/core/getOrderByCustomerId.feature@validCustomerId'){id: '#(custId)'}

    * def orderId = getOrder.response.data.orders[0].id
       # 1st try
    * def TriggerOrder = call read('classpath:karate/core/TriggerNow.feature@validOrder'){id: '#(orderId)'}
    * def AgentLogIn = call read('classpath:karate/core/Orchestration.feature@AgentLogIn'){id: '#(orderId)'}
    * def AgentLogInOrder = AgentLogIn.response.data[0].orderId
    * def getOrderByItsId = call read('classpath:karate/core/getOrderByItsId.feature@RetryOrder'){id: '#(AgentLogInOrder)'}

      # 2nd try
    * def TriggerOrder = call read('classpath:karate/core/TriggerNow.feature@validOrder'){id: '#(AgentLogInOrder)'}
    * def AgentLogIn = call read('classpath:karate/core/Orchestration.feature@AgentLogIn'){id: '#(AgentLogInOrder)'}
    * def getOrderByItsId = call read('classpath:karate/core/getOrderByItsId.feature@RetryOrder'){id: '#(AgentLogInOrder)'}

      # 3rd try
    * def TriggerOrder = call read('classpath:karate/core/TriggerNow.feature@validOrder'){id: '#(AgentLogInOrder)'}
    * def AgentLogIn = call read('classpath:karate/core/Orchestration.feature@AgentLogIn'){id: '#(AgentLogInOrder)'}
    * def getOrderByItsId = call read('classpath:karate/core/getOrderByItsId.feature@RetryOrder'){id: '#(AgentLogInOrder)'}

       # 4th try
    * def TriggerOrder = call read('classpath:karate/core/TriggerNow.feature@validOrder'){id: '#(AgentLogInOrder)'}
    * def AgentLogIn = call read('classpath:karate/core/Orchestration.feature@AgentLogIn'){id: '#(AgentLogInOrder)'}
    * def getOrderByItsId = call read('classpath:karate/core/getOrderByItsId.feature@CanceledOrder'){id: '#(AgentLogInOrder)'}

    # Check if new order created or not_ It shouldn't // check the customer status it should be ACTIVE
    * def getOrder = call read('classpath:karate/core/getOrderByCustomerId.feature@Orch_Failedscenarios'){id: '#(custId)'}

    # Chesk the sub status it should be INACTIVE
    * def getSub  = call read('classpath:karate/core/getSubscriptionById.feature@orch_FailedScenarios'){id : '#(subId)'}

