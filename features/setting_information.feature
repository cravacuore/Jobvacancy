Feature: Setting candidate information 
  As a person that is looking for apply to a job
  When I apply to an offer
  I want to put my name , mail and link to my cv.

  Background:
  	Given only a "Web Programmer" offer exists in the offers list

  Scenario: Apply to job offer
    Given I access the offers list page
    When I apply
    Then I should put "Gian Franco Fioriello" , "gf.fioriello@gmail.com" and "http://linck-to-my-cv.html"
     