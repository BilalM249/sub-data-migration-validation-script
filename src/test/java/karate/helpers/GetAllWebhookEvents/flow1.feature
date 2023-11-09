@Sanity
Feature: Should be able to return all webhook events

  Scenario: Get all webhook events

    * def getEvents  = call read('classpath:karate/core/ReturnAllWebhookEvents.feature@success')