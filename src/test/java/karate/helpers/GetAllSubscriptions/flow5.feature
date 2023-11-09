@Sanity
Feature: Get all subscriptions with frequency type filter

  Scenario: Get all subscriptions with frequency type filter

    * def getAllSubs = call read('classpath:karate/core/getAllSubscriptions.feature@withFrequencyType')

