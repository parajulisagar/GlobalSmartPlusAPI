Feature: Get all user with query parameter
Scenario: Get all user
Given url baseUrl+'/public/v2/users'
* def query = {status:'active', gender:'male'}
And params query
When method GET
* print response
Then status 200