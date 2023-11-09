@Sanity
Feature: Get all orders by SubId

  Scenario: Get all orders by SubId

    * def createsubs  = call read('classpath:karate/core/createSubscriptionWithSKU.feature@success'){sku : '#(sku1)'}

    * def SubId = createsubs.response.data.subscriptions[0].id

    * java.lang.Thread.sleep(10000)

    * def getAllOrders = call read('classpath:karate/core/getAllOrders.feature@bySubId'){SubscriptionId: '#(SubId)'}

  #   Check searching by part of the sub ID
    * def SubId = createsubs.response.data.subscriptions[0].id.substring(0, 4)
    * print SubId
    * def getAllOrders = call read('classpath:karate/core/getAllOrders.feature@bySubId'){SubscriptionId: '#(SubId)'}
