@Sanity
Feature: Get all subscriptions with channel

  Scenario: Get all subscriptions with channel

    * def getAllSubs = call read('classpath:karate/core/getAllSubscriptions.feature@filterByChannel')