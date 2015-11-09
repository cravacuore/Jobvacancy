
Feature: Job offers search
  As user of the site
  I want to search offers job in based on all fields
  For have more usability

  Background:
    Given that Offers Job should have at least one offer

  Scenario: Search in field Location
    Given one offer that contains "Programmer Ruby" in Title, "Quilmes" in Location and "Good ambient job" in Description
    When I search "Quilmes"
    Then I should see this offer with Location "Quilmes"


  Scenario: Search in field Description
    Given one offer that contains "Programmer Ruby" in Title, "Quilmes" in Location and "Good ambient job" in Description
    When I search "ambient" 
    Then I should see this offer with Description containing "ambient"

  Scenario: Search in field Title
    Given one offer that contains "Programmer Ruby" in Title, "Quilmes" in Location and "Good ambient job" in Description
    When I search "Ruby"
    Then I should see this offer with Title containing "Ruby"