Feature: Offer finalized
  As offerer
  I want mark the offer as finalized

Background:
  Given I am in the login page
  And I log in account email: "user@gmail.com" and password: "UserPassword123"
  And I go the new offer page
  And create one offer, with title: "Java development" and location: "La Plata"
  When I click link Finalize
  Then should see the title "Finalize Offer"

Scenario: Mark offer finalized with open position
  When I select option "Hiring open"
  And click button Finalize
  Then should see the message "Offer finalized with Hiring open"

Scenario: Mark offer finalized with hiring in site
  When I select option "Hiring in this site"
  And click button Finalize
  Then should see the message "Offer finalized with Hiring in this site"

Scenario: Mark offer finalized with hiring other site
  When I select option "Hiring in other site"
  And click button Finalize
  Then should see the message "Offer finalized with Hiring in other site"
