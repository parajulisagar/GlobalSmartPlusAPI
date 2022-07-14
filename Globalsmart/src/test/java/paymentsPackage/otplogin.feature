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
   #OTP PROCESS user
    Given path 'customer-auth/login'
    * def reusableOtp =
      """
      function() {
      var JavaDemo = Java.type('java.util.Scanner');
      var ins = java.lang.System.in
      var scanner = new JavaDemo(ins);
      var inputs = scanner.nextInt();
      return inputs
      } 
      """
      
    * def mobOtp = reusableMethod()
    * reqpayload.otp = mobOtp
    And request reqpayload
    And headers head
    When method POST
    Then status 200
    Then print response
    * def afterOTP = call read('topup.feature')