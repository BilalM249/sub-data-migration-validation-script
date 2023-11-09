@Sanity
Feature: Create customer

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
    * def firstName = "automation" + random1
    * def lastName = "automation" + random1
    * def email = "JBM" + random1 + "@gmail.com"

  @validPayload
  Scenario: Create a customer
    Given path '/v1/customers'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    And request { "customerReferenceId": '#(random1)', "locale": "fr_CAB", "email": "#(email)", "contactNumber": "123123123", "firstName": "#(firstName)", "lastName": "#(lastName)", "middleName": "JJ", "segment": [ "employee" ], "employeeId": "345", "communicationPreference": { "email": true, "SMS": true } }
    When method post
    Then status 200
    And print response
    And assert response.responseStatus == "OK"
    And assert response.message == "Request processed successfully."
    And assert response.data.id != null || response.data.id != ""
    And assert response.data.locale != null || response.data.locale != ""
    And assert response.data.email != null || response.data.email != ""
    And assert response.data.firstName != null || response.data.firstName != ""
    And assert response.data.middleName != null || response.data.middleName != ""
    And assert response.data.lastName != null || response.data.middleName != ""
    And assert response.data.email == email
    And assert response.data.firstName == firstName
    And assert response.data.lastName == lastName


    @invalidPayload
    Scenario: Create a customer
      Given path '/v1/customers'
      And header Content-Type = 'application/json'
      And header Authorization = auth
      And request { "locale": "fr_CAB", "email": "#(email)", "contactNumber": "123123123", "firstName": "#(firstName)", "lastName": "#(lastName)", "middleName": "JJ"}
      When method post
      Then status 400
      And print response
      And assert response.responseStatus == "BAD_REQUEST"
      And assert response.message == "\"customerReferenceId\" is required"


    @duplicateEmailAddress
    Scenario: Create a customer
      Given path '/v1/customers'
      And header Content-Type = 'application/json'
      And header Authorization = auth
      And request { "customerReferenceId": "612321911271", "locale": "fr_CAB", "email": "JBM4@mail.com", "contactNumber": "123123123", "firstName": "Bilal5", "lastName": "M5", "middleName":"JJ", "segment": [ "employee"], "employeeId": "345", "communicationPreference":{ "email":true, "SMS":true } }
      When method post
      Then status 400
      And print response
      And assert response.responseStatus == "BAD_REQUEST"
      And assert response.message == "Customer already exist"


    @duplicateCustomerRefId
    Scenario: Create a customer
      Given path '/v1/customers'
      And header Content-Type = 'application/json'
      And header Authorization = auth
      And request { "customerReferenceId": "612321911271", "locale": "fr_CAB", "email": "JBM4@mail.com", "contactNumber": "123123123", "firstName": "Bilal5", "lastName": "M5", "middleName":"JJ", "segment": [ "employee"], "employeeId": "345", "communicationPreference":{ "email":true, "SMS":true } }
      When method post
      Then status 400
      And print response
      And assert response.responseStatus == "BAD_REQUEST"
      And assert response.message == "Customer already exist"