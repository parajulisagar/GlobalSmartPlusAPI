Feature: Payments system

  Background: 
    * url 'https://dev-customer.swifttech.com.np/api/v1/customer'
    * def verifyPayload = {"credentials" : {"otp": "111111", "transactionPin": "1111"}}
    * def transPayload = {"verify" : {"otp": true, "transactionPin": true}}
     * def pay = {"fromAccountNumber":"L907010010056","fromAccountName":"SAGAR PARAJULI","toAccountNumber":"3307010894241","toAccountName":"SHACHIN BAJIMAYA","amount":"500","remarks":"La dai khaja khanu"}
    * string payload = pay
    * print payload
    * def preptrans = {"code":"FEFUND"}
    * string prepTrans = preptrans
    * def sagarPayload = {}
    * sagarPayload.transactionPayload = payload
    * sagarPayload.code = 'FEFUND'
    * print sagarPayload

  Scenario: Topup Payments
    #login part
    #Then print response.lenght
    #* string resp = response
    #Then print resp
    #Then def txt = resp.match('ey.{1,285}')
    #Then print txt
    # Prepare Fundtransfer Transaction
    * print ('Please wait for 15 second')
    * def sleep = function(millis){ java.lang.Thread.sleep(millis) }
* sleep(15000)
    Given path 'banking/prepare-transaction'
    And request sagarPayload
    * head.Authorization = txt[0]
    * print head.Authorization
    * print head
    And headers head
    When method POST
    * string pres = response
    * print pres
    Then string transref = pres.substring(4,40)
    * print transref
    Then string transId = pres.substring(57,67)
    * print transId
    # Confirm Fundtransfer Transaction
    Given path 'banking/confirm-transaction'
     
    * transPayload.transactionId = transref
    * transPayload.code = 'FEFUND'
    * print transPayload
    And request transPayload
    And headers head
    When method POST
    Then status 200
    * print response
    # verify process of fundtransfer Transaction
    Given path 'banking/verify-process-transaction'
    * def reusableOtp =
      """
      function() {
      var JavaDemo = Java.type('java.util.Scanner');
      var ins = java.lang.System.in
      var scanner = new JavaDemo(ins);
      var inputs = scanner.nextLine();
      return inputs
      } 
      """
     * print ('Enter otp:')
    * string mobOtp = reusableOtp()
    * verifyPayload.credentials.otp = mobOtp
    * verifyPayload.transactionId = transref
    * verifyPayload.code = 'FEFUND'
    * print verifyPayload
    And request verifyPayload
    And headers head
    When method POST
    Then status 200
    * print response
