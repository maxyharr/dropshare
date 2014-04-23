Feature: Navigating around the site

  In order to navigate to different pages
  As a user
  I want to click on links to differnet pages
	
  @omniauth_test_success
    Scenario: Move from feed page to wall page
      Given I am signed in with facebook
      Then I should be on the feed page
      When I follow "wall_link"
      Then I should be on the show page
      And I should see "Test User's Wall"
  
  Scenario: Move from home page to home page 
    Given I am on the home page
    When I go to the home page
    Then I should see "Welcome to Dropshare"
		
  Scenario: Move from home page to contact page 
    Given I am on the home page
    When I go to the contact page
    Then I should see "Contact Us"

  Scenario: Click link from Home page to about page
    Given I am on the home page
    When I follow "about"
    Then I should be on the about page

  Scenario: Click link from Home page to contact page
    Given I am on the home page
    When I follow "contact"
    Then I should be on the contact page

  Scenario: Click link from Home page to home page
    Given I am on the home page
    When I follow "home"
    Then I should be on the home page
    
  Scenario: Move from contact page to about page
    Given I am on the contact page
    When I go to the about page
    Then I should see "About Dropshare"

  Scenario: Click link from Contact to Contact page
    Given I am on the contact page
    When I follow "contact"
    Then I should be on the contact page

  Scenario: Click link from Contact to About page
    Given I am on the contact page
    When I follow "about"
    Then I should be on the about page
  
  Scenario: Click link from Contact to Home page
    Given I am on the contact page
    When I follow "home"
    Then I should be on the home page
  
  Scenario: Move from about page to help page
    Given I am on the about page
    When I go to the help page
    Then I should see "Help from Dropshare"

  Scenario: Click Home from about
    Given I am on the about page
    When I follow "home"
    Then I should be on the home page


    
