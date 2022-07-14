Feature: Get API header feature
Scenario: Pass the user request with header
Given header Except = '100-continue'
When url baseUrl+'/public/v2/users'
And path 30
When method GET
Then status 200
* print response

Scenario: Pass the user request with header
* def aheader = {Except: '100-continue'}
Given headers aheader
When url baseUrl+'/public/v2/users'
And path 30
When method GET
Then status 200
* print response

Scenario: Pass the user request with configure header
* configure headers = {Except: '100-continue'}
When url baseUrl+'/public/v2/users'
And path 30
When method GET
Then status 200
* print response