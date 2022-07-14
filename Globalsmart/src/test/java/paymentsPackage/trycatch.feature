Feature: calling

  Background: 
    * url 'https://dev-customer.swifttech.com.np/api/v1/customer'

  Scenario: Login scenario
  * def log = call read('login.feature')
    #login user
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
   * def result = reslen == '' ? {} : karate.call('fundtransfer.feature')
