@Sanity
Feature: sub should not be updated if sub is inactive

  Scenario: sub should not be updated if sub is inactive

    * def createsubs = call read('classpath:karate/core/createSubscriptionWithSKU.feature@success'){sku : '#(sku1)'}

    * def id = createsubs.response.data.subscriptions[0].id

    * def deactivateSubscription = call read('classpath:karate/core/inActivateSubscription.feature@success'){id: '#(id)', reason : '#(reason1)', code: '#(code1)'}

    * def updateSub = call read('classpath:karate/core/updateSubscription.feature@DeactivatedSubscriptions'){id : '#(id)'}