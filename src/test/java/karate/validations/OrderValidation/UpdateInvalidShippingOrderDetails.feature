@Sanity
Feature: update subscriptions Invalid shipping Details

  Scenario: update subscriptions Invalid shipping

    * def getOrder = call read('classpath:karate/core/getAllOrders.feature@filter-by-status'){status: 'SCHEDULED'}

    * def orderId = getOrder.response.data.orders[0].id

    * def updateOrder = call read('classpath:karate/core/updateOrder.feature@UpdateInvalidShippingDetails'){id : '#(orderId)'}