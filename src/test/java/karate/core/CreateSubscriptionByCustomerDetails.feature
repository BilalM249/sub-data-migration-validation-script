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
    * def originOrderId = random()

    # payload for single SKU
    * def createSubscriptionsPayload = read('classpath:karate/payloads/createSubscriptions.json')
    * createSubscriptionsPayload.customer.customerReferenceId = __arg.CID
    * createSubscriptionsPayload.customer.email = __arg.email
    * createSubscriptionsPayload.originOrderId = __arg.originOrderId
    * createSubscriptionsPayload.customer.firstName = __arg.firstName
    * createSubscriptionsPayload.customer.lastName = __arg.lastName
    * createSubscriptionsPayload.items[0].sku = __arg.sku
    * createSubscriptionsPayload.originOrderId = originOrderId

    # payload for multiple
    * def create_sub_multi_sku_payload = read('classpath:karate/payloads/createSubscriptionsWith2SKUS.json')
    * create_sub_multi_sku_payload.customer.customerReferenceId = __arg.CID
    * create_sub_multi_sku_payload.customer.email = __arg.email
    * create_sub_multi_sku_payload.originOrderId = __arg.originOrderId
    * create_sub_multi_sku_payload.customer.firstName = __arg.firstName
    * create_sub_multi_sku_payload.customer.lastName = __arg.lastName
    * create_sub_multi_sku_payload.items[0].sku = __arg.sku
    * create_sub_multi_sku_payload.items[1].sku = __arg.sku1
    * create_sub_multi_sku_payload.originOrderId = originOrderId


  @single-sku-success
  Scenario: Create subscription
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


  @multiple-sku-success
  Scenario: Create subscription
    Given path 'v1/subscriptions/bulk'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request create_sub_multi_sku_payload
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
