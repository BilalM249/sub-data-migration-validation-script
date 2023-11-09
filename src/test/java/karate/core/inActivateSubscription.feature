@Sanity
Feature: deactivate Subscription

  Background:

    * url baseUrl


  @success
  Scenario: deactivate Subscription
    Given path 'v1/subscriptions/' +  __arg.id + "/inactive"
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request { "cancelationReason": { "reason":'#(__arg.reason)', "code": '#(__arg.code)' } }
    When method put
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data.status == "INACTIVE"

    @invalidSubId
    Scenario: deactivate Subscription
      Given path 'v1/subscriptions/' +  __arg.id + "/inactive"
      And header Content-Type = 'application/json'
      And header Authorization = auth
      And request { "cancelationReason": { "reason":'#(__arg.reason)', "code": '#(__arg.code)' } }
      When method put
      Then status 404
      And print response
      And assert response.responseStatus == "NOT_FOUND"
      And assert response.message == "Subscription not found"



      @AlreadyInactiveSub
      Scenario: deactivate Subscription
        Given path 'v1/subscriptions/' +  __arg.id + "/inactive"
        And header Content-Type = 'application/json'
        And header Authorization = auth
        And request { "cancelationReason": { "reason":'#(__arg.reason)', "code": '#(__arg.code)' } }
        When method put
        Then status 400
        And print response
        And assert response.responseStatus == "BAD_REQUEST"
        And assert response.message == "Subscription is not ACTIVE"