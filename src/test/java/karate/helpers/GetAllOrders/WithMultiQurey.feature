@Sanity
Feature: Get all Orders with multiple query params

  Scenario: Get all orders with multiple query params

    * def getAllOrders   = call read('classpath:karate/core/getAllOrders.feature@multipleParams'){sku: '#(sku1)'}