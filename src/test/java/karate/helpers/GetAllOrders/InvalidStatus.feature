@Sanity
Feature: Get all orders with invalid status

  Scenario: Get all orders with invalid status

    * def getAllOrders = call read('classpath:karate/core/getAllOrders.feature@InvalidSatus')

