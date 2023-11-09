@Sanity
Feature: Get all subscriptions with frequency filter

  Scenario: Get all subscriptions with frequency filter

    * def getAllSubs = call read('classpath:karate/core/getAllSubscriptions.feature@withFrequency')

