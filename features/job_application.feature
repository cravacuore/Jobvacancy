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
    Then I should receive a mail with offerer info
  
  @wip
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
    Then I should receive a mail with offerer info