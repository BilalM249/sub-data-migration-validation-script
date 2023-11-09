@Sanity
Feature: Get all orders by Invalid SubId

  Scenario: Get all orders by Invalid SubId

    * def getAllOrders = call read('classpath:karate/core/getAllOrders.feature@byInvalidSubId'){SubscriptionId: '56746345345435565'}
