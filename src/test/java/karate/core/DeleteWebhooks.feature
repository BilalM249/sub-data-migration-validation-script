@Sanity
Feature: Delete Webhooks

  Background:

    * url baseUrl
    * def event = __arg.event

  @success
  Scenario: Delete Webhooks
    Given path '/v1/webhooks/' + event
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method delete
    Then status 200
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data != null
    And assert response.data.merchantId != null
    And assert response.data.isDeleted != null
    And assert response.data._id != null
    And assert response.data.event != null
    And assert response.data.url != null

  @invalid-webhook-event-failure
  Scenario: Delete Webhooks
    Given path '/v1/webhooks/' + event
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method delete
    Then status 400
    And assert response.responseStatus == "BAD_REQUEST"
    And match response.message contains "must be one of [SUBSCRIPTION_STARTED, COMBINED_SUBSCRIPTION_STARTED, SUBSCRIPTION_CANCELLED, SUBSCRIPTION_REACTIVATED, ITEM_DISCONTINUED, ITEM_REPLACED, SUBSCRIPTION_UPDATED, MAX_RETRY_REACHED_SUBSCRIPTION_INACTIVATED, CUSTOMER_NOT_FOUND, OUT_OF_STOCK, PAYMENT_RETRY, GENERIC_FAILURE, ORDER_FAILED, ORDER_TRIGGER_NOW, GET_ORDER]"

  @not-found-failure
  Scenario: Delete Webhooks
    Given path '/v1/webhooks/' + event
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 400
    And assert response.responseStatus == "BAD_REQUEST"
    And assert response.message.error == "webhook not found"
    And assert response.message.statusCode == 404
