@Sanity
Feature: update subscriptions shipping

  Scenario: update subscriptions shipping

    * def createsubs = call read('classpath:karate/core/createSubscriptionWithSKU.feature@success'){sku : '#(sku1)'}

    * def id = createsubs.response.data.subscriptions[0].id

    * def updateSub = call read('classpath:karate/core/updateSubscription.feature@UpdateShippingDetails'){id : '#(id)'}