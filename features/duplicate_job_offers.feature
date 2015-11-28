@wip
Feature: Duplicate Job Offers
  In order to duplicate offers
  As a job offerer
  I want to duplicate an offer

  Background:
    Given the account with Name "Gian", email "gianff@gmail.com" and password "Passw0rd"
    Given I am logged in with the email "gianff@gmail.com" and password "Passw0rd"
    And I have an offer in My Offers with Title "Programmer vacancy", Location "Quilmes", Description "", Benefits "Gym"

  Scenario: Duplicate an offer
    Given I access the My Offers page
    Then I should see a button "Duplicate"

  Scenario: Duplicating an offer
    Given I access the My Offers page
    And I duplicate the offer
    Then I should see in Title "Programmer vacancy"
    Then I should see in Location "Quilmes"
    Then I should see in Description ""
    Then I should see in Benefits "Gym"
    Given I set Description to "Programmer vacancy!!!"
    Given confirm the new offer
    Then I should see "Offer created"
