Feature: Reports
  As administrator
  I want to get a report of the offers amount finalized separated for the type close

Background:
  Given I am in the login page
  And I log in account email: "admin@admin.com" and password: "Admin123"
  And various offers finalized

Scenario: To get report
  Given the offers page
  When press button Report
  Then obtain a report