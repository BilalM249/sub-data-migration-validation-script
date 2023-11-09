@Sanity
Feature: Get order by valid customerId and limit 100

  Scenario: Get order by valid customer Id and limit 100


    * def createsubs  = call read('classpath:karate/core/createSubscriptionWithSKU.feature@success'){sku : '#(sku1)'}

    * def custId = createsubs.response.data.subscriptions[0].customer.id

    * def getOrder = call read('classpath:karate/core/getOrderByCustomerId.feature@limitquery'){limit: '100', id: '#(custId)'}