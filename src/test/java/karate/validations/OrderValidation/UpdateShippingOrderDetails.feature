@Sanity
Feature: update subscriptions shipping Details

  Scenario: update subscriptions shipping

    * def getOrder = call read('classpath:karate/core/getAllOrders.feature@filter-by-status'){status: 'SCHEDULED'}

    * def orderId = getOrder.response.data.orders[0].id

    * def updateOrder = call read('classpath:karate/core/updateOrder.feature@UpdateShippingDetails'){id : '#(orderId)'}