@Sanity
Feature: Should be able to return all webhooks

  Scenario: Should be able to return all webhooks

    * def getWHs  = call read('classpath:karate/core/ReturnAllWebhooks.feature@success')