@Sanity
Feature: Get Discount By offerCode

  Background:
    * url baseUrl

  @valid-offerCode
  Scenario: Get discount by offerCode
    Given path 'v1/subscriptionDiscounts/' + __arg.offerCode
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data.id != null
    And assert response.data.status != null
    And assert response.data.validity != null
    And assert response.data.message != null
    And assert response.data.discount != null
    And assert response.data.itemIds != null
    And assert response.data.skus != null
    And assert response.data.frequency != null
    And assert response.data.frequency.frequency != null
    And assert response.data.itemQuantity != null
    And assert response.data.channel != null
    And assert response.data.target != null
    And assert response.data.isUsed != null

  @invalid-offerCode
  Scenario: Update an discount
    Given path 'v1/subscriptionDiscounts/' + __arg.offerCode
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 404
    And print response
    And assert response.responseStatus == "NOT_FOUND"
    And assert response.message == "Subscription discount not found "