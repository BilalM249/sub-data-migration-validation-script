@Sanity
Feature: Get all subscriptions with multiple query params

  Scenario: Get all subscriptions with multiple query params

    * def getAllSubs = call read('classpath:karate/core/getAllSubscriptions.feature@multipleParams'){sku: '#(sku1)'}