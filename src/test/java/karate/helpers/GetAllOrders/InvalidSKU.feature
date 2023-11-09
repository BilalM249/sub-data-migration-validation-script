@Sanity
Feature: Get all Orders with invalid sku filter

  Scenario: Get all orders with sku filter

    * def getAllOrders = call read('classpath:karate/core/getAllOrders.feature@filterByInvalidSku'){sku: 'dfgdfgfg'}


