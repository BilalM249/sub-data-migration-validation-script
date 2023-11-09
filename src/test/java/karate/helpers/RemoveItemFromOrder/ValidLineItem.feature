@Sanity
  Feature: Remove item from order with valid LineItem

  Scenario: Remove item from order with valid LineItem

    # create customer
    * def customer  = call read('classpath:karate/core/createCustomer.feature@validPayload')

    # fetch customer data
    * def CID = customer.response.data.customerReferenceId
    * def firstName = customer.response.data.firstName
    * def lastName = customer.response.data.lastName
    * def email = customer.response.data.email


    # create subs
    * def createsubs  = call read('classpath:karate/core/CreateSubscriptionByCustomerDetails.feature@single-sku-success'){sku : '#(sku1)', CID : '#(CID)', email : '#(email)', firstName : '#(firstName)', lastName : '#(lastName)'}

    * def custId = createsubs.response.data.subscriptions[0].customer.id

    * java.lang.Thread.sleep(10000)

    # get order
    * def getOrder = call read('classpath:karate/core/getOrderByCustomerId.feature@validCustomerId'){id: '#(custId)'}

    * def orderId = getOrder.response.data.orders[0].id

    # add item to order
    * def addToOrder = call read('classpath:karate/core/AddToOrder.feature@validOrder'){id: '#(orderId)', sku: '#(sku1)'}

    # remove item from order
    * def RemoveFromOrder = call read('classpath:karate/core/RemoveFromOrder.feature@validLineItem'){id: '#(orderId)'}
