@Sanity
Feature: Add Items In Order

  Background:

    * url baseUrl

    @invalidOrderId
    Scenario: Trigger Order Passing Invalid OrderId
      Given path '/v1/orders/' + __arg.id + '/trigger-now'
      And header Content-Type = 'application/json'
      And header Authorization = auth
      When method get
      Then status 400
      And assert response.responseStatus == "BAD_REQUEST"
      And assert response.message == "Invalid order id"


    @invalidOrderStatus
    Scenario: Trigger Order By Passing Invalid Order Status
      Given path '/v1/orders/' + __arg.id + '/trigger-now'
      And header Content-Type = 'application/json'
      And header Authorization = auth
      When method get
      Then status 400
      And assert response.responseStatus == "BAD_REQUEST"
      And assert response.message == "Order not found"


    @validOrder
    Scenario:Trigger valid order
      Given path '/v1/orders/' + __arg.id + '/trigger-now'
      And header Content-Type = 'application/json'
      And header Authorization = auth
      When method get
      Then status 200
      And print response.data
      And match response.data.order.id != null
      And match response.data.order.status != null
      And assert response.data.order.lineItems.length != null
      And match response.data.order.status == 'SUBMITTED'
      And match response.data.order.lineItems[0].subscription.plan.frequencyType != null
      And match response.data.order.lineItems[0].subscription.plan.frequencyType != null
      And match response.data.order.lineItems[0].item.title != null
      And match response.data.order.lineItems[0].shipping != null
      And match response.data.order.shipTo != null
      And match response.data.order.billTo != null
      * def totalAmount1 = (response.data.order.lineItems[0].item.itemPrice.price) * (response.data.order.lineItems[0].item.quantity)
      * def totalTax1 = (response.data.order.lineItems[0].item.tax.taxAmount)
      * def totalDiscount =  response.data.order.totalDiscount
      * def totalAmount =  totalAmount1  + totalTax1 - totalDiscount
      And assert response.data.order.totalAmount == totalAmount