Feature: Uploading a file
	In order to share a file
	As a user
	I want to upload a file to my storage
	
	
	Scenario: Sad Path
		Given I am on the upload page
		Then I should not see Upload file
	
	Scenario: Happy Path
		Given I am on the Upload page 
		Then I should see Upload file
		When i press Upload file
		Then I should see my file explorer
		When I choose a file
		Then I should see it in my storage
