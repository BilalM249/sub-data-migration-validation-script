@Sanity
Feature: Update the scheduledDate for the Order

  Scenario: Update the scheduledDate for the Order

    * def createsubs  = call read('classpath:karate/core/createSubscriptionWithSKU.feature@success'){sku : '#(sku1)'}

    * def custId = createsubs.response.data.subscriptions[0].customer.id

    * java.lang.Thread.sleep(10000)

    * def getOrder = call read('classpath:karate/core/getOrderByCustomerId.feature@validCustomerId'){id: '#(custId)'}

    * def orderId = getOrder.response.data.orders[0].id

    * def InvalidFormat = call read('classpath:karate/core/updateOrder.feature@UpdateInvalidscheduledDate'){id : '#(orderId)', scheduledDate: '2022-08-:01.199Z' }

    * def InvalidDate = call read('classpath:karate/core/updateOrder.feature@UpdateInvalidDatescheduledDate'){id : '#(orderId)', scheduledDate: '2022-08-07T10:00:01.199Z' }