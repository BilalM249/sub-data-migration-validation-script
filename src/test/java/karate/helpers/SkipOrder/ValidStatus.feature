@Sanity
  Feature: Skip Order with valid Status

  Scenario: Skip Order with valid Status

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

    * def getOrder = call read('classpath:karate/core/getOrderByCustomerId.feature@validCustomerId'){id: '#(custId)'}

    * def orderId = getOrder.response.data.orders[0].id

    * def SkipOrder = call read('classpath:karate/core/skipOrder.feature@validOrder'){id: '#(orderId)'}
