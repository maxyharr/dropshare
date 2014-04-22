require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    before { visit user_path(user.id) }
    
    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end

  describe "signup page" do
    @omniauth_test_failure
    before { visit root_path }
    it { should have_content('Sign up with Facebook') }
  end
end