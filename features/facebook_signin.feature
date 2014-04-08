Feature: Signing in to DropShare with Facebook
	In order to log into DropShare
	As a user
	I want to log in with my Facebook account
	
	
	Scenario: Sad Path
		Given I am on the home page
    When I click "Sign up with Facebook"
    Then I should be on the home page and I should not see "Google"
	
	@omniauth_test
	Scenario: Happy Path
		Given I am on the home page
    When I click "Sign up with Facebook"
		Then I should see "Test User"
	