# For testing Omniauth log in with Facebook via Cucumber
# add the @omniauth_test keywork before the scenario like so:

# @omniauth_test
# Scenario: Something that requires login
# Given I am logged in
# And I go to a secure page
# Then I should see something secure

# Config success case:

# Config failure case
Before('@omniauth_test_failure') do
  OmniAuth.config.test_mode = true
  [:facebook].each do |service|
    OmniAuth.config.mock_auth[service] = :invalid_credentials
  end
end