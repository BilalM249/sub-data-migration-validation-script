@Sanity
Feature: update order payment details

  Scenario: update order payment details

    * def getOrder = call read('classpath:karate/core/getAllOrders.feature@filter-by-status'){status: 'SCHEDULED'}

    * def orderId = getOrder.response.data.orders[0].id

    * def updateOrder = call read('classpath:karate/core/updateOrder.feature@UpdatePaymentDetails'){id : '#(orderId)'}