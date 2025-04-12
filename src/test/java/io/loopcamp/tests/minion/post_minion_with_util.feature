Feature: Add new minion

  Background:
    Given url minion_base_url
    And header Accept = "application/json"

  Scenario: Post new minion
    And header Content-Type = "application/json"

    * def apiUtil = Java.type('io.loopcamp.utils.APIUtils')
    * def randomName = apiUtil.randomName()
    #* print randomName

    And request { name: #(randomName), gender: 'Male',  phone: 1231231234 }
    And path '/minions'
    When method post

      # Validate POST request with its own with Response Body
    Then status 201
    * def minionID = response.data.id
    * print response.data.name
    * print minionID

    # Clean up the test
    And path "/minions/" + minionID
    When method delete
    Then status 204