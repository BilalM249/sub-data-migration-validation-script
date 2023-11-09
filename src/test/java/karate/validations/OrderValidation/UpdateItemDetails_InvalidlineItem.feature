@Sanity
Feature: update order details with invalid lineItem

  Scenario: update order details with invalid lineItem

    * def getOrder = call read('classpath:karate/core/getAllOrders.feature@filter-by-status'){status: 'SCHEDULED'}

    * def orderId = getOrder.response.data.orders[0].id

    * def updateOrderDecimal = call read('classpath:karate/core/updateOrder.feature@UpdateInvalidItemDetails_Decimal'){id : '#(orderId)', lineItemId: '1.5'}

    * def updateOrderLessThan0 = call read('classpath:karate/core/updateOrder.feature@UpdateInvalidItemDetails_LessThan0'){id : '#(orderId)', lineItemId: '-5'}

    * def updateOrderNotExist = call read('classpath:karate/core/updateOrder.feature@UpdateItemDetails_InvalidNotExsit'){id : '#(orderId)', lineItemId: '15'}