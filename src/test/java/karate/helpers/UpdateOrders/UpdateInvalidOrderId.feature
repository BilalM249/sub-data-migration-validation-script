@Sanity
Feature: update Order with invalid order id

  Scenario: update Order with invalid order id

    * def updateOrder = call read('classpath:karate/core/updateOrder.feature@invalidOrderId'){id : 'aaaaaaaaaaaa'}