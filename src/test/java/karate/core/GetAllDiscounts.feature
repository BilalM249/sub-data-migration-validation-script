@Sanity
Feature: Get All Discounts

  Background:

    * url baseUrl

  @no-query
  Scenario: Get All Discounts
    Given path '/v1/subscriptionDiscounts'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And match response.data.discounts[*].id != null
    And match response.data.discounts[*].status != null
    And match response.data.discounts[*].offerCode != null
    And match response.data.discounts[*].validity != null
    And match response.data.discounts[*].validity.applyOnOrders != null
    And match response.data.discounts[*].message != null
    And match response.data.discounts[*].frequency != null
    And match response.data.discounts[*].itemQuantity != null
    And match response.data.discounts[*].channel != null
    And match response.data.discounts[*].createdAt != null
    And match response.data.discounts[*].updatedAt != null


  @active-discounts
  Scenario: Get All Discounts with active status
    Given path '/v1/subscriptionDiscounts'
    And param status = 'ACTIVE'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And match response.data.discounts[*].id != null
    And match response.data.discounts[*].status contains "ACTIVE"
    And match response.data.discounts[*].offerCode != null
    And match response.data.discounts[*].validity != null
    And match response.data.discounts[*].validity.applyOnOrders != null
    And match response.data.discounts[*].message != null
    And match response.data.discounts[*].frequency != null
    And match response.data.discounts[*].itemQuantity != null
    And match response.data.discounts[*].channel != null
    And match response.data.discounts[*].createdAt != null
    And match response.data.discounts[*].updatedAt != null



