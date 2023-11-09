@Sanity
Feature: Get all customers

  Background:
    * url baseUrl

  @no-query
  Scenario: Get all customers
    Given path 'v1/customers'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And match response.data.customers[*].hasActiveSubscriptions != null
    And match response.data.customers[*].merchantId != null
    And match response.data.customers[*].status != null
    And match response.data.customers[*].email != null
    And match response.data.customers[*].contactNumber != null
    And match response.data.customers[*].firstName != null
    And match response.data.customers[*].lastName != null
    And match response.data.customers[*].createdAt != null
    And match response.data.customers[*].updatedAt != null
    And match response.data.customers[*].fullName != null
    And match response.data.customers[*].id != null
