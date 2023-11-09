@Sanity
Feature: Get all Orders with sku filter

  Scenario: Get all orders with sku filter

    * def getAllOrders = call read('classpath:karate/core/getAllOrders.feature@filterBySku'){sku: '#(sku1)'}


