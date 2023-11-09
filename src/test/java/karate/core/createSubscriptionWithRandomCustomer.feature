@Sanity
Feature: Create bulk subscriptions for a particular customer.

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
    * def originOrderId = random()

    * url baseUrl

    * def customer  = call read('classpath:karate/core/createCustomer.feature@validPayload')

    * def CID = customer.response.data.customerReferenceId
    * def firstName = customer.response.data.firstName
    * def lastName = customer.response.data.lastName
    * def email = customer.response.data.email


    * def createSubscriptionsPayload = read('classpath:karate/payloads/createSubscriptions.json')
    * createSubscriptionsPayload.customer.customerReferenceId = CID
    * createSubscriptionsPayload.customer.email = email
    * createSubscriptionsPayload.originOrderId = originOrderId
    * createSubscriptionsPayload.customer.firstName = firstName
    * createSubscriptionsPayload.customer.lastName = lastName

  Scenario: CreateSubscriptionWithRandomCustomer
    Given path 'v1/subscriptions/bulk'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request createSubscriptionsPayload
    When method post
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data.id != null || response.data.id != ""
    And assert response.data.locale != null || response.data.locale != ""
    And assert response.data.subscriptions[0].customer.status != null || response.data.subscriptions[0].customer.status != ''
    And assert response.data.subscriptions[0].customer.lastName != null || response.data.subscriptions[0].customer.lastName != ''
    And assert response.data.subscriptions[0].customer.firstName != null || response.data.subscriptions[0].customer.firstName != ''
    And assert response.data.subscriptions[0].customer.email != null || response.data.subscriptions[0].customer.email != ''
    And assert response.data.subscriptions[0].customer.locale != null || response.data.subscriptions[0].customer.locale != ''
    And assert response.data.subscriptions[0].customer.status != null || response.data.subscriptions[0].customer.status != ''
    And assert response.data.subscriptions[0].customer.lastName == lastName
    And assert response.data.subscriptions[0].customer.firstName == firstName
    And assert response.data.subscriptions[0].customer.email == email
    And assert response.data.subscriptions[0].customer.customerReferenceId == CID

