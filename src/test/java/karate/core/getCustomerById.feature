@Sanity
Feature: Get Customer by customer Id

  Background:

    * url baseUrl

  @validCustomerId
  Scenario: Get Customer by customer Id
    Given path '/v1/customers/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data.id != null || response.data.id != ""
    And assert response.data.locale != null || response.data.locale != ""
    And assert response.data.email != null || response.data.email != ""
    And assert response.data.firstName != null || response.data.firstName != ""
    And assert response.data.middleName != null || response.data.middleName != ""
    And assert response.data.lastName != null || response.data.middleName != ""
    And assert response.data.customerReferenceId != null || response.data.customerReferenceId != ''


  @invalidCustomerId
  Scenario: Get Subscription
    Given path '/v1/customers/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 400
    And print response
    And assert response.responseStatus == "BAD_REQUEST"
    And assert response.message == "INVALID_CUSTOMER_ID"



