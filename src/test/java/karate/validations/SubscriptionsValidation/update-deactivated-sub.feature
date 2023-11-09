@Sanity
Feature: Update deactivated sub

  Scenario: Update deactivated sub

    * def getSubs = call read('classpath:karate/core/getAllSubscriptions.feature@withINACTIVEStatusQuery')

    * if (getSubs.response.data.subscriptions == null) karate.abort()

    * def id = getSubs.response.data.subscriptions[0].id