@Sanity
Feature: update order item with Invalid quantity details

  Scenario: update order item with Invalid quantity details

    * def createsubs  = call read('classpath:karate/core/createSubscriptionWithSKU.feature@success'){sku : '#(sku1)'}

    * def custId = createsubs.response.data.subscriptions[0].customer.id

    * java.lang.Thread.sleep(10000)

    * def getOrder = call read('classpath:karate/core/getOrderByCustomerId.feature@validCustomerId'){id: '#(custId)'}

    * def orderId = getOrder.response.data.orders[0].id

    * def qtyLessThan0 = call read('classpath:karate/core/UpdateOrder.feature@UpdateInvalidQuantityDetails_LessThan0'){id : '#(orderId)', quantity : '-10' }

    * def qtyDecimal = call read('classpath:karate/core/UpdateOrder.feature@UpdateInvalidQuantityDetails_Decimal'){id : '#(orderId)', quantity : '10.5' }

