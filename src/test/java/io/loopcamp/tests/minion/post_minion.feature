#  Scenario:
#  Given content type is json
#  And accept type is json
#  And body is name=karate, gender=Male, phone=1231231234
#  Then I send Post request to /minions
#  Then status code is 201
#  And id is a number
#  And success is "A Minion is Born!"
#  And name is karate


  Feature: Add new minion

    Background:
      Given url minion_base_url
      And header Accept = "application/json"

    Scenario: Post new minion
      And header Content-Type = "application/json"
      #and().body("reqBody")
      And request { name: 'Karate', gender: 'Male',  phone: 1231231234 }
      And path '/minions'
      When method post

      # Validate POST request with its own with Response Body
      Then status 201
      #* match foo == '#string'
      * def minionID = response.data.id
      * match minionID == '#number'
      * match response.success == "A Minion is Born!"
      * match response.success == "#string"
      * match response.data.name == "Karate"
      * match response.data.name == "#string"




      # Validate POST request with another GET request
      And header Accept = "application/json"
      #And path "/minions/" + 137
      And path "/minions/" + minionID
      When method get
      And print minionID

      Then status 200
      #And match response == { id:137, name:"Karate", gender:"Male", phone:"1231231234"}
      And match response == { id:#(minionID), name:"Karate", gender:"Male", phone:"1231231234"}



      # Clean up the test
      And path "/minions/" + minionID
      When method delete
      Then status 204

      # validate with GET method if it was deleted
      And path "/minions/" + minionID
      When method get
      Then status 404
      And match response.error == "Not Found"








