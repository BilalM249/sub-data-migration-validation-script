@Sanity
Feature: Get all subscriptions with INACTIVE filters

  Scenario: Get all subscriptions with INACTIVE status filter

    * def getAllSubs = call read('classpath:karate/core/getAllSubscriptions.feature@withINACTIVEStatusQuery')



