@Sanity
  Feature: Get all subscriptions without any filters

    Scenario: Get all subscriptions without any filters

      * def getAllSubs = call read('classpath:karate/core/getAllSubscriptions.feature@NoQuery')



