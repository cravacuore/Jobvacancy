Feature: Duplicate Job Offers
  In order to duplicate offers
  As a job offerer
  I want to duplicate an offer
 
  Background:
    Given the account with Name "Gian", email "gianff@gmail.com" and password "Passw0rd"
    Given I am logged in with the email "gianff@gmail.com" and password "Passw0rd"
    And I have an offer in My Offers with Title "Ruby Programmer", Location "Quilmes", Description "", Benefits "None"

  Scenario: Duplicate an offer
    Given I access the My Offers page
      And I duplicate the offer
      And I change the Description with "We love code"
      And I Create the offer
    Then I should see "Offer created"
      And I should have 2 "Ruby Programmer" offers