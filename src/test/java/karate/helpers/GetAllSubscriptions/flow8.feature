@Sanity
Feature: Get all subscriptions with sku filter

  Scenario: Get all subscriptions with sku filter

    * def getAllSubs = call read('classpath:karate/core/getAllSubscriptions.feature@filterBySku'){sku: '#(sku1)'}


