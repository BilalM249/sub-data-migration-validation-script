@Sanity
Feature: update subscriptions item quantity details

  Scenario: update subscriptions item quantity details

    * def createsubs = call read('classpath:karate/core/createSubscriptionWithSKU.feature@success'){sku : '#(sku1)'}

    * def id = createsubs.response.data.subscriptions[0].id

    * def updateSub = call read('classpath:karate/core/updateSubscription.feature@UpdateItemQuantityDetails'){id : '#(id)'}