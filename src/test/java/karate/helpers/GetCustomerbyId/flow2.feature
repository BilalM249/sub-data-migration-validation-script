@Sanity
  Feature: Get customer by invalid customer Id

    Scenario: Get customer by invalid customer Id
  * def getCustomer = call read('classpath:karate/core/getCustomerById.feature@invalidCustomerId'){id: 'aaaaaaaaaa'}