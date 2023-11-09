@Sanity
Feature: update order item with Invalid quantity details

  Scenario: update order item with Invalid quantity details

    * def getOrder = call read('classpath:karate/core/getAllOrders.feature@filter-by-status'){status: 'SCHEDULED'}

    * def orderId = getOrder.response.data.orders[0].id

    * def qtyLessThan0 = call read('classpath:karate/core/UpdateOrder.feature@UpdateInvalidQuantityDetails_LessThan0'){id : '#(orderId)', quantity : '-10' }

    * def qtyDecimal = call read('classpath:karate/core/UpdateOrder.feature@UpdateInvalidQuantityDetails_Decimal'){id : '#(orderId)', quantity : '10.5' }

