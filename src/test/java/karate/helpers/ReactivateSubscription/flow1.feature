@Sanity
Feature: Reactivate Subscription with invalid subID

  Scenario: Get Subs by valid sub Id

    * def reactivateSub  = call read('classpath:karate/core/ReactivateSubscription.feature@invalidSubId'){id : '62d51c04d312940011ca1111'}
