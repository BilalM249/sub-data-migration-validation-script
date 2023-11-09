@Sanity
Feature: Get Cancellation Reasons

  Scenario: Create cancellation Reason

    * def get_cancellation_reasons  = call read('classpath:karate/core/getCancellationReasons.feature@success')