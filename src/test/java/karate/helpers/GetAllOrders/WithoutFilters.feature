@Sanity
  Feature: Get all Orders without any filters

    Scenario: Get all Orders without any filters

      * def getAllOrders = call read('classpath:karate/core/getAllOrders.feature@NoQuery')



