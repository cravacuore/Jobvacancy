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

  @wip
  Scenario: Bad complete job offer mail field
    Given I access the offers list page
    When I apply
    And put "gf.fioriello @ gmail.com", "Gian Franco Fioriello"
    Then I should see "All fields are mandatory"

  Scenario: Apply to job offer
    Given I access to the offer page
    And put "gf.fioriello@gmail.com", "Gian Franco Fioriello" and "http://linck-to-my-cv.html"
    When apply
    Then I should receive a mail with offerer info

  @wip  
  Scenario: Apply to job offer
    Given I access to the offer page
    And put "gf.fioriello@gmail.com", "Gian Franco Fioriello" and "http://linck-to-my-cv.html"
    When apply
    Then I should receive a mail with offerer info and candidate info
