Feature: Create user using post method in api

  Background: 
    * url 'https://gorest.co.in'
    * def random_string =
      """
      function(s){
      var text="";
      var pattern  = "ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghijklmnopqrstuvwxyz1234567890"
      for(var i=0; i<s; i++){
      	text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
      	
      	}
      	return text;
      }

      """
    * def ranName = random_string(10)
    * def requestPayload =
      """
      {
      "name":"sapar",
      "gender":"male",
      "status":"inactive"
      }

      """   
      * requestPayload.email = ranName + "@gmail.com"
      * print requestPayload
      

  Scenario: Create user with given data
    Given path '/public/v2/users'
    And request requestPayload
    * print requestPayload
    And header Authorization = 'Bearer '+ tokenID
    When method POST
    Then status 201
    And match $.id == '#present'
