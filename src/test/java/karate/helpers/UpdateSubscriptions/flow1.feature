@Sanity
Feature: update subscriptions with invalid subs id

  Scenario:

    * def updateSub = call read('classpath:karate/core/updateSubscription.feature@invalidSubId'){id : 'aaaaaaaaaaaa'}