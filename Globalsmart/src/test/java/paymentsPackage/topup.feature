Feature: Payments system

  Background: 
    * url 'https://dev-customer.swifttech.com.np/api/v1/customer'
    * def verifyPayload = {"credentials" : {"otp": "111111", "transactionPin": "1111"}}
    * def transPayload = {"verify" : {"otp": true, "transactionPin": true}}
    * def pay = {"fromAccountNumber":"L907010010056","fromAccountName":"SAGAR PARAJULI","topupProduct":"NTC","phoneNumber":"9849650000","amount":"10","fromBranchCode":"1","fromBankCode":"1901"}}
    * string payload = pay
    * print payload
    * def preptrans = {"code":"NTPRE"}
    * string prepTrans = preptrans
    * def sagarPayload = {}
    * sagarPayload.transactionPayload = payload
    * sagarPayload.code = 'NTPRE'
    * print sagarPayload

  Scenario: Topup Payments
   
    # Prepare Transaction
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
    # Confirm Transaction
    Given path 'banking/confirm-transaction'
    * transPayload.transactionId = transref
    * transPayload.code = 'NTPRE'
    * print transPayload
    And request transPayload
    And headers head
    When method POST
    Then status 200
    * print response
    # verify process Transaction
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
    * verifyPayload.code = 'NTPRE'
    * print verifyPayload
    And request verifyPayload
    And headers head
    When method POST
    Then status 200
    * print response
    #* def trresp = responseStatus == 200 ? karate.call('fundtransfer.feature') : {}
