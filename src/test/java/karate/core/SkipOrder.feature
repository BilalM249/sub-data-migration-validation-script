@Sanity
Feature: Skip Order

  Background:

    * url baseUrl


    @invalidOrderId
    Scenario: Skip invalid order id
      Given path '/v1/orders/' + __arg.id + '/skip'
      And header Content-Type = 'application/json'
      And header Authorization = auth
      When method put
      Then status 400
      And assert response.responseStatus == "BAD_REQUEST"
      And assert response.message == "Invalid order id"


  @invalidOrderStatus
  Scenario: ASkip Invalid Order Status
    Given path '/v1/orders/' + __arg.id + '/skip'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method put
    Then status 400
    And assert response.responseStatus == "BAD_REQUEST"
    And assert response.message == "Only orders in scheduled status can be skipped"


  @validOrder
  Scenario: Skip Order With Valid Status
    Given path '/v1/orders/' + __arg.id + '/skip'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method put
    Then status 200
    And print response
    And match response.message contains 'Request processed successfully.'
    And match response.data.Order.id contains __arg.id
    And match response.data.Order.status contains 'SKIPPED'
    And match response.data.nextScheduledOrders.newOrders[0] != null

  @withUpsell
  Scenario: Get new Order
    Given path '/v1/orders/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print __arg.frequencyType
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And print response.data.order.status
    And assert response.data.order.status == "SCHEDULED"
    And assert response.data.order.lineItems.length == 1
    And assert response.data.order.shipTo != null
    And assert response.data.order.lineItems[0].subscription != null
    And assert response.data.order.shipTo.name.middleName != null
    And assert response.data.order.shipTo.name.lastName != null
    And assert response.data.order.billTo != null
    And assert response.data.order.paymentDetails != null
    And assert response.data.order.lineItems[0].subscription.plan.frequency ==  __arg.frequency
    And assert response.data.order.lineItems[0].subscription.plan.frequencyType ==  __arg.frequencyType
    * def totalAmount1 = (response.data.order.lineItems[0].item.itemPrice.price) * (response.data.order.lineItems[0].item.quantity)
    * def totalTax1 = (response.data.order.lineItems[0].item.tax.taxAmount)
    * def totalDiscount =  response.data.order.totalDiscount
    * def totalAmount =  totalAmount1 + totalTax1 - totalDiscount
    And assert response.data.order.totalAmount == totalAmount