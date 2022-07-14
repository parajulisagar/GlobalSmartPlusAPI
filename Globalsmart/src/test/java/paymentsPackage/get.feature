Feature: get value from console

  Scenario: Value
    #* def reusableMethod() =
      #"""
      #function() { 
      #var scanner = Java.util.*;
      #var in = java.lang.System.in()
      #var jd = new scanner(in);
     #var inputs = jd.read()
  #
      #} 
      #"""
      
     
   * def reusableMethod = 
   """ 
   function() { 
    var sc = Java.util.Scanner;
    var scc = new sc();
   var a = scc.nextInt();
   return a 
   } 
   """
   * def sagar = reusableMethod()
   * print sagar
    * def sleep = function(millis){ java.lang.Thread.sleep(millis) }
    * sleep(1000000)
    * string reslen = sagar
    * print sagar
