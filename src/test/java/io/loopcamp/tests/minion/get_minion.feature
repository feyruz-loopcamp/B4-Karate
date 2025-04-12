# Given base url is .....
# And header accept type is json
# When I send GET request to /minions
# Then status code should be 200
# And content type should be application json
# And print the response

  Feature: Minion Rest Api: get all and single minions test

    Background: Get base URL
      #Given url 'http://3.86.36.108:8000/api'
      Given url minion_base_url
      And header Accept = 'application/json'

    Scenario: Get all minions
      And path '/minions'
      When method get
      Then status 200
      And header Content-Type = 'application/json'
      And print response


#    Scenario: Get single minion and verify data
#
#      Given base url is set
#      And accept type is json
#      And path param id is 2
#      When I send get request to /minions/{id}
#      Then status code is 200
#      And content type is json
#      And body
#         {
#             "id" is 2,
#             "name" is "Nels",
#             "gender  is "Male",
#             "phone" is "4218971348"
#         }


    Scenario: Get single minion and verify data

      #And path single_minion_path_param
      #And path '/minions', '/2'
      #And path '/minions/', 2
      And path '/minions/2'
      When method get
      Then status 200
      #And match header Content-Type == 'application/json'
      And header Content-Type = 'application/json'
      #And print response

      # Option 1
      And match response.id == 2
      And match response.name == "Nels"
      And match response.gender == 'Male'
      And match response.phone == '4218971348'

      # Option 2
      Then match response ==
      """
        {
          id:2,
          name:"Nels",
          gender:"Male",
          phone:"4218971348"
        }
      """

      #Option 3
      Then match response == { id:2, name:"Nels", gender:"Male", phone:"4218971348"}


