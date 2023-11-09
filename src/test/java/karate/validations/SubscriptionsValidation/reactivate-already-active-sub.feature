@Sanity
Feature: Trying to re-activate an already active sub

  Scenario: Trying to re-activate an already active sub

    * def getSubs = call read('classpath:karate/core/getAllSubscriptions.feature@withACTIVEStatusQuery')

    * if (getSubs.response.data.subscriptions == null) karate.abort()

    * def id = getSubs.response.data.subscriptions[0].id

    * def reactivate_sub  = call read('classpath:karate/core/ReactivateSubscription.feature@AlreadyActiveSub'){id : '#(id)'}

