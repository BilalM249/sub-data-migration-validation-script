@Sanity
Feature: Get order by valid customerId and filter by status

  Scenario: Get order by valid customer Id and filter by status


    * def createsubs  = call read('classpath:karate/core/createSubscriptionWithSKU.feature@success'){sku : '#(sku1)'}

    * def custId = createsubs.response.data.subscriptions[0].customer.id

    * def getOrder = call read('classpath:karate/core/getOrderByCustomerId.feature@limitquery'){id: '#(custId)', status:'SCHEDULED', limit: '5' }