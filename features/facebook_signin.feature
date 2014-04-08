Feature: Signing in to DropShare with Facebook
	In order to log into DropShare
	As a user
	I want to log in with my Facebook account
	
	
  Scenario: A user unsuccessfully signs in with their email/password
      Given I am on the homepage
      When I follow "sign_in"
      And I "unsuccessfully" sign in with email and pass
      Then I should see "Failed."

  @omniauth_test_success
    Scenario: A user successfully signs in with Facebook
      Given I am on the homepage
      And I follow "sign_in"
      Then I should see "Login successful."

  @omniauth_test_failure
    Scenario: A user unsuccessfully signs in with Facebook
      Given I am on the homepage
      And I follow "sign_in"
      Then I should see "Failed."