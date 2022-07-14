Feature: dynamic otp

  Scenario: dynamic otp get from user
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
    * def sppp = reusableOtp()
    * print sppp
