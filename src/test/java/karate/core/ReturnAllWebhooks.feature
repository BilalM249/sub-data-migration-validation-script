@Sanity
Feature: GET all webhooks

  Background:

    * url baseUrl

  @success
  Scenario: Get all webhooks
    Given path '/v1/webhooks'
    And param limit = 5
    And param page = 1
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data != null
    And assert response.data.webhooks != null
    And match response.data.webhooks[*].merchantId != null
    And match response.data.webhooks[*].isDeleted != null
    And match response.data.webhooks[*]._id != null
    And match response.data.webhooks[*].event != null
    And match response.data.webhooks[*].url != null
