@Sanity
Feature: Get all orders with customer Id

  Scenario: Get all orders with customer Id

    * def createsubs  = call read('classpath:karate/core/createSubscriptionWithSKU.feature@success'){sku : '#(sku1)'}

    * def customerId = createsubs.response.data.subscriptions[0].customer.id

    * def getAllOrders = call read('classpath:karate/core/getAllOrders.feature@filterByCustomerId'){customerId: '#(customerId)'}