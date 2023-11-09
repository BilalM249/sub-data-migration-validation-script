@Sanity
Feature: Get Cancellation Reasons

  Background:

    * url baseUrl

  @success
  Scenario: Get All cancellation Reasons
    Given path '/v1/cancelation-reasons'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And match response.data.cancelationReasons != null
    And match response.data.cancelationReasons[*].id != null
    And match response.data.cancelationReasons[*].reason != null
    And match response.data.cancelationReasons[*].code != null
    And match response.data.cancelationReasons[*].createdAt != null
    And match response.data.cancelationReasons[*].deletedAt != null