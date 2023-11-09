@Sanity
Feature: Add item by passing invalid Id

  Scenario: Add item by passing invalid Id
    * def addToOrder = call read('classpath:karate/core/AddToOrder.feature@invalidOrderId'){id: 'aaaaaaaaaa'}