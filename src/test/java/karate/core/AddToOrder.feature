@Sanity
Feature: Add Items In Order

  Background:

    * url baseUrl

    * def AddUpsellItemToOrderPayload = read('classpath:karate/payloads/AddUpsellItemToOrder.json')
    * AddUpsellItemToOrderPayload.lineItems[0].item.sku = __arg.sku
    * def AddUpsellItemToOrderWithInvalidSKUPayload = read('classpath:karate/payloads/AddUpsellItemToOrderWithInvalidSKU.json')

    @invalidOrderId
    Scenario: Add Item By Passing Invalid OrderId
      Given path '/v1/orders/' + __arg.id + '/add-items'
      And header Content-Type = 'application/json'
      And header Authorization = auth
      When method post
      Then status 400
      And assert response.responseStatus == "BAD_REQUEST"
      And assert response.message == "Invalid order id"


  @invalidOrderStatus
  Scenario: Add Item By Passing Invalid Order Status
    Given path '/v1/orders/' + __arg.id + '/add-items'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request AddUpsellItemToOrderPayload
    When method post
    Then status 400
    And assert response.responseStatus == "BAD_REQUEST"
    And assert response.message == "Can only add item to scheduled orders"


  @invalidSKU
  Scenario: Add Item By Passing Invalid SKU
    Given path '/v1/orders/' + __arg.id + '/add-items'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request AddUpsellItemToOrderWithInvalidSKUPayload
    When method post
    Then status 400
    And assert response.responseStatus == "BAD_REQUEST"
    And match response.message[0][0].errorMessage contains 'Product with the SKU ID does not exist.'
    And match response.message[0][1].errorCode contains 'sku is required'


  @validOrder
  Scenario: Add Item By Passing Valid OrderId
    Given path '/v1/orders/' + __arg.id + '/add-items'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request AddUpsellItemToOrderPayload
    When method post
    Then status 200
    And print response.data
    And match response.data.order.id != null
    And match response.data.order.status != null
    And print response.data.order.lineItems.length
    And assert response.data.order.lineItems.length > 1
    And match response.data.order.lineItems[0].subscription.plan.frequencyType != null
    And match response.data.order.lineItems[0].subscription.plan.frequencyType != null
    And match response.data.order.lineItems[0].item.title != null
    And match response.data.order.lineItems[0].shipping != null
    And match response.data.order.shipTo != null
    And match response.data.order.billTo != null
