@Sanity
  Feature: Add item to order with valid SKU

  Scenario: Add item to order with valid SKU

     # create sub
    * def createsubs  = call read('classpath:karate/core/createSubscriptionWithSKU.feature@success'){sku : '#(sku1)'}

      # get sub id
    * def id = createsubs.response.data.subscriptions[0].id

    # get customer Id
    * def custId = createsubs.response.data.subscriptions[0].customer.id

    * java.lang.Thread.sleep(10000)

    * def getOrder = call read('classpath:karate/core/getOrderByCustomerId.feature@validCustomerId'){id: '#(custId)'}

    * def orderId = getOrder.response.data.orders[0].id

    * def addToInvalidOrder = call read('classpath:karate/core/AddToOrder.feature@validOrder'){id: '#(orderId)', sku: '#(sku1)'}
