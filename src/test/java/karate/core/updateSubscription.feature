@Sanity
Feature: Update Subscription

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
    * def updateSubs = read('classpath:karate/payloads/updateSubs.json')
    * def updateSubsCustomerDetails = read('classpath:karate/payloads/updateSubsCustomerDetails.json')
    * def updateSubsShippingDetails = read('classpath:karate/payloads/updateSubsShippingDetails.json')
    * def sku = __arg.sku

  @invalidSubId
  Scenario: Update a subscription with invalid sub id
    Given path 'v1/subscriptions/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request updateSubs
    When method patch
    Then status 404
    And print response
    And assert response.responseStatus == "NOT_FOUND"
    And assert response.message == "Subscription not found"


  @UpdateCustomerDetails
  Scenario: Update a subscription customer details
    Given path 'v1/subscriptions/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request updateSubsCustomerDetails
    When method patch
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data.id != null || response.data.id != ""
    And assert response.data.subscription.customer.status != null || response.data.subscription.customer.status != ''
    And assert response.data.subscription.customer.lastName != null || response.data.subscription.customer.lastName != ''
    And assert response.data.subscription.customer.firstName != null || response.data.subscription.customer.firstName != ''
    And assert response.data.subscription.customer.email != null || response.data.subscription.customer.email != ''
    And assert response.data.subscription.customer.locale != null || response.data.subscription.customer.locale != ''
    And assert response.data.subscription.customer.lastName == "Doe2"
    And assert response.data.subscription.customer.firstName == "John2"
    And assert response.data.subscription.customer.email == "updated@mail.com"


  @UpdateShippingDetails
  Scenario: Update a subscription shipping details
    Given path 'v1/subscriptions/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request updateSubsShippingDetails
    When method patch
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data.id != null || response.data.id != ""
    And assert response.data.subscription.customer.status != null || response.data.subscription.customer.status != ''
    And assert response.data.subscription.customer.lastName != null || response.data.subscription.customer.lastName != ''
    And assert response.data.subscription.customer.firstName != null || response.data.subscription.customer.firstName != ''
    And assert response.data.subscription.customer.email != null || response.data.subscription.customer.email != ''
    And assert response.data.subscription.customer.locale != null || response.data.subscription.customer.locale != ''
    And assert response.data.subscription.shipping.shipmentCarrier == "USPS_UPDATED"
    And assert response.data.subscription.shipping.shipmentMethod == "Ground_UPDATED"
    And assert response.data.subscription.shipping.shipmentInstructions == "NEW UPDATED INSTRUCTIONS"
    And assert response.data.subscription.shipping.taxCode == "SHP020000_UPDATED"

  @UpdateBillToDetails
  Scenario: Update a subscription bill to details
    Given path 'v1/subscriptions/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request { "billTo": { "name": { "firstName": "Bilal", "middleName": "UPDATED", "lastName": "M" }, "streetAddress": { "street1": "new street", "street2": "new street" }, "phone": { "number": "01232357", "kind": "mobile" }, "city": "BOSTON", "state": "MA", "postalCode": "21", "country": "us" } }
    When method patch
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data.id != null || response.data.id != ""
    And assert response.data.subscription.customer.status != null || response.data.subscription.customer.status != ''
    And assert response.data.subscription.customer.lastName != null || response.data.subscription.customer.lastName != ''
    And assert response.data.subscription.customer.firstName != null || response.data.subscription.customer.firstName != ''
    And assert response.data.subscription.customer.email != null || response.data.subscription.customer.email != ''
    And assert response.data.subscription.customer.locale != null || response.data.subscription.customer.locale != ''
    And assert response.data.subscription.customer.lastName != "Bilal"
    And assert response.data.subscription.customer.middleName != "UPDATED"
    And assert response.data.subscription.customer.firstName != "M"


  @UpdatePaymentDetails
  Scenario: Update a subscription payment details
    Given path 'v1/subscriptions/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request { "paymentDetails": { "paymentIdentifier": { "cardIdentifier": "1111", "expiryDate": "09/00" }, "paymentMethod": "visa", "paymentKind": "CARD_MASTERCARD" } }
    When method patch
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data.id != null || response.data.id != ""
    And assert response.data.subscription.customer.status != null || response.data.subscription.customer.status != ''
    And assert response.data.subscription.customer.lastName != null || response.data.subscription.customer.lastName != ''
    And assert response.data.subscription.customer.firstName != null || response.data.subscription.customer.firstName != ''
    And assert response.data.subscription.customer.email != null || response.data.subscription.customer.email != ''
    And assert response.data.subscription.customer.locale != null || response.data.subscription.customer.locale != ''
    And assert response.data.subscription.paymentDetails.paymentIdentifier.cardIdentifier == "1111"
    And assert response.data.subscription.paymentDetails.paymentIdentifier.expiryDate == "09/00"
    And assert response.data.subscription.paymentDetails.paymentMethod == "visa"
    And assert response.data.subscription.paymentDetails.paymentKind == "CARD_MASTERCARD"


  @UpdateItemDetails
  Scenario: Update a subscription item Details
    Given path 'v1/subscriptions/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request { "item": { "quantity": 3, "weight": 10, "weightUnit": "kgs" } }
    When method patch
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data.id != null || response.data.id != ""
    And assert response.data.subscription.customer.status != null || response.data.subscription.customer.status != ''
    And assert response.data.subscription.customer.lastName != null || response.data.subscription.customer.lastName != ''
    And assert response.data.subscription.customer.firstName != null || response.data.subscription.customer.firstName != ''
    And assert response.data.subscription.customer.email != null || response.data.subscription.customer.email != ''
    And assert response.data.subscription.customer.locale != null || response.data.subscription.customer.locale != ''
    And assert response.data.subscription.item.quantity == "3"
    And assert response.data.subscription.item.weight == "10"
    And assert response.data.subscription.item.weightUnit == "kgs"


  @UpdateItemQuantityDetails
  Scenario: Update a subscription item quantity details
    Given path 'v1/subscriptions/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request { "item": { "quantity": 7 } }
    When method patch
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data.id != null || response.data.id != ""
    And assert response.data.subscription.customer.status != null || response.data.subscription.customer.status != ''
    And assert response.data.subscription.customer.lastName != null || response.data.subscription.customer.lastName != ''
    And assert response.data.subscription.customer.firstName != null || response.data.subscription.customer.firstName != ''
    And assert response.data.subscription.customer.email != null || response.data.subscription.customer.email != ''
    And assert response.data.subscription.customer.locale != null || response.data.subscription.customer.locale != ''
    And assert response.data.subscription.item.quantity == "7"


  @SwapWithInvalidSku
  Scenario: Update a subscription customer details
    Given path 'v1/subscriptions/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request { "item": { "sku": '#(sku)' } }
    When method patch
    Then status 400
    And print response
    And assert response.responseStatus == "BAD_REQUEST"
    And match response.message contains "is not a apart of the swappable SKU list of"


  @DeactivatedSubscriptions
  Scenario: Update a subscription customer details
    Given path 'v1/subscriptions/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request { "item": { "quantity": 7 } }
    When method patch
    Then status 404
    And print response
    And assert response.responseStatus == "NOT_FOUND"
    And assert response.message == "Subscription not found"