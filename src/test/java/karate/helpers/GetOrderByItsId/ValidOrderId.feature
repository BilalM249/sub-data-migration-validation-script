@Sanity
Feature: Get order by valid Id

  Scenario: Get order by valid  Id


    * def createsubs  = call read('classpath:karate/core/createSubscriptionWithSKU.feature@success'){sku : '#(sku1)'}

    * def custId = createsubs.response.data.subscriptions[0].customer.id

    * def getOrder = call read('classpath:karate/core/getOrderByCustomerId.feature@validCustomerId'){id: '#(custId)'}

    * def orderId = getOrder.response.data.orders[0].id

    * def getOrderByItsId = call read('classpath:karate/core/getOrderByItsId.feature@validOrderId'){id: '#(orderId)'}
