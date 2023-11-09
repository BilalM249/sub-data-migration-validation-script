@Sanity
Feature: Get all subscriptions with product title filter filter

  Scenario: Get all subscriptions with ACTIVE status filter

    * def getAllSubs = call read('classpath:karate/core/getAllSubscriptions.feature@withProductTitle'){productTitle: '#(productTitleForQuery)'}

