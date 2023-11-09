@Sanity
Feature: Get all subscriptions with limit

  Scenario: Get all subscriptions with limit

    * def getAllSubs = call read('classpath:karate/core/getAllSubscriptions.feature@withLimit')

