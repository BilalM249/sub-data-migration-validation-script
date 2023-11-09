@Sanity
Feature: Should be able to return all webhook events

  Background:

    * url baseUrl

  @success
  Scenario: Get all webhook events
    Given path '/v1/webhooks/available-events'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data != null