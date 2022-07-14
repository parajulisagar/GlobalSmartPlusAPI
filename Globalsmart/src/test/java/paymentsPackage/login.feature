Feature: calling

  Background: 
    * url 'https://dev-customer.swifttech.com.np/api/v1/customer'
    * def reqpayload =
      """
      {
      'username':'parajuli.sagar1998@gmail.com',
      'password':'autoTest@0110'
      }
      """
    * def head =
      """
      {
      'Content-Type' : 'application/json',
      'Connection' : 'keep-alive',
      'channel' : 1
      }
      """

  Scenario: Login scenario
    #login user
    Given path 'customer-auth/login'
    And request reqpayload
    And headers head
    When method POST
    Then status 200
    * def resLen = response.length
    * print resLen
    * string resp = response
    Then print resp
    Then def txt = resp.match('ey.{1,285}')
    Then print txt
    * def result = resLen == 48 ? karate.call('otplogin.feature') : {}
    * def fun =
      """
      function() {
        try {
          var result = karate.call('topup.feature') 
        } catch (e) {
          return e;
        }
      }
      """
    * def sagar = fun()
    * string reslen = sagar
    * print reslen
    * def result = reslen == '' ? karate.call('fundtransfer.feature') : karate.call('fundtransfer.feature')
