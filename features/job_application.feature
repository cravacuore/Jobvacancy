Feature: Job Application
  In order to get a job
  As a candidate
  I want to apply to an offer

  Background:
  	Given only a "Web Programmer" offer exists in the offers list

  Scenario: Apply to job offer
    Given I access the offers list page
    When I apply
    Then I should put "Gian Franco Fioriello" , "gf.fioriello@gmail.com" and "http://linck-to-my-cv.html"
  
  @wip
  Scenario: Apply to job offer
    Given I access the offers list page
    And put "Gian Franco Fioriello" , "gf.fioriello@gmail.com" and "http://linck-to-my-cv.html"
    When I apply
    Then I should receive a mail with offerer info