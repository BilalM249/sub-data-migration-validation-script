@Sanity
Feature: Reactivate subscription

  Background:

    * url baseUrl

  @validSubId
  Scenario: Reactivate subscription
    Given path '/v1/subscriptions/' + __arg.id + '/reactivate'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method put
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data.id != null || response.data.id != ""
    And assert response.data.status == "ACTIVE"


  @invalidSubId
  Scenario: Reactivate subscription
    Given path '/v1/subscriptions/' + __arg.id + '/reactivate'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method put
    Then status 404
    And print response
    And assert response.responseStatus == "NOT_FOUND"
    And assert response.message == "Subscription not found"


  @AlreadyActiveSub
  Scenario: Reactivate subscription
    Given path '/v1/subscriptions/' + __arg.id + '/reactivate'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method put
    Then status 400
    And assert response.message == "subscription is not INACTIVE"
    And assert response.responseStatus == "BAD_REQUEST"