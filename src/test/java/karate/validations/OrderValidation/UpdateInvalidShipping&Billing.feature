@Sanity
Feature: update order Invalid shipping and billing

  Scenario: update order Invalid shipping and billing

    * def getOrder = call read('classpath:karate/core/getAllOrders.feature@filter-by-status'){status: 'SCHEDULED'}

    * def orderId = getOrder.response.data.orders[0].id

    * def updateOrder = call read('classpath:karate/core/updateOrder.feature@UpdateInvalidShipping&BillingDetails'){id : '#(orderId)'}