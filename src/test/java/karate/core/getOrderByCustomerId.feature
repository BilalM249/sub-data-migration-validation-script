@Sanity
Feature: Get Order By Customer Id

  Background:

    * url baseUrl

  @validCustomerIdInScheduledState
  Scenario: Get order by CustomerId
    Given path '/v1/customers/' + __arg.id + "/orders"
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data.orders.length > 0
    And assert response.data.orders[0].status == "SCHEDULED"
    And assert response.data.orders[0].lineItems.length > 0
    And assert response.data.orders[0].shipTo != null
    And assert response.data.orders[0].shipTo.name != null
    And assert response.data.orders[0].shipTo.name.firstName != null
    And assert response.data.orders[0].shipTo.name.middleName != null
    And assert response.data.orders[0].shipTo.name.lastName != null
    And assert response.data.orders[0].billTo != null
    And assert response.data.orders[0].paymentDetails != null


    @invalidCustomerId
    Scenario: Get order by CustomerId
      Given path '/v1/customers/' + __arg.id + "/orders"
      And header Content-Type = 'application/json'
      And header Authorization = auth
      When method get
      Then status 400
      And assert response.responseStatus == "BAD_REQUEST"
      And assert response.message == "Invalid customer id"

  @validCustomerId
  Scenario: Get order by CustomerId
    Given path '/v1/customers/' + __arg.id + "/orders"
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data.orders.length > 0
    And assert response.data.orders[0].status != null
    And assert response.data.orders[0].lineItems.length > 0
    And assert response.data.orders[0].shipTo != null
    And assert response.data.orders[0].shipTo.name != null
    And assert response.data.orders[0].shipTo.name.firstName != null
    And assert response.data.orders[0].shipTo.name.middleName != null
    And assert response.data.orders[0].shipTo.name.lastName != null
    And assert response.data.orders[0].billTo != null
    And assert response.data.orders[0].paymentDetails != null
    And assert response.data.query != null
    And assert response.data.query.offset != null
    And assert response.data.query.limit != null
    And assert response.data.query.totalOrders != null

  @SuccesOrder
  Scenario: Get order by CustomerId
    Given path '/v1/customers/' + __arg.id + "/orders"
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data.orders.length == 2
    And assert response.data.orders[0].status != null
    And assert response.data.query.totalOrders == 2
    And assert response.data.orders[0].shipTo != null
    And assert response.data.orders[0].shipTo.name != null
    And assert response.data.orders[0].shipTo.name.firstName != null
    And assert response.data.orders[0].shipTo.name.middleName != null
    And assert response.data.orders[0].shipTo.name.lastName != null
    And assert response.data.orders[0].billTo != null
    And assert response.data.orders[0].paymentDetails != null
    And assert response.data.query != null
    And assert response.data.query.offset != null
    And assert response.data.query.limit != null
    And assert response.data.query.totalOrders != null

  @Orch_Failedscenarios
  Scenario: Get order by CustomerId
    Given path '/v1/customers/' + __arg.id + "/orders"
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data.orders.length == 1
    And assert response.data.orders[0].status == 'CANCELED'
    And assert response.data.orders[0].customer.status == 'ACTIVE'
    And assert response.data.query.totalOrders == 1
    And assert response.data.orders[0].shipTo != null
    And assert response.data.orders[0].shipTo.name != null
    And assert response.data.orders[0].shipTo.name.firstName != null
    And assert response.data.orders[0].shipTo.name.middleName != null
    And assert response.data.orders[0].shipTo.name.lastName != null
    And assert response.data.orders[0].billTo != null
    And assert response.data.orders[0].paymentDetails != null
    And assert response.data.query != null
    And assert response.data.query.offset != null
    And assert response.data.query.limit != null
    And assert response.data.query.totalOrders != null

  @limitquery
  Scenario: Get order by CustomerId
    Given path '/v1/customers/' + __arg.id + "/orders"
    And param limit = __arg.limit
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data.orders.length > 0
    And assert response.data.orders[0].status != null
    And assert response.data.orders[0].lineItems.length > 0
    And assert response.data.orders[0].shipTo != null
    And assert response.data.orders[0].shipTo.name != null
    And assert response.data.orders[0].shipTo.name.firstName != null
    And assert response.data.orders[0].shipTo.name.middleName != null
    And assert response.data.orders[0].shipTo.name.lastName != null
    And assert response.data.orders[0].billTo != null
    And assert response.data.orders[0].paymentDetails != null
    And assert response.data.query != null
    And assert response.data.query.offset != null
    And assert response.data.query.limit == __arg.limit
    And assert response.data.query.totalOrders != null

  @statusQuery
  Scenario: Get order by CustomerId
    Given path '/v1/customers/' + __arg.id + "/orders"
    And param status = __arg.status
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data.orders.length > 0
    And assert response.data.orders[0].status == __arg.status
    And assert response.data.orders[0].lineItems.length > 0
    And assert response.data.orders[0].shipTo != null
    And assert response.data.orders[0].shipTo.name != null
    And assert response.data.orders[0].shipTo.name.firstName != null
    And assert response.data.orders[0].shipTo.name.middleName != null
    And assert response.data.orders[0].shipTo.name.lastName != null
    And assert response.data.orders[0].billTo != null
    And assert response.data.orders[0].paymentDetails != null
    And assert response.data.query != null
    And assert response.data.query.offset != null
    And assert response.data.query.limit != null
    And assert response.data.query.totalOrders != null

