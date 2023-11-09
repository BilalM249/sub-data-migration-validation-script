@Sanity
Feature: Get order by invalid customer Id

  Scenario: Get order by invalid customer Id
    * def getOrder = call read('classpath:karate/core/getOrderByCustomerId.feature@invalidCustomerId'){id: 'aaaaaaaaaa'}