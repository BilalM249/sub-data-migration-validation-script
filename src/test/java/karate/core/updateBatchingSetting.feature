@Sanity
Feature: Update Batching Setting

  Background:

    * url baseUrl

  @updateBatchingSetting
  Scenario: Update Batching setting
    Given path '/v1/batchingsetting/GNC'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request { "consolidationTime":'#(__arg.consolidationTime)', "timeFrame": '#(__arg.timeFrame)' }
    When method patch
    Then status 200
    And print response
    And print response.data.client
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data.client == 'GNC'
    And assert response.data.consolidationTime == __arg.consolidationTime
    And assert response.data.timeFrame == __arg.timeFrame


  @UpdateBatchingInvalid1Setting
  Scenario: Update Batching setting
    Given path '/v1/batchingsetting/GNC'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request { "consolidationTime":'#(__arg.consolidationTime)', "timeFrame": '#(__arg.timeFrame)' }
    When method patch
    Then status 400
    And print response
    And print response.data.client
    And assert response.responseStatus == "BAD_REQUEST"
    And print response.message
    And assert response.message == "\"consolidationTime\" must be greater than or equal to 1"

  @UpdateBatchingInvalid2Setting
  Scenario: Update Batching setting
    Given path '/v1/batchingsetting/GNC'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request { "consolidationTime":'#(__arg.consolidationTime)', "timeFrame": '#(__arg.timeFrame)' }
    When method patch
    Then status 400
    And print response
    And print response.data.client
    And assert response.responseStatus == "BAD_REQUEST"
    And print response.message
    And assert response.message ==  "\"consolidationTime\" must be an integer"