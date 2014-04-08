Feature: Navigating around the site

	In order to navigate to different pages
	As a user
	I want to click on links to differnet pages
	
	
	Scenario: Move from home page to home page 
		Given I am on the home page
		When I go to the home page
    Then I should see "Welcome to Dropshare"
		
	Scenario: Move from home page to contact page 
    Given I am on the home page
    When I go to the contact page
    Then I should see "Contact Us"
    
  Scenario: Move from contact page to about page
    Given I am on the contact page
    When I go to the about page
    Then I should see "About Dropshare"
  
  Scenario: Move from about page to help page
    Given I am on the about page
    When I go to the help page
    Then I should see "Help from Dropshare"
    