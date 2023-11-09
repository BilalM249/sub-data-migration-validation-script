@Sanity
  Feature: Skip Order With Upsell Item

  Scenario: Skip Order With Upsell Item

    # create customer
    * def customer  = call read('classpath:karate/core/createCustomer.feature@validPayload')

    # fetch customer data
    * def CID = customer.response.data.customerReferenceId
    * def firstName = customer.response.data.firstName
    * def lastName = customer.response.data.lastName
    * def email = customer.response.data.email


    # create subs
    * def createsubs  = call read('classpath:karate/core/CreateSubscriptionByCustomerDetails.feature@single-sku-success'){sku : '#(sku1)', CID : '#(CID)', email : '#(email)', firstName : '#(firstName)', lastName : '#(lastName)'}

    * def subId = createsubs.response.data.subscriptions[0].id

    * def getSub  = call read('classpath:karate/core/getSubscriptionById.feature@validSubId'){id : '#(subId)'}

    * def frequency = getSub.response.data.subscription.plan.frequency
    * def frequencyType = getSub.response.data.subscription.plan.frequencyType

    * def custId = createsubs.response.data.subscriptions[0].customer.id

    * java.lang.Thread.sleep(10000)

    * def getOrder = call read('classpath:karate/core/getOrderByCustomerId.feature@validCustomerId'){id: '#(custId)'}

    * def orderId = getOrder.response.data.orders[0].id

    * def addToValidOrder = call read('classpath:karate/core/AddToOrder.feature@validOrder'){id: '#(orderId)', sku: '#(sku1)'}

    * def SkipOrder = call read('classpath:karate/core/SkipOrder.feature@validOrder'){id: '#(orderId)'}

    * def newOrder = SkipOrder.response.data.nextScheduledOrders.newOrders[0]

    * def getOrderByItsId = call read('classpath:karate/core/SkipOrder.feature@withUpsell'){id: '#(newOrder)', frequency: '#(frequency)',  frequencyType: '#(frequencyType)'}

