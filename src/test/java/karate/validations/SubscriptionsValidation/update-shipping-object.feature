@Sanity
Feature: update subscriptions shipping

  Scenario: update subscriptions shipping

    * def getSubs = call read('classpath:karate/core/getAllSubscriptions.feature@withACTIVEStatusQuery')

    * if (getSubs.response.data.subscriptions == null) karate.abort()

    * def id = getSubs.response.data.subscriptions[0].id

    * def updateSub = call read('classpath:karate/core/updateSubscription.feature@UpdateShippingDetails'){id : '#(id)'}