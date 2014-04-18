Feature: Group Facebook friends
	 In order to share a file with a group of friends
	 As a user
	 I want to select friends and make them into a group

	 Background: Start logged in and on wall
	 	     Given I am signed in with Facebook
		     Given I am on the Feed page
		     Then I should see "new group"
	 	     
	 Scenario: A user successfully creates a group of friends (happy path)
	 	   When I follow "new group"
		   Then I should see a list of my friends
		   When I fill in "group name" with "testing group"
		   And I press "create group"
		   Then I should see "testing group"

	Scenario: A user unsuccessfully creates a group of friends (sad path)