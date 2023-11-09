@Sanity
Feature: Get order by valid customerId

  Scenario: Get order by valid customer Id


    * def createsubs  = call read('classpath:karate/core/createSubscriptionWithSKU.feature@success'){sku : '#(sku1)'}

    * def custId = createsubs.response.data.subscriptions[0].customer.id

    * def getOrder = call read('classpath:karate/core/getOrderByCustomerId.feature@validCustomerId'){id: '#(custId)'}