# Given url is.........
# When I send GET request
# Then status code is 2000
# And in response body message is "Hello World!"
# And response header Content-Type is "application/json"
 Feature: Hello world feature

  Scenario: User is able to see hello world greeting

   # Send request to given url and validate status code
   #Given url 'https://sandbox.api.service.nhs.uk/hello-world/hello/world'
   Given url hello_world_api_url
   When method get
   Then status 200


   # Verify JSON response body -- >  response.path("message"); ---> "Hello World!"
   And match response.message == "Hello World!"


   # Validate Response Header
     # exact match
   Then match header Content-Type == 'application/json; charset=UTF-8'
    # 'contains'
   Then match header Content-Type contains 'application/json'
   And match header Content-Length == '32'

