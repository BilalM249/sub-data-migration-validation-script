@Sanity
Feature: update subscriptions payment details

  Scenario: update subscriptions payment details

    * def createsubs = call read('classpath:karate/core/createSubscriptionWithSKU.feature@success'){sku : '#(sku1)'}

    * def id = createsubs.response.data.subscriptions[0].id

    * def updateSub = call read('classpath:karate/core/updateSubscription.feature@UpdatePaymentDetails'){id : '#(id)'}