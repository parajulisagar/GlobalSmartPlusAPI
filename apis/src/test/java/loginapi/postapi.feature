Feature: Create user using post method in api
Background:
	* url 'https://gorest.co.in'
	* def requestPayload = 
	"""
	{
	"name":"sa",
	"email":"pafsjuijli@gmail.com",
	"gender":"male",
	"status":"active"
	}
	
	"""
Scenario: Create user with given data
Given path '/public/v2/users'
And request requestPayload
And header Authorization = 'Bearer '+ tokenID
When method POST
Then status 201
And match $.id == '#present'