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

    # update segment
    * def updateSegment = call read('classpath:karate/core/UpdateCustomer.feature@UpdateSegment'){id: '#(id)'}

    # update name
    * def updateName = call read('classpath:karate/core/UpdateCustomer.feature@UpdateCustomerName'){id: '#(id)'}

    # update employee id
    * def updateEmployeeId = call read('classpath:karate/core/UpdateCustomer.feature@UpdateEmployeeId'){id: '#(id)'}

    # update contact number
    * def updateContactNumber = call read('classpath:karate/core/UpdateCustomer.feature@UpdateContactNumber'){id: '#(id)'}

    # update email
    * def updateCustomerEmail  = call read('classpath:karate/core/UpdateCustomer.feature@UpdateEmail'){id: '#(id)'}

    # update locale
    * def updateCustomerEmail  = call read('classpath:karate/core/UpdateCustomer.feature@UpdateLocale'){id: '#(id)'}

    # update customerReferenceId
    * def updateCustomerReferenceId  = call read('classpath:karate/core/UpdateCustomer.feature@UpdateCustomerReferenceId'){id: '#(id)'}

    # use id in getCustomerById API
    * def getCustomer = call read('classpath:karate/core/getCustomerById.feature@validCustomerId'){id: '#(id)'}

    # create a sub with the fetched customer
    * def createsubs  = call read('classpath:karate/core/CreateSubscriptionByCustomerDetails.feature@single-sku-success'){sku : '#(sku1)', CID : '#(customerReferenceId)', email : '#(email)', firstName : '#(firstName)', lastName : '#(lastName)'}
