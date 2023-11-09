@Sanity
  Feature: Skip Invalid Order Id

  Scenario: Skip Invalid Order Id

    * def SkipOrder = call read('classpath:karate/core/SkipOrder.feature@invalidOrderId'){id: 'aaaaaaaaaa'}

