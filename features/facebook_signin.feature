Feature: Signing in to DropShare with Facebook
	In order to log into DropShare
	As a user
	I want to log in with my Facebook account
	
	
  Scenario: A user successfully signs in with facebook
      Given I am on the homepage
      When I sign in with facebook
      And I go to the home page
      Then I should be on the feed page