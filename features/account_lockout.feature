@wip
Feature: Blocked account 
	As user of the site 
	I want to have three chances to type my password, 
	And after that my account will be blocked

Background:
	Given the login page 
	And the account with email: "brianpericon@gmail.com" and password: "Pericon92" 

Scenario: Inserting password incorrectly three times 
	When I insert the email "brianpericon@gmail.com"
	When I insert the password "pericon"
	And login
	Then I should see an error message "Wrong password, you has 2 attemps"
	When I insert the password "Pericon920"
	And login
	Then I should see an error message "Wrong password, you has 1 attemp"
	When I insert the password "Pericon1992"
	And login
	Then I should see an error message "Wrong password, you has no more attemps. Account blocked for 24 hours"
	And my account has to be blocked.