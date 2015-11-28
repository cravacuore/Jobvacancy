@wip
Feature: Offer finalized
  As offerer
  I want mark the offer as finalized

Background:
  Given I go the login page
  And I log in account email: "brian@gmail.com" and password: "Pericon92"
  And I go the new offer page
  And create one offer, with title: "Java development" and location: "La Plata"

Scenario: Mark offer finalized with open position
  Given I access the my offers page
  When I press button Finalize in the offer "Java development"
  Then the offer show one column of name "Reason of finalize"
  When I select option "Hiring open"
  Then should see the message "Your offer finalized with open position"

Scenario: Mark offer finalized with hiring in site
  Given I access the my offers page
  When I press button Finalize in the offer "Java development"
  Then the offer show one column of name "Reason of finalize"
  When I select option "Hiring in this site"
  Then should see the message "Your offer finalized by hiring in site"

Scenario: Mark offer finalized with hiring other site
  Given I access the my offers page
  When I press button Finalize in the offer "Java development"
  Then the offer show one column of name "Reason of finalize"
  When I select option "Hiring in other site"
  Then should see the message "Your offer finalized by hiring to other site"
