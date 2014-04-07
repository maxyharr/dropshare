Feature: Blocking a user from viewing or downloading files
	 In order to stop a person from seeing my file
	 As a user
	 I want to block a user
	
	Scenario: Sad Path
		  Given I have blocked a user2 
		  Then that user shouldn't be able so see my file
	Scenario: Happy Path
		  Given I have blocked a user2 
		  Then that user shouldn't be able so see my file	