@Sanity
Feature: update subscriptions customer object

  Scenario: update subscriptions customer object

    * def getSubs = call read('classpath:karate/core/getAllSubscriptions.feature@withACTIVEStatusQuery')

    * if (getSubs.response.data.subscriptions == null) karate.abort()

    * def id = getSubs.response.data.subscriptions[0].id

    * def updateSub = call read('classpath:karate/core/updateSubscription.feature@UpdateCustomerDetails'){id : '#(id)'}