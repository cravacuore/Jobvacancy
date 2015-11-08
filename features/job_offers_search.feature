
Feature: Job offers search
  As user of the site
  I want to search offers job in based on all fields
  For have more usability

  Background:
    Given that Offers Job should have at least one offer

  Scenario: Search in field Location
    Given one offer that contains "Programmer Ruby" in Title and "Quilmes" in Location
    When I search "Quilmes"
    Then I should see this offer with Location "Quilmes"

@wip
  Scenario: Search in field Description
    Given one offer that contains 'ambiente' in field Description
    And in no other field no contains 'ambiente'
    When I search 'ambiente' 
    Then show this offer