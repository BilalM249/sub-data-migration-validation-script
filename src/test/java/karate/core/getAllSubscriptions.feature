@Sanity
Feature: Get All subscriptions

  Background:

    * url baseUrl

  @NoQuery
  Scenario: Get All Subscription NoQuery
    Given path '/v1/subscriptions'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And match response.data.subscriptions[*].id != null
    And match response.data.subscriptions[*].status != null
    And match response.data.subscriptions[*].channel != null
    And match response.data.subscriptions[*].customer != null
    And match response.data.subscriptions[*].customer.customerReferenceId != null
    And match response.data.subscriptions[*].plan != null
    And match response.data.subscriptions[*].item != null
    And match response.data.subscriptions[*].shipping != null
    And match response.data.subscriptions[*].shipTo != null
    And match response.data.subscriptions[*].billTo != null

  @withINACTIVEStatusQuery
  Scenario: Get All Subscription with INACTIVE Status Query
    Given path '/v1/subscriptions'
    And param status = 'INACTIVE'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And match response.data.subscriptions[*].id != null
    And match response.data.subscriptions[*].status contains 'INACTIVE'
    And match response.data.subscriptions[*].channel != null
    And match response.data.subscriptions[*].customer != null
    And match response.data.subscriptions[*].customer.customerReferenceId != null
    And match response.data.subscriptions[*].plan != null
    And match response.data.subscriptions[*].item != null
    And match response.data.subscriptions[*].shipping != null
    And match response.data.subscriptions[*].shipTo != null
    And match response.data.subscriptions[*].billTo != null


  @withACTIVEStatusQuery
  Scenario: Get All Subscription with ACTIVE Status Query
    Given path '/v1/subscriptions'
    And param status = 'ACTIVE'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And match response.data.subscriptions[*].id != null
    And match response.data.subscriptions[*].status contains 'ACTIVE'
    And match response.data.subscriptions[*].channel != null
    And match response.data.subscriptions[*].customer != null
    And match response.data.subscriptions[*].customer.customerReferenceId != null
    And match response.data.subscriptions[*].plan != null
    And match response.data.subscriptions[*].item != null
    And match response.data.subscriptions[*].shipping != null
    And match response.data.subscriptions[*].shipTo != null
    And match response.data.subscriptions[*].billTo != null


  @withProductTitle
  Scenario: Get All Subscription with Product Title
    Given path '/v1/subscriptions'
    And param title = __arg.productTitle
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And match response.data.subscriptions[*].id != null
    And match response.data.subscriptions[*].status != null
    And match response.data.subscriptions[*].channel != null
    And match response.data.subscriptions[*].customer != null
    And match response.data.subscriptions[*].customer.customerReferenceId != null
    And match response.data.subscriptions[*].plan != null
    And match response.data.subscriptions[*].item.title contains __arg.productTitle
    And match response.data.subscriptions[*].shipping != null
    And match response.data.subscriptions[*].shipTo != null
    And match response.data.subscriptions[*].billTo != null


  @withFrequencyType
  Scenario: Get All Subscription with freq type
    Given path '/v1/subscriptions'
    And param frequencyType = 'Yearly'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And match response.data.subscriptions[*].id != null
    And match response.data.subscriptions[*].status != null
    And match response.data.subscriptions[*].channel != null
    And match response.data.subscriptions[*].customer != null
    And match response.data.subscriptions[*].customer.customerReferenceId != null
    And match response.data.subscriptions[*].plan != null
    And match response.data.subscriptions[*].plan.frequencyType contains 'Yearly'
    And match response.data.subscriptions[*].item.title != null
    And match response.data.subscriptions[*].shipping != null
    And match response.data.subscriptions[*].shipTo != null
    And match response.data.subscriptions[*].billTo != null


  @withFrequency
  Scenario: Get All Subscription with freq type
    Given path '/v1/subscriptions'
    And param frequency = 10
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And match response.data.subscriptions[*].id != null
    And match response.data.subscriptions[*].status != null
    And match response.data.subscriptions[*].channel != null
    And match response.data.subscriptions[*].customer != null
    And match response.data.subscriptions[*].customer.customerReferenceId != null
    And match response.data.subscriptions[*].plan != null
    And match response.data.subscriptions[*].plan.frequency contains 10
    And match response.data.subscriptions[*].item.title != null
    And match response.data.subscriptions[*].shipping != null
    And match response.data.subscriptions[*].shipTo != null
    And match response.data.subscriptions[*].billTo != null


  @withLimit
  Scenario: Get All Subscription with limit
    Given path '/v1/subscriptions'
    And param limit = 100
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And match response.data.subscriptions[*].id != null
    And match response.data.subscriptions[*].status != null
    And match response.data.subscriptions[*].channel != null
    And match response.data.subscriptions[*].customer != null
    And match response.data.subscriptions[*].customer.customerReferenceId != null
    And match response.data.subscriptions[*].plan != null
    And match response.data.subscriptions[*].plan.frequencyType != null
    And match response.data.subscriptions[*].item.title != null
    And match response.data.subscriptions[*].shipping != null
    And match response.data.subscriptions[*].shipTo != null
    And match response.data.subscriptions[*].billTo != null
    And assert response.data.query.limit == "100"



  @filterBySku
  Scenario: Get All Subscription with sku filter
    Given path '/v1/subscriptions'
    And param sku = __arg.sku
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And match response.data.subscriptions[*].id != null
    And match response.data.subscriptions[*].status != null
    And match response.data.subscriptions[*].channel != null
    And match response.data.subscriptions[*].customer != null
    And match response.data.subscriptions[*].customer.customerReferenceId != null
    And match response.data.subscriptions[*].plan != null
    And match response.data.subscriptions[*].plan.frequencyType != null
    And match response.data.subscriptions[*].item.title != null
    And match response.data.subscriptions[*].item.sku contains __arg.sku
    And match response.data.subscriptions[*].shipping != null
    And match response.data.subscriptions[*].shipTo != null
    And match response.data.subscriptions[*].billTo != null


  @filterByCustomerId
  Scenario: Get All Subscription with customer id filter
    Given path '/v1/subscriptions'
    And param customerReferenceId = __arg.customerId
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And match response.data.subscriptions[*].id != null
    And match response.data.subscriptions[*].status != null
    And match response.data.subscriptions[*].channel != null
    And match response.data.subscriptions[*].customer != null
    And match response.data.subscriptions[*].customer.customerReferenceId contains __arg.customerId
    And match response.data.subscriptions[*].plan != null
    And match response.data.subscriptions[*].plan.frequencyType != null
    And match response.data.subscriptions[*].item.title != null
    And match response.data.subscriptions[*].item.sku != null
    And match response.data.subscriptions[*].shipping != null
    And match response.data.subscriptions[*].shipTo != null
    And match response.data.subscriptions[*].billTo != null


  @filterByChannel
  Scenario: Get All Subscription with channel filter
    Given path '/v1/subscriptions'
    And param channel = 'POS'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And match response.data.subscriptions[*].id != null
    And match response.data.subscriptions[*].status != null
    And match response.data.subscriptions[*].channel != null
    And match response.data.subscriptions[*].channel contains 'POS'
    And match response.data.subscriptions[*].customer != null
    And match response.data.subscriptions[*].customer.customerReferenceId != null
    And match response.data.subscriptions[*].plan != null
    And match response.data.subscriptions[*].plan.frequencyType != null
    And match response.data.subscriptions[*].item.title != null
    And match response.data.subscriptions[*].item.sku != null
    And match response.data.subscriptions[*].shipping != null
    And match response.data.subscriptions[*].shipTo != null
    And match response.data.subscriptions[*].billTo != null



  @multipleParams
  Scenario: Get All Subscription with multiple params
    Given path '/v1/subscriptions'
    And param channel = 'POS'
    And param status = 'INACTIVE'
    And param sku = __arg.sku
    And param channel = 'POS'
    And param limit = 5
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And match response.data.subscriptions[*].id != null
    And match response.data.subscriptions[*].status contains 'INACTIVE'
    And match response.data.subscriptions[*].channel != null
    And match response.data.subscriptions[*].channel contains 'POS'
    And match response.data.subscriptions[*].customer != null
    And match response.data.subscriptions[*].customer.customerReferenceId != null
    And match response.data.subscriptions[*].plan != null
    And match response.data.subscriptions[*].plan.frequencyType != null
    And match response.data.subscriptions[*].item.title != null
    And match response.data.subscriptions[*].item.sku contains __arg.sku
    And match response.data.subscriptions[*].shipping != null
    And match response.data.subscriptions[*].shipTo != null
    And match response.data.subscriptions[*].billTo != null
    And assert response.data.query.limit == 5