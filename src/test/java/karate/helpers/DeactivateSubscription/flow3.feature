@Sanity
Feature: De-activate subscription with invalid id
  Scenario: De-activate subscription with invalid id

    * def createsubs  = call read('classpath:karate/core/createSubscriptionWithSKU.feature@success'){sku : '#(sku1)'}

    * def id = createsubs.response.data.subscriptions[0].id

    * def deactivateSubscription = call read('classpath:karate/core/inActivateSubscription.feature@success'){id: '#(id)', reason : '#(reason1)', code: '#(code1)'}