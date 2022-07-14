Feature: Rest api feature
Scenario: Get user data scenario
Given url baseUrl+'/public/v2/users'
And path '30'
When method GET
Then status 200
* def jsonResponse = response
* def name = jsonResponse.name
* print name
* def gender = jsonResponse.gender
* print gender
* def email = jsonResponse.email
* print email
* def status = jsonResponse.status
* print status




Scenario: Get invalid user data scenario
Given url baseUrl+'/public/v2/users'
And path '0'
When method GET
Then status 404