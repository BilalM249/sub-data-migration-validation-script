@Sanity
Feature: Customer validation

  Scenario: Customer validation

    # get all customers
    * def getAllCustomers  = call read('classpath:karate/core/GetAllCustomers.feature@no-query')

    * if (getAllCustomers.response.data.customers == null) karate.abort()

    # fetch customer data
    * def customerReferenceId = getAllCustomers.response.data.customers[0].customerReferenceId
    * def firstName = getAllCustomers.response.data.customers[0].firstName
    * def lastName = getAllCustomers.response.data.customers[0].lastName
    * def email = getAllCustomers.response.data.customers[0].email
    * def id = getAllCustomers.response.data.customers[0].id

    # update customerReferenceId
    * def updateCustomerReferenceId  = call read('classpath:karate/core/UpdateCustomer.feature@UpdateCustomerReferenceId'){id: '#(id)'}

    # use id in getCustomerById API
    * def getCustomer = call read('classpath:karate/core/getCustomerById.feature@validCustomerId'){id: '#(id)'}

    # create a sub with the fetched customer
    * def createsubs  = call read('classpath:karate/core/CreateSubscriptionByCustomerDetails.feature@single-sku-success'){sku : '#(sku1)', CID : '#(customerReferenceId)', email : '#(email)', firstName : '#(firstName)', lastName : '#(lastName)'}
