Feature: Uploading a file
	In order to share a file
	As a user
	I want to upload a file to my storage
	
	
	Scenario: Sad Path
		Given I am on the upload page
		Then I should not see "Upload file"
	
	Scenario: Happy Path
		Given I am on the upload page 
		Then I should see "Upload file"
