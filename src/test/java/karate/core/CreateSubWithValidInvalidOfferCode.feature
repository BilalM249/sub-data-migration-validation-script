Feature: Create subscriptions with valid and invalid offerId
  Background:

    * url baseUrl

    * def random =
    """
    function() {
    const characters = '1234567890abcdefghijklmnopqrstuvwxyz';
    let randomString = '';

    for (let i = 0; i < 15; i++) {
    const randomIndex = Math.floor(Math.random() * characters.length);
    randomString += characters[randomIndex];
    }

    return randomString;
    }
    """

    * def random1 =  random()
    * def sku1 = __arg.sku1
    * def sku2 = __arg.sku2
    * def validOfferCode = __arg.validOfferCode
    * def invalidOfferCode = __arg.invalidOfferCode

    * def validInvalidOfferCodePayload = read('classpath:karate/payloads/createSubscription_valid_invalid_offerCode.json')
    * validInvalidOfferCodePayload.originOrderId = random1

    * validInvalidOfferCodePayload.items[0].sku = sku1
    * validInvalidOfferCodePayload.items[0].offer.id = validOfferCode

    * validInvalidOfferCodePayload.items[1].sku = sku2
    * validInvalidOfferCodePayload.items[1].offer.id = invalidOfferCode


    @both_valid_skus_one_invalid_offerCode
  Scenario: Create a subscription
    Given path 'v1/subscriptions/bulk'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request validInvalidOfferCodePayload
    When method post
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed with partial success"
    And assert response.data.id != null || response.data.id != ""
    And assert response.data.subscriptions[0].customer.status != null || response.data.subscriptions[0].customer.status != ''
    And assert response.data.subscriptions[0].customer.lastName != null || response.data.subscriptions[0].customer.lastName != ''
    And assert response.data.subscriptions[0].customer.firstName != null || response.data.subscriptions[0].customer.firstName != ''
    And assert response.data.subscriptions[0].customer.email != null || response.data.subscriptions[0].customer.email != ''
    And assert response.data.subscriptions[0].customer.locale != null || response.data.subscriptions[0].customer.locale != ''
    And assert response.data.errors[0].errorCode == "INVALID_OFFERCODE"
    And assert response.data.errors[0].errorMessage == "offer code is not valid"
