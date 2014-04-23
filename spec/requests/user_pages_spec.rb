require 'spec_helper'

describe "User pages" do
  
  subject { page }

  describe "home page" do
    before { visit root_path }

    it { should have_content('Sign up with Facebook') }
    it { should have_title(full_title('')) }
  end
  
  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    # puts "========================================================================================="
    # puts "#{user}"
    # puts "========================================================================================="
      before { visit user_path(user) }

      it { should have_content(user.name) }
      it { should have_title(user.name) }
  end
end