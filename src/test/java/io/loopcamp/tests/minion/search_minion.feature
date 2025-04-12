#  Scenario: Search for minion using query params
#
#  Given base url is set
#  And accept type is json
#  And query param gender is Female
#  And query param nameContains is a
#  When I send get request to /minions/search
#  Then status code is 200
#  And content type is json
#  And total Element is 33
#  And first minion name is Paige
#  And "Lorenza, Nona, Elizabeth" are among the names


Feature: Search minion with query params

  Scenario: Search for minion with query params

    #'http://3.86.36.108:8000/api'
    Given url minion_base_url
    And header Accept = "application/json"
    # .queryParam("key1", "value1")
    # .queryParam("key2", "value2")
    # .queryParams("key1", "value1", "key2", "value2",)

    #And param gender  = "Female"
    #And param nameContains  = "a"
    And params {gender: "Female", nameContains: "a"}

    And path "/minions/search"
    When method get
    Then status 200
    And match header Content-type == "application/json"
    #Then match header Content-Type contains 'application/json'

    And match response.totalElement == 33

    #response.path(content[0].name)
    * match response.content[0].name == "Paige"
    * match response.content[0].id == 4

    # assertThat (content.name, hastItems ("Lorenza", "Nona", "Elizabeth"))
    #* print response
    #* match response.content.name contains "Lorenza" -- > not correct syntax
    * match response.content[*].name contains "Lorenza"
    * match response.content[*].name contains any ["Lorenza", "Nona", "Elizabeth"]


    #---------------------------------------------------------------------------------------
    * print response.content[0].name
    * def firstMinionName = response.content[0].name
    # + concatenation put NONE
    * print "First minion name after assigning to variable:" +          firstMinionName
    # , concatenation put ONE
    * print "First minion name after assigning to variable:",    firstMinionName

    * print "After toLowerCase: " + karate.lowerCase(firstMinionName)

    # check if all the gender is Female
    And match each response.content[*].gender == "Female"

    #* def allGenders = response.content[*].gender --- >  fails when assigning the list into a variable
    * def allGenders = $.content[*].gender
    And match each allGenders == "Female"












