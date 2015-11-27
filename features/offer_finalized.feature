Feature: Offer finalized
  As offerer
  I want mark the offer as finalized

Background:
  Given I go the login page
  And I log in account email: "brian@gmail.com" and password: "Pericon92"
  And I go the new offer page
  And create one offer, with title: "Java development" and location: "La Plata"

Scenario: Mark offer as finalized
  Given I access the my offers page
  When I press button Finalize in the offer "Java development"
  Then the offer show one column of name "Reason of finalize"

Scenario: Mark offer finalized why the open position
  Given I access the my offers page
  When I press button "Open position" in the offer "Java development"
  Then should see the message "Your offer finalized for open position"

Scenario: Mark offer finalized why hired in site
  Given I access the my offers page
  When I press button "Hired in site" in the offer "Java development"
  Then should see the message "Your offer finalized for hired in site"

Scenario: Mark offer finalized why hired out site
  Given I access the my offers page
  When I press button "Hired out site" in the offer "Java development"
  Then should see the message "Your offer finalized for hired out site"
