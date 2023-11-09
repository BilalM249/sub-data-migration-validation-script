@Sanity
Feature: Orchestration

  Background:

    * url baseUrl

    @invalidOrderId
    Scenario: Add Item By Passing Invalid OrderId
      Given path '/v1/orchestration/response'
      And header Content-Type = 'application/json'
      And header Authorization = auth
      And request [ { "order": { "code": "SUCCESS", "orderId": '#(__arg.id)' } } ]
      When method post
      Then status 400
      And assert response.responseStatus == "BAD_REQUEST"
      And assert response.message == "Invalid order id"


  @invalidOrderStatus
  Scenario: Add Item By Passing Invalid Order Status
    Given path '/v1/orchestration/response'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request [ { "order": { "code": "SUCCESS", "orderId": '#(__arg.id)' } } ]
    When method post
    Then status 400
    And assert response.responseStatus == "NOT_FOUND"
    And assert response.message == "Order not found"

  @successOrderId
  Scenario: Success scenario
    Given path '/v1/orchestration/response'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request [ { "order": { "code": "SUCCESS", "orderId":'#(__arg.id)' } } ]
    When method post
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.data[0].orderId == __arg.id
    And assert response.data[0].status == 'SUCCESS'

  @customerNotFound
  Scenario: customer not found
    Given path '/v1/orchestration/response'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request [ { "order":{ "code": "ERROR", "orderId":'#(__arg.id)', "errorCode": 999, "errorMsg": "Customer Not found" } } ]
    When method post
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.data[0].orderId == __arg.id
    And assert response.data[0].status == 'FAILED'

  @OutOfStock
  Scenario: out of stock
    Given path '/v1/orchestration/response'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request  [ { "order":{ "code": "ERROR", "orderId":'#(__arg.id)', "errorCode":321, "errorMsg":"Out Of Stock", "lineItemIds": [1] } } ]
    When method post
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.data[0].orderId == __arg.id
    And assert response.data[0].status == 'RETRY'

  @AgentLogIn
  Scenario:  Agent Log in
    Given path '/v1/orchestration/response'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request  [ { "order":{ "code": "ERROR","orderId":'#(__arg.id)', "errorCode": 999, "errorMsg": "Agent login failed" } } ]
    When method post
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.data[0].orderId == __arg.id
    And assert response.data[0].status == 'RETRY'

  @LowInventory
  Scenario:  Agent Log in
    Given path '/v1/orchestration/response'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request [ { "order":{ "code": "ERROR","orderId":'#(__arg.id)', "errorCode":123, "errorMsg":"Low Inventory", "lineItemIds": [1] } } ]
    When method post
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.data[0].orderId == __arg.id
    And assert response.data[0].status == 'RETRY'
