Feature: Job Application
  In order to get a job
  As a candidate
  I want to apply to an offer

  Background:
  	Given only a "Web Programmer" offer exists in the offers list

  Scenario: Complete job offer fields
    Given I access the offers list page
    When I apply
    Then I should put "gf.fioriello@gmail.com", "Gian Franco Fioriello" and "http://linck-to-my-cv.html"

  Scenario: Incomplete job offer fields
    Given I access to the offer page
    And put "", "" and ""
    When apply
    Then I should see an error mesagge "All fields are mandatory"

  Scenario: Complete only one job offer field
    Given I access to the offer page
    And put "pepe@pepe.com", "" and ""
    When apply
    Then I should see an error mesagge "All fields are mandatory"

  Scenario: Complete only two job offer fields
    Given I access to the offer page
    And put "pepe@pepe.com", "Pepe" and ""
    When apply
    Then I should see an error mesagge "All fields are mandatory"

  Scenario: Bad complete job offer mail field
    Given I access to the offer page
    And put "bad email adress", "Pepe" and "http://pepe-cv.html"
    When apply
    Then I should see an error mesagge "Wrong email adress"

  Scenario: Apply to job offer
    Given I access to the offer page
    And put "applicant@test.com", "Gian Franco Fioriello" and "http://linck-to-my-cv.html"
    When apply
    Then I should receive a mail with offerer info

  Scenario: Apply to job offer
    Given I access to the offer page
    And put "applicant@test.com", "Gian Franco Fioriello" and "http://linck-to-my-cv.html"
    When apply
    Then I should receive a mail with my info
