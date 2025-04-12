Feature: GET user info

  Background:
    * url docuport_base_url
    * header Accept = "application/json"
    * def loginFile = call read('login.feature')
    * print loginFile.accessToken
    Given header Authorization = loginFile.accessToken
    And path "/api/v1/identity/users/me"

    Scenario: GET user information
      #* def loginFile = call read('login.feature')
      #* print loginFile.accessToken
      #Given header Authorization = loginFile.accessToken
      #And path "/api/v1/identity/users/me"
      When method GET

      Then status 200
      * match response.emailAddress == "b1g1_advisor@gmail.com"
      * match response.roles[0] == "Advisor"


      Scenario: PUT to update Phone number
        And header Content-Type = "multipart/form-data"
#        And request {FirstName:"Batch1", LastName: "Group1", PhoneNumber: "5005559876", Extension: "", IsProfilePictureChanged: "false"}
        And request {FirstName: 'Batch1, LastName: 'group1', PhoneNumber: '5005559876', Extension: '', ProfilePicture: '', IsProfilePictureChanged: false}
        When method put

        Then status 200

