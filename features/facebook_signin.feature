Feature: Signing in to DropShare with Facebook
	In order to log into DropShare
	As a user
	I want to log in with my Facebook account

  Background: Start from home page
    Given I am on the home page
    Then I should see "Sign in" 


  Scenario: A user successfully signs in with facebook (Happy Path)
    When I sign in with facebook
    And I go to the home page
    Then I should be on the feed page
    And I should see "Test User is logged in"
      

  Scenario: A user unsuccessfully signs in with facebook (Sad Path)
    When I follow "Sign in"
    And I go to the feed page
    Then I should be on the home page
    