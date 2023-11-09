@Sanity
Feature: Update the scheduledDate for the Order

  Scenario: Update the scheduledDate for the Order

    * def getOrder = call read('classpath:karate/core/getAllOrders.feature@filter-by-status'){status: 'SCHEDULED'}

    * def orderId = getOrder.response.data.orders[0].id

    * def updateOrder = call read('classpath:karate/core/updateOrder.feature@UpdatescheduledDate'){id : '#(orderId)'}