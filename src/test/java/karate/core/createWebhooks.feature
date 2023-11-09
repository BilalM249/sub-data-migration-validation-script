@Sanity
Feature: Create Webhook

  Background:

    * url baseUrl

  @success
  Scenario: Create Webhook
    Given path '/v1/webhooks'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request { "event": "ITEM_REPLACED", "url": "https://webhook.site/7a094444-c7d0-4d07-99d5-91ec2cd1c204" }
    When method post
    Then status 200
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data != null
    And assert response.data.merchantId != null
    And assert response.data.isDeleted != null
    And assert response.data._id != null
    And assert response.data.event != null
    And assert response.data.url != null
