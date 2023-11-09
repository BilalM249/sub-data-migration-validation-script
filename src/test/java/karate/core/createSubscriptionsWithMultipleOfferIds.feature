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
    * def createSubscriptions = read('classpath:karate/payloads/createSubscriptionsWithFrequency.json')
    * createSubscriptions.originOrderId = random1
    * createSubscriptions.items[0].offer.id = __arg.offerId
    * createSubscriptions.items[1].offer.id = __arg.offerId

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

