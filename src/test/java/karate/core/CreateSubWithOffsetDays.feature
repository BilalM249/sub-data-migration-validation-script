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
    * def createSubscriptionsWithOffset = read('classpath:karate/payloads/createSubscriptionWithOffsetDays.json')
    * createSubscriptionsWithOffset.originOrderId = random1
    * createSubscriptionsWithOffset.items[0].sku = __arg.sku
    * createSubscriptionsWithOffset.items[0].plan.frequency = __arg.frequency
    * createSubscriptionsWithOffset.items[0].plan.frequencyType = __arg.frequencyType

  @success
  Scenario: Create a subscription
    Given path 'v1/subscriptions/bulk'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request createSubscriptionsWithOffset
    When method post
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data.id != null || response.data.id != ""
    And assert response.data.subscriptions[0].item.id != null || response.data.subscriptions[0].item.id != ""
    And assert response.data.subscriptions[0].customer.status != null || response.data.subscriptions[0].customer.status != ''
    And assert response.data.subscriptions[0].customer.lastName != null || response.data.subscriptions[0].customer.lastName != ''
    And assert response.data.subscriptions[0].customer.firstName != null || response.data.subscriptions[0].customer.firstName != ''
    And assert response.data.subscriptions[0].customer.email != null || response.data.subscriptions[0].customer.email != ''
    And assert response.data.subscriptions[0].customer.locale != null || response.data.subscriptions[0].customer.locale != ''
