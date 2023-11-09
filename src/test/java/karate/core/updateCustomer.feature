@Sanity
Feature: Update customer

  Background:
    * url baseUrl
    * def segmentRequest = { "segment": [ "employee" ] }
    * def nameRequest = {"firstName": "UPDATED TEST","middleName": "UPDATED TEST","lastName": "UPDATED TEST"}
    * def emailRequest = {"email": "UPDATED_EMAIL@gmail.com"}
    * def localeRequest = {"locale": "en_US"}
    * def customerReferenceIdRequest = {"customerReferenceId": "234nffg43423432428a3kbe4"}


  @UpdateSegment
  Scenario: Update an customer id
    Given path 'v1/customers/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request segmentRequest
    When method put
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And match response.data.merchantId != null
    And match response.data.status != null
    And match response.data.email != null
    And match response.data.contactNumber != null
    And match response.data.firstName != null
    And match response.data.lastName != null
    And match response.data.createdAt != null
    And match response.data.updatedAt != null
    And match response.data.fullName != null
    And match response.data.id != null


  @UpdateCustomerName
  Scenario: Update an customer id
    Given path 'v1/customers/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request nameRequest
    When method put
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And match response.data.merchantId != null
    And match response.data.status != null
    And match response.data.email != null
    And match response.data.contactNumber != null
    And match response.data.firstName != null
    And match response.data.lastName != null
    And match response.data.createdAt != null
    And match response.data.updatedAt != null
    And match response.data.fullName != null
    And match response.data.id != null


  @UpdateEmployeeId
  Scenario: Update an customer id
    Given path 'v1/customers/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request {"employeeId": "A1233"}
    When method put
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And match response.data.merchantId != null
    And match response.data.status != null
    And match response.data.email != null
    And match response.data.contactNumber != null
    And match response.data.firstName != null
    And match response.data.lastName != null
    And match response.data.createdAt != null
    And match response.data.updatedAt != null
    And match response.data.fullName != null
    And match response.data.id != null

  @UpdateLocale
  Scenario: Update an customer id
    Given path 'v1/customers/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request localeRequest
    When method put
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And match response.data.merchantId != null
    And match response.data.status != null
    And match response.data.email != null
    And match response.data.contactNumber != null
    And match response.data.firstName != null
    And match response.data.lastName != null
    And match response.data.createdAt != null
    And match response.data.updatedAt != null
    And match response.data.fullName != null
    And match response.data.id != null

  @UpdateCustomerReferenceId
  Scenario: Update an customer id
    Given path 'v1/customers/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request customerReferenceIdRequest
    When method put
    Then status 400
    And print response
    And assert response.responseStatus == "BAD_REQUEST"
    And assert response.message == "Cannot modify customerReferenceId"


  @UpdateContactNumber
  Scenario: Update an customer id
    Given path 'v1/customers/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request {"contactNumber": "918899223344"}
    When method put
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And match response.data.merchantId != null
    And match response.data.status != null
    And match response.data.email != null
    And match response.data.contactNumber != null
    And match response.data.firstName != null
    And match response.data.lastName != null
    And match response.data.createdAt != null
    And match response.data.updatedAt != null
    And match response.data.fullName != null
    And match response.data.id != null


  @UpdateEmail
  Scenario: Update an customer id
    Given path 'v1/customers/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request emailRequest
    When method put
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And match response.data.merchantId != null
    And match response.data.status != null
    And match response.data.email != null
    And match response.data.contactNumber != null
    And match response.data.firstName != null
    And match response.data.lastName != null
    And match response.data.createdAt != null
    And match response.data.updatedAt != null
    And match response.data.fullName != null
    And match response.data.id != null


  @invalidCustomerId
  Scenario: Update an customer id
    Given path 'v1/customers/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    # And request
    When method patch
    Then status 404
    And print response
    And assert response.responseStatus == "NOT_FOUND"
    And assert response.message == "Customer not found"
