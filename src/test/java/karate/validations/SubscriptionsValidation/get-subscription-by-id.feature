@Sanity
Feature: Get Subs by valid sub Id

  Scenario: Get Subs by valid sub Id

    * def getSubs = call read('classpath:karate/core/getAllSubscriptions.feature@withACTIVEStatusQuery')

    * if (getSubs.response.data.subscriptions == null) karate.abort()

    * def id = getSubs.response.data.subscriptions[0].id

    * def getSub  = call read('classpath:karate/core/getSubscriptionById.feature@validSubId'){id : '#(id)'}
