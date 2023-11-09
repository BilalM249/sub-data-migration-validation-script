@Sanity
Feature: update subscriptions customer object

  Scenario: update subscriptions customer object

    * def createsubs = call read('classpath:karate/core/createSubscriptionWithSKU.feature@success'){sku : '#(sku1)'}

    * def id = createsubs.response.data.subscriptions[0].id

    * def updateSub = call read('classpath:karate/core/updateSubscription.feature@UpdateCustomerDetails'){id : '#(id)'}