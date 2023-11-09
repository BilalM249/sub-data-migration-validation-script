@Sanity
Feature: Test

  Background:

    * url baseUrl

Scenario: Delete a customer
Given path '/v1/customers/' + __arg.id
And header Content-Type = 'application/json'
And header Authorization = auth
When method delete
Then status 200
And print response
And assert response.responseStatus == "OK"
And assert response.message == "Request processed successfully."
And assert response.data.id != null || response.data.id != ""
