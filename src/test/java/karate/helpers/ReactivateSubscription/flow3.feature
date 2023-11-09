@Sanity
Feature: Should update status of an inactive subscription to active. Also check order for SCHEDULED state


  Scenario: Should update status of an inactive subscription to active. Also check order for SCHEDULED state

    #create a sub
    * def createsubs  = call read('classpath:karate/core/createSubscriptionWithSKU.feature@success'){sku : '#(sku1)'}


    * def subId = createsubs.response.data.subscriptions[0].id
    * def custId = createsubs.response.data.subscriptions[0].customer.id

    #deactivate sub
    * def deactivateSubscription = call read('classpath:karate/core/inActivateSubscription.feature@success'){id: '#(subId)', reason : '#(reason1)', code: '#(code1)'}

    #get sub - check inactive
    * def getSub  = call read('classpath:karate/core/ReactivateSubscription.feature@validSubId_inActiveSub'){id : '#(subId)'}

    #reactivate sub
    * def reactivateSub  = call read('classpath:karate/core/ReactivateSubscription.feature@validSubId'){id : '#(subId)'}

    #get order - order should be in scheduled state
    * def getOrder  = call read('classpath:karate/core/getOrderByCustomerId.feature@validCustomerIdInScheduledState'){id : '#(custId)'}