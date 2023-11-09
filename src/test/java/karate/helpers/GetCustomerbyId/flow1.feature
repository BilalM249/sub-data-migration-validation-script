@Sanity
  Feature: Get customer by valid customer Id

    Scenario: Get customer by valid customerId

      * def createCustomer = call read('classpath:karate/core/createCustomer.feature@validPayload')

      * def id = createCustomer.response.data.id

      * def getCustomer = call read('classpath:karate/core/getCustomerById.feature@validCustomerId'){id: '#(id)'}