@Sanity
Feature: update order item quantity details

  Scenario: update order item quantity details

    * def getOrder = call read('classpath:karate/core/getAllOrders.feature@filter-by-status'){status: 'SCHEDULED'}

    * def orderId = getOrder.response.data.orders[0].id

    * def updateOrder = call read('classpath:karate/core/UpdateOrder.feature@UpdateItemQuantityDetails'){id : '#(orderId)'}

