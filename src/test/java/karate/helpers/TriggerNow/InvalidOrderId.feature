@Sanity
Feature: Trigger Order by passing invalid Id

  Scenario: Trigger Order by passing invalid Id

    * def TriggerOrder = call read('classpath:karate/core/TriggerNow.feature@invalidOrderId'){id: 'aaaaaaaaaa'}