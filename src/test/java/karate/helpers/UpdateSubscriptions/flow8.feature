@Sanity
Feature: update subscriptions - swap with unswappable sku

  Scenario: update subscriptions - swap with unswappable sku

    * def createsubs = call read('classpath:karate/core/createSubscriptionWithSKU.feature@success'){sku : '#(sku1)'}

    * def id = createsubs.response.data.subscriptions[0].id

    * def updateSub = call read('classpath:karate/core/updateSubscription.feature@SwapWithInvalidSku'){id : '#(id)', sku: '#(sku3)'}