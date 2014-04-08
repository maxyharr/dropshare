# For testing Omniauth log in with Facebook via Cucumber
# add the @omniauth_test keywork before the scenario like so:

# @omniauth_test
# Scenario: Something that requires login
# Given I am logged in
# And I go to a secure page
# Then I should see something secure

# Config success case:
Before('@omniauth_test_success') do
  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:facebook] = {
    "provider"  => "facebook",
    "uid"       => '12345',
    "user_info" => {
      "email" => "email@email.com",
      "first_name" => "John",
      "last_name"  => "Doe",
      "name"       => "John Doe"
      # any other attributes you want to stub out for testing
    }
  }
end

# Config failure case
Before('@omniauth_test_failure') do
  OmniAuth.config.test_mode = true
  [:default, :facebook, :twitter].each do |service|
    OmniAuth.config.mock_auth[service] = :invalid_credentials
    # or whatever status code you want to stub
  end
end