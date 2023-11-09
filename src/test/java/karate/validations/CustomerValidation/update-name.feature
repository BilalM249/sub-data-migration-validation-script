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

    # update name
    * def updateName = call read('classpath:karate/core/UpdateCustomer.feature@UpdateCustomerName'){id: '#(id)'}
