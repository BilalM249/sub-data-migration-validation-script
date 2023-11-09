@Sanity
Feature: Get all subscriptions with customer reference Id

  Scenario: Get all subscriptions with customer reference Id

    * def getAllSubs = call read('classpath:karate/core/getAllSubscriptions.feature@filterByCustomerId'){customerId: '#(customerReferenceId1)'}