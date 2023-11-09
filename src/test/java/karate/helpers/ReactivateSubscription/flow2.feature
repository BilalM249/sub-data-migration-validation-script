@Sanity
Feature: Trying to re-activate an already active sub

  Scenario: Trying to re-activate an already active sub

    * def createsubs  = call read('classpath:karate/core/createSubscriptionWithSKU.feature@success'){sku : '#(sku1)'}

    * def id = createsubs.response.data.subscriptions[0].id

    * def getSub  = call read('classpath:karate/core/ReactivateSubscription.feature@AlreadyActiveSub'){id : '#(id)'}

