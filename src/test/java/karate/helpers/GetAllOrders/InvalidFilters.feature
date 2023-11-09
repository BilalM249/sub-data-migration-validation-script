@Sanity
Feature: Get all Orders with invalid filters

  Scenario: Get all orders with invalid filters

    * def getAllOrders   = call read('classpath:karate/core/getAllOrders.feature@multipleInvalidParams')