Feature: Blocked account 
	As user of the site 
	I want to have three chances to type my password, 
	And after that my account will be blocked

Background:
	Given the account with name "Brian" with email: "brianpericon@gmail.com" and password: "Pericon92" 

Scenario: Inserting password incorrectly three times 
  Given the login page
	When I insert the email "brianpericon@gmail.com"
	When I insert the password "pericon"
	And login
	Then I should see an error message "Wrong password. You have 2 attempts more"
	When I insert the email "brianpericon@gmail.com"
	When I insert the password "Pericon"
	And login
	Then I should see an error message "Wrong password. You have 1 attempts more"
	When I insert the email "brianpericon@gmail.com"
	When I insert the password "pericon1"
	And login
	Then I should see an error message "Account has been blocked for 24 hours"
