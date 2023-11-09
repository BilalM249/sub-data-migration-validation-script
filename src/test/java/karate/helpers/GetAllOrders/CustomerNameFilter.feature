@Sanity
Feature: Get all orders with customer name

  Scenario: Get all orders with customer name

    * def createsubs  = call read('classpath:karate/core/createSubscriptionWithSKU.feature@success'){sku : '#(sku1)'}

    * def customerName = createsubs.response.data.subscriptions[0].customer.firstName

    * def getAllOrders = call read('classpath:karate/core/getAllOrders.feature@filterByCustomerName'){customerName: '#(customerName)'}

    * def customerName = createsubs.response.data.subscriptions[0].customer.firstName
    * def getAllOrders = call read('classpath:karate/core/getAllOrders.feature@filterByCustomerName'){customerName: '#(customerName)'}
