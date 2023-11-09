@Sanity
Feature: Get Subscription by subscriptionId

  Background:

    * url baseUrl

  @validSubId
  Scenario: Get Subscription
    Given path '/v1/subscriptions/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
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
    And assert response.data.subscription.plan != null
    And assert response.data.subscription.plan != null
    And assert response.data.subscription.item != null
    And assert response.data.subscription.shipping != null
    And assert response.data.subscription.status == "ACTIVE"

  @orch_FailedScenarios
  Scenario: Get Subscription
    Given path '/v1/subscriptions/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data.id != null || response.data.id != ""
    And assert response.data.subscription.status == 'INACTIVE'
    And assert response.data.subscription.customer.lastName != null || response.data.subscription.customer.lastName != ''
    And assert response.data.subscription.customer.firstName != null || response.data.subscription.customer.firstName != ''
    And assert response.data.subscription.customer.email != null || response.data.subscription.customer.email != ''
    And assert response.data.subscription.customer.locale != null || response.data.subscription.customer.locale != ''
    And assert response.data.subscription.plan != null
    And assert response.data.subscription.plan != null
    And assert response.data.subscription.item != null
    And assert response.data.subscription.shipping != null

  @invalidSubId
  Scenario: Get Subscription
    Given path '/v1/subscriptions/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 400
    And print response
    And assert response.responseStatus == "BAD_REQUEST"
    And assert response.message == "Invalid subscription id"



  @validSubId_inActiveSub
  Scenario: Get Subscription
    Given path '/v1/subscriptions/' + __arg.id
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
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
    And assert response.data.subscription.plan != null
    And assert response.data.subscription.plan != null
    And assert response.data.subscription.item != null
    And assert response.data.subscription.shipping != null
    And assert response.data.subscription.status == "INACTIVE"