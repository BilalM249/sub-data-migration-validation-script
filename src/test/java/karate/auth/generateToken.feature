Feature: Generate S2S token

  Background:

    * url identity_endpoint

  Scenario: Get Auth Token

    Given path '/oauth2/aus1z780v7mcf1Ff5697/v1/token'
    And param grant_type = "client_credentials"
    And param client_id = "0oa5hzmrybx0dGt6Z697"
    And param client_secret = "VX3dxj6yo0eG1vxGdQCqiYyt7qcI0yzqCTc_yfkI"
    And param scope = "s2s"
    And header Content-Type = 'application/x-www-form-urlencoded'
    And header Cookie = "JSESSIONID=9269E58C9C32C1FBF8AB42D21B0DB2B5; JSESSIONID=9BD40CE6E87847CE5136F0812D3E157B"
    When method post
    Then status 200