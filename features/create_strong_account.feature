Feature: Create a strong account
  As a user
  I want to the system ask me a strong password
  In order to the system to be safer
  
  Background:
    Given I am in the register page

  Scenario: Create new account ok
    When I fill the name with "Alejandro"
    And I fill the email with "ale@hotmail.com"
    And I fill the password with "Str0ng"
    And I fill the password confirmation with "Str0ng"
    And click in create
    Then I should see "User created"

  @wip
  Scenario: Create new account fail
    When I fill the name with "Alejandro"
    And I fill the email with "ale@hotmail.com"
    And I fill the password with "123"
    And I fill the password confirmation with "123"
    And click in create
    Then I should see "Your password must have at least 6 characters including lowercase, uppercase and numbers."
