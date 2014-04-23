FactoryGirl.define do
  factory :user do
    name              "Test User"
    email             "test@foobar.com"
    uid               "12345"
    provider          "facebook"
    oauth_token       "10987654321ABCDEFG"
    oauth_expires_at  "2014-04-23 00:00:00"
  end
end