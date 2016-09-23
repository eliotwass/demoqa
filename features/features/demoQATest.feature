Feature: Register and login to demoqa.com

Scenario: Search for the website        
	Given I am on the demoqa homepage
	When I will click the registration button
	Then I expect to see the registration form
	Then I will fill in the form and click Submit
	And my account is created.
