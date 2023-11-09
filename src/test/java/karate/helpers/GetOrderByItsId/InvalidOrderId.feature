@Sanity
Feature: Get order by invalid Id

  Scenario: Get order by invalid  Id
    * def getOrder = call read('classpath:karate/core/getOrderByItsId.feature@invalidOrderId'){id: 'aaaaaaaaaa'}