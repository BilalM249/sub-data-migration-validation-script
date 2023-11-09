@Sanity
Feature: Get all orders with more than one value for the status

  Scenario: Get all orders with more than one value for the status

    * def getAllOrders = call read('classpath:karate/core/getAllOrders.feature@withMoreThanOneStatus')

