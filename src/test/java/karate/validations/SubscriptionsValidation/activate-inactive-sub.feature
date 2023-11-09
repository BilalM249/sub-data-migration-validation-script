@Sanity
Feature: Should update status of an inactive subscription to active. Also check order for SCHEDULED state

  Scenario: Should update status of an inactive subscription to active. Also check order for SCHEDULED state

    * def getSubs = call read('classpath:karate/core/getAllSubscriptions.feature@withINACTIVEStatusQuery')

    * if (getSubs.response.data.subscriptions == null) karate.abort()

    * def subId = getSubs.response.data.subscriptions[0].id
    * def custId = getSubs.response.data.subscriptions[0].customer.id

    #reactivate sub
    * def reactivateSub  = call read('classpath:karate/core/ReactivateSubscription.feature@validSubId'){id : '#(subId)'}

    #get order - order should be in scheduled state
    * def getOrder  = call read('classpath:karate/core/getOrderByCustomerId.feature@validCustomerIdInScheduledState'){id : '#(custId)'}