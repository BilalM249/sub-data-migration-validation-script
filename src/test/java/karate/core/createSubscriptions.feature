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

    * def createSubscriptions = read('classpath:karate/payloads/createSubscriptions.json')
    * createSubscriptions.originOrderId = random1

    * def creatSubscriptionsWithoutPlansPayload = read('classpath:karate/payloads/createSubscriptionsWithoutFrequency.json')
    * creatSubscriptionsWithoutPlansPayload.originOrderId = random1

    * def offerApplicableSubscriptionPayload = read('classpath:karate/payloads/CreateSubsOfferApplicable.json')
    * offerApplicableSubscriptionPayload.originOrderId = random1

    * def validInvalidOfferCodePayload = read('classpath:karate/payloads/createSubscription_valid_invalid_offerCode.json')
    * validInvalidOfferCodePayload.originOrderId = random1

  @WithoutPlans
  Scenario: Create a subscription
    Given path 'v1/subscriptions/bulk'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request creatSubscriptionsWithoutPlansPayload
    When method post
    Then status 400
    And print response
    And assert response.responseStatus == "BAD_REQUEST"
    And assert response.data.details[0].type == "any.required"
    And assert response.data.details[0].message == "\"items[0].plan\" is required"
    And assert response.data.details[0].context.label == "items[0].plan"


  @AllFieldsPresent
  Scenario: Create a subscription
    Given path 'v1/subscriptions/bulk'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request createSubscriptions
    When method post
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data.id != null || response.data.id != ""
    And assert response.data.subscriptions[0].customer.status != null || response.data.subscriptions[0].customer.status != ''
    And assert response.data.subscriptions[0].customer.lastName != null || response.data.subscriptions[0].customer.lastName != ''
    And assert response.data.subscriptions[0].customer.firstName != null || response.data.subscriptions[0].customer.firstName != ''
    And assert response.data.subscriptions[0].customer.email != null || response.data.subscriptions[0].customer.email != ''
    And assert response.data.subscriptions[0].customer.locale != null || response.data.subscriptions[0].customer.locale != ''


    @OfferApplicableSubscription
    Scenario: Create a subscription
      Given path 'v1/subscriptions/bulk'
      And header Content-Type = 'application/json'
      And header Authorization = auth
      And request offerApplicableSubscriptionPayload
      When method post
      Then status 200
      And print response
      And assert response.responseStatus == "OK"
      And assert response.message == "Request processed successfully."
      And assert response.data.id != null || response.data.id != ""
      And assert response.data.subscriptions[0].customer.status != null || response.data.subscriptions[0].customer.status != ''
      And assert response.data.subscriptions[0].customer.lastName != null || response.data.subscriptions[0].customer.lastName != ''
      And assert response.data.subscriptions[0].customer.firstName != null || response.data.subscriptions[0].customer.firstName != ''
      And assert response.data.subscriptions[0].customer.email != null || response.data.subscriptions[0].customer.email != ''
      And assert response.data.subscriptions[0].customer.locale != null || response.data.subscriptions[0].customer.locale != ''



  @ValidInvalidOfferApplicableSubscription
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