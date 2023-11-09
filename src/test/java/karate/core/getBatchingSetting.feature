@Sanity
Feature: Get Batching Setting

  Background:

    * url baseUrl

  @getBatchingSetting
  Scenario: Get Batching setting
    Given path '/v1/batchingsetting/GNC'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And print response
    And assert response.data.consolidationTime == __arg.consolidationTime
    And assert response.data.timeFrame == __arg.timeFrame

