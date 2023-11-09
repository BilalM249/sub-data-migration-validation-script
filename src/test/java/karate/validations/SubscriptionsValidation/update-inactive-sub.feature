@Sanity
Feature: sub should not be updated if sub is inactive

  Scenario: sub should not be updated if sub is inactive

    * def getSubs = call read('classpath:karate/core/getAllSubscriptions.feature@withINACTIVEStatusQuery')

    * if (getSubs.response.data.subscriptions == null) karate.abort()

    * def id = getSubs.response.data.subscriptions[0].id

    * def updateSub = call read('classpath:karate/core/updateSubscription.feature@DeactivatedSubscriptions'){id : '#(id)'}