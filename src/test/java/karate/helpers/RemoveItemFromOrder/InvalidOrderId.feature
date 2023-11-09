@Sanity
Feature: Remove item by passing invalid Id, Status

  Scenario: Remove item by passing invalid Id

    * def RemoveFromOrder1 = call read('classpath:karate/core/RemoveFromOrder.feature@invalidOrderId'){id: 'aaaaaaaaaa'}
