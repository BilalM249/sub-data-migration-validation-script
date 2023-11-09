@Sanity
Feature: Get all Orders by scheduledDate

  Scenario: Get all Orders by scheduledDate

    # * def getAllOrders = call read('classpath:karate/core/getAllOrders.feature@byScheduledDate'){productTitle: '#(productTitleForQuery)'}
    * def getAllOrders = call read('classpath:karate/core/getAllOrders.feature@byScheduledDate')

