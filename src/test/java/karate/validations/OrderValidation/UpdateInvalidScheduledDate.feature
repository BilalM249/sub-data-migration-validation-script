@Sanity
Feature: Update the scheduledDate for the Order

  Scenario: Update the scheduledDate for the Order

    * def getOrder = call read('classpath:karate/core/getAllOrders.feature@filter-by-status'){status: 'SCHEDULED'}

    * def orderId = getOrder.response.data.orders[0].id

    * def InvalidFormat = call read('classpath:karate/core/updateOrder.feature@UpdateInvalidscheduledDate'){id : '#(orderId)', scheduledDate: '2022-08-:01.199Z' }

    * def InvalidDate = call read('classpath:karate/core/updateOrder.feature@UpdateInvalidDatescheduledDate'){id : '#(orderId)', scheduledDate: '2022-08-07T10:00:01.199Z' }