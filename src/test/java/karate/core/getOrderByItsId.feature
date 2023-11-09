@Sanity
Feature: Get Order By Its Id

  Background:

    * url baseUrl

  @validOrderId
  Scenario: Get order by ItsId
    Given path '/v1/orders/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data.order.status == "SCHEDULED" || "RETRY" || "CANCELED" || "FAILED" || "SUBMITTED" || "SUCCESS"
    And assert response.data.order.lineItems.length > 0
    And assert response.data.order.shipTo != null
    And assert response.data.order.shipTo.name != null
    And assert response.data.order.shipTo.name.firstName != null
    And assert response.data.order.shipTo.name.middleName != null
    And assert response.data.order.shipTo.name.lastName != null
    And assert response.data.order.billTo != null
    And assert response.data.order.paymentDetails != null

  @successOrderId
  Scenario: Get order by ItsId
    Given path '/v1/orders/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data.order.status == 'SUCCESS'
    And assert response.data.order.lineItems.length > 0
    And assert response.data.order.shipTo != null
    And assert response.data.order.shipTo.name != null
    And assert response.data.order.shipTo.name.firstName != null
    And assert response.data.order.shipTo.name.middleName != null
    And assert response.data.order.shipTo.name.lastName != null
    And assert response.data.order.billTo != null
    And assert response.data.order.paymentDetails != null

  @RetryOrder
  Scenario: Get order by ItsId
    Given path '/v1/orders/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data.order.status == 'RETRY'
    And assert response.data.order.lineItems.length > 0
    And assert response.data.order.shipTo != null
    And assert response.data.order.shipTo.name != null
    And assert response.data.order.shipTo.name.firstName != null
    And assert response.data.order.shipTo.name.middleName != null
    And assert response.data.order.shipTo.name.lastName != null
    And assert response.data.order.billTo != null
    And assert response.data.order.paymentDetails != null
    * def totalAmount1 = (response.data.order.lineItems[0].item.itemPrice.price) * (response.data.order.lineItems[0].item.quantity)
    * def totalTax1 = (response.data.order.lineItems[0].item.tax.taxAmount)
    * def totalDiscount =  response.data.order.totalDiscount
    * def totalAmount =  totalAmount1 + totalTax1 - totalDiscount
    And assert response.data.order.totalAmount == totalAmount

  @CanceledOrder
  Scenario: Get order by ItsId
    Given path '/v1/orders/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And print response.data.order.status
    And assert response.data.order.status == 'CANCELED'
    And assert response.data.order.lineItems.length > 0
    And assert response.data.order.shipTo != null
    And assert response.data.order.shipTo.name != null
    And assert response.data.order.shipTo.name.firstName != null
    And assert response.data.order.shipTo.name.middleName != null
    And assert response.data.order.shipTo.name.lastName != null
    And assert response.data.order.billTo != null
    And assert response.data.order.paymentDetails != null
    * def totalAmount1 = (response.data.order.lineItems[0].item.itemPrice.price) * (response.data.order.lineItems[0].item.quantity)
    * def totalTax1 = (response.data.order.lineItems[0].item.tax.taxAmount)
    * def totalDiscount =  response.data.order.totalDiscount
    * def totalAmount =  totalAmount1 + totalTax1 - totalDiscount
    And assert response.data.order.totalAmount == totalAmount

  @orch_FailedOrder
  Scenario: Get order by ItsId
    Given path '/v1/orders/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And print response.data.order.status
    And assert response.data.order.status == 'FAILED'
    And assert response.data.order.customer.status == 'INACTIVE'
    And assert response.data.order.lineItems.length > 0
    And assert response.data.order.shipTo != null
    And assert response.data.order.shipTo.name != null
    And assert response.data.order.shipTo.name.firstName != null
    And assert response.data.order.shipTo.name.middleName != null
    And assert response.data.order.shipTo.name.lastName != null
    And assert response.data.order.billTo != null
    And assert response.data.order.paymentDetails != null
    * def totalAmount1 = (response.data.order.lineItems[0].item.itemPrice.price) * (response.data.order.lineItems[0].item.quantity)
    * def totalTax1 = (response.data.order.lineItems[0].item.tax.taxAmount)
    * def totalDiscount =  response.data.order.totalDiscount
    * def totalAmount =  totalAmount1 + totalTax1 - totalDiscount
    And assert response.data.order.totalAmount == totalAmount


  @invalidOrderId
    Scenario: Get order by Its Id
      Given path '/v1/orders/' + __arg.id
      And header Content-Type = 'application/json'
      And header Authorization = auth
      When method get
      Then status 400
      And assert response.responseStatus == "BAD_REQUEST"
      And assert response.message == "Invalid order id"


