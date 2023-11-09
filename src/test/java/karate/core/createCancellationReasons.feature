@Sanity
Feature: Create cancellation Reasons


  Background:

    * def random =
    """
    function getRandomNumber() {
      return Math.floor(Math.random() * 99) + 1;
    }
    """
    * def random1 = random()
    * def random2 = random()
    * url baseUrl

  Scenario: Create cancellation Reasons

  @single-success
  Scenario: Create cancellation Reason
    Given path '/v1/cancelation-reasons'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request [ { "code": #(random1), "reason": "test - this can be deleted" } ]
    When method post
    Then status 200
    And print response
    And match response.data.cancelationReasons != null
    And match response.data.cancelationReasons[*].id != null
    And match response.data.cancelationReasons[*].reason != null
    And match response.data.cancelationReasons[*].code != null
    And match response.data.cancelationReasons[*].createdAt != null
    And match response.data.cancelationReasons[*].deletedAt != null

  @multi-success
  Scenario: Create cancellation Reason
    Given path '/v1/cancelation-reasons'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request [ { "code": #(random1), "reason": "test - this can be deleted" }, { "code": #(random2), "reason": "test - this can be deleted" } ]
    When method post
    Then status 200
    And print response
    And match response.data.cancelationReasons != null
    And match response.data.cancelationReasons[*].id != null
    And match response.data.cancelationReasons[*].reason != null
    And match response.data.cancelationReasons[*].code != null
    And match response.data.cancelationReasons[*].createdAt != null
    And match response.data.cancelationReasons[*].deletedAt != null

    @missing-reason-failure
    Scenario: Create cancellation Reason
      Given path '/v1/cancelation-reasons'
      And header Content-Type = 'application/json'
      And header Authorization = auth
      And request [ { "code": #(random1) } ]
      When method post
      Then status 400
      And print response
      And assert response.responseStatus == "BAD_REQUEST"
      And match response.responseStatus == "is required"


  @multi-duplicate-fail
  Scenario: Create cancellation Reason
    Given path '/v1/cancelation-reasons'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request [ { "code": #(random1), "reason": "test - this can be deleted" }, { "code": #(random1), "reason": "test - this can be deleted" } ]
    When method post
    Then status 200
    And print response
    And assert response.data.status = "OK"
    And assert response.data.message = "Request processed successfully."
    And match response.data.cancelationReasons != null
    And match response.data.cancelationReasons[*].id != null
    And match response.data.cancelationReasons[*].reason != null
    And match response.data.cancelationReasons[*].code != null
    And match response.data.cancelationReasons[*].createdAt != null
    And match response.data.cancelationReasons[*].deletedAt != null
    And assert response.data.duplicates != null
    And assert response.data.duplicates != null

