@Sanity
Feature: Get all orders with one value for the status

  Scenario: Get all orders with one value for the status

    * def upperCaseStatus = call read('classpath:karate/core/getAllOrders.feature@withOneStatus') {status : 'SCHEDULED'}

