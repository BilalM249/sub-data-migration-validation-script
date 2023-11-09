@Sanity
Feature: Create subscriptions

  Background:

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
    * url baseUrl


    * def offerCode = __arg.offerCode
    * def sku = __arg.sku
    * def frequency = __arg.frequency
    * def frequencyType = __arg.frequencyType
    * def itemQuantity = __arg.itemQuantity
    * def channel = __arg.channel
    * def target = __arg.target

    * def createSubscriptions = read('classpath:karate/payloads/createSubscriptionsWithOfferId.json')

    * createSubscriptions.originOrderId = random1
    * createSubscriptions.channel = channel
    * createSubscriptions.items[0].sku = sku
    * createSubscriptions.items[0].quantity = itemQuantity
    * createSubscriptions.items[0].offer.id = offerCode
    * createSubscriptions.items[0].offer.source = target
    * createSubscriptions.items[0].plan.frequency = frequency
    * createSubscriptions.items[0].plan.frequencyType = frequencyType


  @invalidOfferId
  Scenario: Create a subscription
    Given path 'v1/subscriptions/bulk'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request createSubscriptions
    When method post
    Then status 400
    And print response
    And assert response.responseStatus == "BAD_REQUEST"
    And assert response.message == "Request failed"
    And assert response.data[0].errorCode == "INVALID_OFFERCODE"


    @validDetails
    Scenario: Create a subscription
    Given path 'v1/subscriptions/bulk'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request createSubscriptions
    When method post
    Then status 200
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data.id != null || response.data.id != ""
    And assert response.data.subscriptions[0].customer.status != null || response.data.subscriptions[0].customer.status != ''
    And assert response.data.subscriptions[0].customer.lastName != null || response.data.subscriptions[0].customer.lastName != ''
    And assert response.data.subscriptions[0].customer.firstName != null || response.data.subscriptions[0].customer.firstName != ''
    And assert response.data.subscriptions[0].customer.email != null || response.data.subscriptions[0].customer.email != ''
    And assert response.data.subscriptions[0].customer.locale != null || response.data.subscriptions[0].customer.locale != ''
    And assert response.data.subscriptions[0].id != null
    And assert response.data.subscriptions[0].item.id != null
    And assert response.data.subscriptions[0].item.sku != null
