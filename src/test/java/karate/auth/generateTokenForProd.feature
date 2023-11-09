Feature: Generate S2S token

  Background:

    * url identity_endpoint

  Scenario: Get Auth Token

    Given path '/oauth2/aus5ncdgsce0GMCXh697/v1/token'
    And param grant_type = "client_credentials"
    And param client_id = "0oa6i3u9bpveOZMeK697"
    And param client_secret = "kIjHo0kxTsHk3PHsU7mwTnRFQaGlkk5oBRY6TByKwvZqJjQxLI9iwzNvcZGkSfZT"
    And param scope = "s2s"
    And header Content-Type = 'application/x-www-form-urlencoded'
    And header accept = 'application/json'
    And header Cookie = 'JSESSIONID=469B02F62C8D32D84BC83D167192BF15'
    When method post
    Then status 200