@Sanity
Feature: Remove Items from Order

  Background:

    * url baseUrl

    * def RemoveItem = read('classpath:karate/payloads/RemoveItem.json')
    * def RemoveIAlltems = read('classpath:karate/payloads/RemoveAllItems.json')
    * def RemoveInvalidLineItemDecimal = read('classpath:karate/payloads/RemoveInvalidLineItemDecimal.json')
    * def RemoveInvalidLineItemNotExist = read('classpath:karate/payloads/RemoveInvalidLineItemNotExist.json')
    * def RemoveInvalidLineItemZero = read('classpath:karate/payloads/RemoveInvalidLineItemZero.json')


  @invalidOrderId
  Scenario: Remove Item By Passing Invalid OrderId
    Given path '/v1/orders/' + __arg.id + '/remove-items'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method post
    Then status 400
    And assert response.responseStatus == "BAD_REQUEST"
    And assert response.message == "Invalid order id"


  @invalidOrderStatus
  Scenario: Remove Item By Passing Invalid OrderStatus
    Given path '/v1/orders/' + __arg.id + '/remove-items'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request RemoveItem
    When method post
    Then status 404
    And assert response.responseStatus == "NOT_FOUND"
    And assert response.message == "Order not found"

  @line-item-with-subscription
  Scenario: Remove Item By Passing Invalid LineItem Decimal
    Given path '/v1/orders/' + __arg.id + '/remove-items'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request RemoveIAlltems
    When method post
    Then status 400
    And assert response.responseStatus == "BAD_REQUEST"
    And assert response.message[0].errorMessage == "Line item with subscription cannot be removed"


  @invalidLineItemDecimal
  Scenario: Remove Item By Passing Invalid LineItem Decimal
    Given path '/v1/orders/' + __arg.id + '/remove-items'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request RemoveInvalidLineItemDecimal
    When method post
    Then status 400
    And assert response.responseStatus == "BAD_REQUEST"
    And match response.message contains '\"lineItemIds[0]\" must be an integer'
    And match response.data.details[0].type contains 'number.integer'

  @invalidLineItemNotExist
  Scenario: Remove Item By Passing NotExist LineItem
    Given path '/v1/orders/' + __arg.id + '/remove-items'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request RemoveInvalidLineItemNotExist
    When method post
    Then status 400
    And assert response.responseStatus == "BAD_REQUEST"
    And match response.message[0].errorCode contains 'LINE_ITEM_NOT_FOUND'
    And match response.message[0].errorMessage contains 'Invalid line item id'

  @invalidLineItemZero
  Scenario: Remove Item By Passing Invalid LineItem- Zero
    Given path '/v1/orders/' + __arg.id + '/remove-items'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request RemoveInvalidLineItemZero
    When method post
    Then status 400
    And assert response.responseStatus == "BAD_REQUEST"
    And match response.message contains '\"lineItemIds[0]\" must be greater than 0'
    And match response.data.details[0].type contains 'number.greater'


  @validLineItem
  Scenario: Add Item By Passing Valid Line Item
    Given path '/v1/orders/' + __arg.id + '/remove-items'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request RemoveItem
    When method post
    Then status 200
    And print response.data
    And match response.data.order.id != null
    And match response.data.order.status != null
    And match response.data.errors == []
    And assert response.data.order.lineItems.length == 1
    And match response.data.order.lineItems[0].subscription.plan.frequencyType != null
    And match response.data.order.lineItems[0].subscription.plan.frequencyType != null
    And match response.data.order.lineItems[0].item.title != null
    And match response.data.order.lineItems[0].shipping != null
    And match response.data.order.shipTo != null
    And match response.data.order.billTo != null
    * def totalAmount1 = (response.data.order.lineItems[0].item.itemPrice.price) * (response.data.order.lineItems[0].item.quantity)
    * def totalTax1 = (response.data.order.lineItems[0].item.tax.taxAmount)
    * def totalDiscount =  response.data.order.totalDiscount
    * def totalAmount =  totalAmount1 + totalTax1 - totalDiscount
    And assert response.data.order.totalAmount == totalAmount