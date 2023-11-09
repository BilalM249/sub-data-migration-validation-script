@Sanity
Feature: Get all Orders with limit

  Scenario: Get all Orders with limit

    * def getAllOrders = call read('classpath:karate/core/getAllOrders.feature@withLimit')
