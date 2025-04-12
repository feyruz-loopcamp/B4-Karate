Feature: Get a ticket for Advisor

  Background:
    * url  docuport_base_url
    * header Accept = "application/json"

  Scenario: Get token for advisor role with POST request
    #* url  docuport_base_url
    And header Content-Type = "application/json"
    #And request {usernameOrEmailAddress: #(varName), password: ""}
    And request {usernameOrEmailAddress: "b1g1_advisor@gmail.com", password: "Group1"}
    And path "/api/v1/authentication/account/authenticate"
    When method post


    Then status 200
    And match header Content-Type contains "application/json"
    * def accessToken = "Bearer " + response.user.jwtToken.accessToken
    #* print "This is Bearer Token:", accessToken

