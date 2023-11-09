@Sanity
Feature: Update Discount

  Background:
    * url baseUrl

  @UpdateMessage
  Scenario: Update an discount
    Given path 'v1/subscriptionDiscount/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request {"message":"UPDATED MESSAGE"}
    When method put
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

  @UpdateCategory
  Scenario: Update an discount
    Given path 'v1/subscriptionDiscount/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request {"categories":["testCategory"]}
    When method put
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

  @UpdateFrequency
  Scenario: Update an discount
    Given path 'v1/subscriptionDiscount/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request {"frequency": {"frequency": 11,"frequencyType": "Yearly"}}
    When method put
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



    ###############

  @UpdateItemQuantity
  Scenario: Update an discount
    Given path 'v1/subscriptionDiscount/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request {"itemQuantity": 20}
    When method put
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

  @UpdateChannel
  Scenario: Update an discount
    Given path 'v1/subscriptionDiscount/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request {"channel": "COPILOT"}
    When method put
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

  @UpdateTarget
  Scenario: Update an discount
    Given path 'v1/subscriptionDiscount/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request {"target": "PDP1"}
    When method put
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


  @UpdateTarget
  Scenario: Update an discount
    Given path 'v1/subscriptionDiscount/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request {"target": "PDP1"}
    When method put
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


  @UpdateCustomerSegment
  Scenario: Update an discount
    Given path 'v1/subscriptionDiscount/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request {"customerSegment": ["employee1","designer1"]}
    When method put
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


  @UpdateValidity
  Scenario: Update an discount
    Given path 'v1/subscriptionDiscount/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request {"validity": {"applyOnOrders": [1,3,5]}}
    When method put
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