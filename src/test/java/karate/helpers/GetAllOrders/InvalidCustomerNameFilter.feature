@Sanity
Feature: Get all orders with invalid customer name

  Scenario: Get all orders with invalid customer name

    * def getAllOrders = call read('classpath:karate/core/getAllOrders.feature@filterByInvalidCustomerName'){customerName: 'fghfgh'}