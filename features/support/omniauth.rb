# For testing Omniauth log in with Facebook via Cucumber
# add the @omniauth_test keywork before the scenario like so:

# @omniauth_test
# Scenario: Something that requires login
# Given I am logged in
# And I go to a secure page
# Then I should see something secure

Before('@omniauth_test') do
  OmniAuth.config.test_mode = true
 
  # the symbol passed to mock_auth is the same as the name of the provider set up in the initializer
  OmniAuth.config.mock_auth[:facebook] = {
      "provider"=>"facebook",
      "uid"=>"http://xxxx.com/openid?id=118181138998978630963",
      "user_info"=>{"email"=>"test@xxxx.com", "first_name"=>"Test", "last_name"=>"User", "name"=>"Test User"}
  }
end
 
After('@omniauth_test') do
  OmniAuth.config.test_mode = false
end