@Sanity
Feature: Deactivate Discount

  Background:

    * url baseUrl

  @valid-discount
  Scenario: Deactivate Discount
    Given path '/v1/subscriptionDiscounts/deactivate/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request {}
    When method patch
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And match response.data.id != null
    And match response.data.status != null
    And match response.data.offerCode != null
    And match response.data.validity != null
    And match response.data.validity.applyOnOrders != null
    And match response.data.message != null
    And match response.data.frequency != null
    And match response.data.itemQuantity != null
    And match response.data.channel != null
    And match response.data.createdAt != null
    And match response.data.updatedAt != null

  @already-deactivated-discount
  Scenario: Deactivate Discount
    Given path '/v1/subscriptionDiscounts/deactivate/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request {}
    When method patch
    Then status 400
    And print response
    And assert response.responseStatus == "BAD_REQUEST"
    And assert response.message == "Subscription discount is already inactive"
