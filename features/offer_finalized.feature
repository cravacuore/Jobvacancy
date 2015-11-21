Feature: Offer finalized
	As offerer
	I want mark the offer as finalized

Background:
	Given I go the login page
	And I log in account email: "brianpericon@gmail.com" and password: "Pericon92"
	And I go the new offer page
	And create one offer, with title: "Java development" and location: "La Plata"

Scenario: Mark offer as finalized
	Given I access the my offers page
	When I press button Finalize in the offer "Java development"
	Then the public can not see the offer "Java development"