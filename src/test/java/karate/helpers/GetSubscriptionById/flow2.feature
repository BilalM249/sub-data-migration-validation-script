@Sanity
Feature: Get Subs by invalid sub Id

  Background:

    * url baseUrl

  Scenario: Get Subs by invalid sub Id

    * def getSub  = call read('classpath:karate/core/getSubscriptionById.feature@invalidSubId'){id : 'abaabaababaaa'}
