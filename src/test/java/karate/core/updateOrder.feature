@Sanity
Feature: Update Order

  Background:

    * def random =
    """
    function(s) {
        var text = "";
        var possible = "123456789";
        for (var i = 0; i < s; i++)
        text += possible.charAt(Math.floor(Math.random() * possible.length));
        return text;
    }
    """
    * def random1 =  random(10)
    * url baseUrl
    * def updateOrder = read('classpath:karate/payloads/updateQTYForOrder.json')
    * def updateShippingAndBillingAddresses = read('classpath:karate/payloads/updateShipping&BillingForOrder.json')
    * def updateItemDetails = read('classpath:karate/payloads/updateItemDetails.json')
    * def updateInvalidShippingAndBillingAddresses = read('classpath:karate/payloads/updateInvalidShipping&BillingForOrder.json')



  @invalidOrderId
  Scenario: Update an order with invalid order id
    Given path 'v1/orders/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request updateOrder
    When method patch
    Then status 404
    And print response
    And assert response.responseStatus == "NOT_FOUND"
    And assert response.message == "Order not found"

  @invalidOrderStatus
  Scenario: Update an order with invalid order status
    Given path 'v1/orders/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request updateOrder
    When method patch
    Then status 404
    And print response
    And assert response.responseStatus == "NOT_FOUND"
    And assert response.message == "Order not found"

  @UpdateCustomerAttributes
  Scenario: Update an order customer attributes
    Given path 'v1/orders/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request { "lineItems": [ { "lineItemId": 1, "customAttributes": { "storeId": "abc", "associateId": 3, "trackingUrl": "abcc" } } ] }
    When method patch
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data.id != null || response.data.id != ""
    And assert response.data.order.status == 'SCHEDULED' || 'RETRY'
    And assert response.data.order.shipTo != null
    And assert response.data.order.billTo != null
    And assert response.data.order.paymentDetails != null
    And assert response.data.order.lineItems[0].customAttributes.storeId == 'abc'
    And assert response.data.order.lineItems[0].customAttributes.associateId == 3
    And assert response.data.order.lineItems[0].customAttributes.trackingUrl == 'abcc'

  @UpdateShipping&BillingDetails
  Scenario: Update an Order shipping&Billing details
    Given path 'v1/orders/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request updateShippingAndBillingAddresses
    When method patch
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data.id != null || response.data.id != ""
    And assert response.data.order.status == 'SCHEDULED' || 'RETRY'
    And assert response.data.order.shipTo.name.firstName == 'customerFirst'
    And assert response.data.order.shipTo.name.lastName == 'customerLast'
    And assert response.data.order.shipTo.phone.number == '4455743845'
    And assert response.data.order.shipTo.city == 'Pune'
    And assert response.data.order.billTo.name.firstName == 'Nirali'
    And assert response.data.order.billTo.name.lastName == 'Shirsekar'
    And assert response.data.order.billTo.phone.number == '5375584493'
    And assert response.data.order.billTo.city == 'Pune'

  @UpdateInvalidShipping&BillingDetails
  Scenario: Update an Order shipping&Billing details
    Given path 'v1/orders/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request updateInvalidShippingAndBillingAddresses
    When method patch
    Then status 400
    And print response
    And assert response.responseStatus == "BAD_REQUEST"

  @UpdatePaymentDetails
  Scenario: Update an order payment details
    Given path 'v1/orders/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request { "paymentDetails": { "paymentIdentifier": { "cardIdentifier": "4444", "expiryDate": "12/30" }, "paymentMethod": "mastercard", "paymentKind": "CARD_PAYPAL" } }
    When method patch
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data.id != null || response.data.id != ""
    And assert response.data.order.status == 'SCHEDULED' || 'RETRY'
    And assert response.data.order.shipTo != null
    And assert response.data.order.billTo != null
    And assert response.data.order.paymentDetails != null
    And assert response.data.order.paymentDetails.paymentIdentifier.cardIdentifier == "4444"
    And assert response.data.order.paymentDetails.paymentIdentifier.expiryDate == "12/30"
    And assert response.data.order.paymentDetails.paymentMethod == "mastercard"
    And assert response.data.order.paymentDetails.paymentKind == "CARD_PAYPAL"

  @UpdateInvalidPaymentDetails
  Scenario: Update an order payment details
    Given path 'v1/orders/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request { "paymentDetails": { "paymentIdentifier": { "cardIdentifier": "abcd", "expiryDate": "abcd/ef" }, "paymentMethod": "mastercard", "paymentKind": "CARD_PAYPAL" } }
    When method patch
    Then status 400
    And print response
    And assert response.responseStatus == "BAD_REQUEST"
    And assert response.message == "Expiry Date is invalid"

  @UpdateShippingDetails
  Scenario: Update an order payment details
    Given path 'v1/orders/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request { "lineItems": [ { "lineItemId": 1, "shipping": { "shipmentCarrier": "USPS", "shipmentMethod": "Ground", "shipmentInstructions": "", "taxCode": "SHP020000", "shippingAmount": 10, "taxAmount": 1, "currencyCode": "USD" } } ] }
    When method patch
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data.id != null || response.data.id != ""
    And assert response.data.order.status == 'SCHEDULED' || 'RETRY'
    And assert response.data.order.shipTo != null
    And assert response.data.order.billTo != null
    And assert response.data.order.lineItems[0].shipping.shipmentCarrier == 'USPS'
    And assert response.data.order.lineItems[0].shipping.shipmentMethod == 'Ground'
    And assert response.data.order.lineItems[0].shipping.shipmentInstructions == ''
    And assert response.data.order.lineItems[0].shipping.taxCode == 'SHP020000'
    And assert response.data.order.lineItems[0].shipping.shippingAmount == 10
    And assert response.data.order.lineItems[0].shipping.taxAmount == 1
    And assert response.data.order.lineItems[0].shipping.currencyCode == 'USD'

  @UpdateInvalidShippingDetails
  Scenario: Update an order payment details
    Given path 'v1/orders/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request { "lineItems": [ { "lineItemId": 1, "shipping": { "shipmentCarrier": "USPS", "shipmentMethod": "Ground", "shipmentInstructions": "", "taxCode": "SHP020000", "shippingAmount": 10, "taxAmount": 1, "currencyCode": "asd" } } ] }
    When method patch
    Then status 400
    And print response
    And assert response.responseStatus == "BAD_REQUEST"
    And assert response.message == "\"lineItems[0].shipping.currencyCode\" must be one of [USD, CAD, EURO]"
    And assert response.data.id != null || response.data.id != ""
    And assert response.data.details[0].context.key == 'currencyCode'


  @UpdateItemDetails
  Scenario: Update an Order item Details
    Given path 'v1/orders/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request updateItemDetails
    When method patch
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data.id != null || response.data.id != ""
    And assert response.data.order.status == 'SCHEDULED' || 'RETRY'
    And assert response.data.order.lineItems[0].item.weight == 100
    And assert response.data.order.lineItems[0].item.weightUnit == 'l1b'
    And assert response.data.order.lineItems[0].item.tax.taxCode == 'FR020000'
    And assert response.data.order.lineItems[0].item.tax.taxAmount == '4566.00'
    And assert response.data.order.lineItems[0].item.tax.currencyCode == 'USD'

  @UpdateInvalidItemDetails_Decimal
  Scenario: Update an Order item Details Invalid
    Given path 'v1/orders/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request { "lineItems": [ { "lineItemId": '#(__arg.lineItemId)', "item": { "quantity": 5 } } ] }
    When method patch
    Then status 400
    And print response
    And assert response.responseStatus == "BAD_REQUEST"

  @UpdateInvalidItemDetails_LessThan0
  Scenario: Update an Order item Details Invalid
    Given path 'v1/orders/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request { "lineItems": [ { "lineItemId": '#(__arg.lineItemId)', "item": { "quantity": 5 } } ] }
    When method patch
    Then status 400
    And print response
    And assert response.responseStatus == "BAD_REQUEST"


  @UpdateItemDetails_InvalidNotExsit
  Scenario: Update an Order item Details Invalid
    Given path 'v1/orders/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request { "lineItems": [ { "lineItemId": '#(__arg.lineItemId)', "item": { "quantity": 5 } } ] }
    When method patch
    Then status 400
    And print response
    And assert response.responseStatus == "BAD_REQUEST"
    And assert response.message[0].errorMessage == "Invalid line item id"

  @UpdateItemQuantityDetails
  Scenario: Update an orders item quantity details
    Given path 'v1/orders/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request { "lineItems": [ { "lineItemId": 1, "item": { "quantity": 7 } } ] }
    When method patch
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data.order.status == 'SCHEDULED' || 'RETRY'
    And assert response.data.order.totalDiscount == 0
    And assert response.data.order.lineItems[0].item.quantity == 7
    And assert response.data.order.shipTo != null
    And assert response.data.order.billTo != null
    And assert response.data.order.paymentDetails != null

  @UpdateInvalidQuantityDetails_LessThan0
  Scenario: Update a subscription item quantity details
    Given path 'v1/orders/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request { "lineItems": [ { "lineItemId": 1, "item": { "quantity": '#(__arg.quantity)'} } ] }
    When method patch
    Then status 400
    And print response
    And assert response.responseStatus == "BAD_REQUEST"
    And assert response.message == "\"lineItems[0].item.quantity\" must be greater than or equal to 1"
    And assert response.data.details[0].context.value == __arg.quantity
    And assert response.data.details[0].context.key == "quantity"

  @UpdateInvalidQuantityDetails_Decimal
  Scenario: Update a subscription item quantity details
    Given path 'v1/orders/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request { "lineItems": [ { "lineItemId": 1, "item": { "quantity": '#(__arg.quantity)'} } ] }
    When method patch
    Then status 400
    And print response
    And assert response.responseStatus == "BAD_REQUEST"
    And assert response.data.details[0].context.value == __arg.quantity
    And assert response.data.details[0].context.key == "quantity"

  @UpdatescheduledDate
  Scenario: Update the scheduledDate for the Order
    Given path 'v1/orders/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request {"scheduledDate": "2090-08-07T10:00:01.199Z"}
    When method patch
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data.order.status == 'SCHEDULED' || 'RETRY'
    And assert response.data.order.shipTo != null
    And assert response.data.order.billTo != null
    And assert response.data.order.paymentDetails != null
    And assert response.data.order.scheduledDate == '2090-08-07T10:00:01.199Z'


  @UpdateInvalidFormatscheduledDate
  Scenario: Update the scheduledDate for the Order
    Given path 'v1/orders/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request {"scheduledDate": '#(__arg.scheduledDate)'}
    When method patch
    Then status 400
    And print response
    And assert response.responseStatus == "BAD_REQUEST"
    And print response.message
    And assert response.message == "\"scheduledDate\" must be in ISO 8601 date format"
    And assert response.data.details[0].context.key == 'scheduledDate'

  @UpdateInvalidDatescheduledDate
  Scenario: Update the scheduledDate for the Order
    Given path 'v1/orders/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request {"scheduledDate": '#(__arg.scheduledDate)'}
    When method patch
    Then status 400
    And print response
    And assert response.responseStatus == "BAD_REQUEST"
    And match response.message contains '"scheduledDate" must be greater than'
