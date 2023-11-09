@Sanity
Feature: De-activate subscription that is already deactivated
  Scenario: De-activate subscription that is already deactivated

    * def createsubs  = call read('classpath:karate/core/createSubscriptionWithSKU.feature@success'){sku : '#(sku1)'}

    * def id = createsubs.response.data.subscriptions[0].id

    * def deactivateSubscription = call read('classpath:karate/core/inActivateSubscription.feature@success'){id: '#(id)', reason : '#(reason1)', code: '#(code1)'}

    * def deactivate_inActive_sub = call read('classpath:karate/core/inActivateSubscription.feature@AlreadyInactiveSub'){id: '#(id)', reason : '#(reason1)', code: '#(code1)'}