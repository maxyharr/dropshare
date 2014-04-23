require 'spec_helper'

describe "Static pages" do
  
  subject { page }
  
  describe "index page" do
    before { visit root_path }

    it { should have_content('Sign up with Facebook')}
    it { should have_title(full_title('')) }
    it { should_not have_title('| Home') }
  end
  
  describe "help page" do
    before { visit help_path }
    it { should have_content("Help from Dropshare")}
    it { should have_title full_title('Help')}
  end
  
  describe "about page" do
    before { visit about_path }
    it { should have_content "Make sharing easy between friends" }
    it { should have_title full_title('About') }
  end
  
  describe "contact page" do
    before { visit contact_path }
    it { should have_content "Contact Us" }
    it { should have_title full_title('Contact') }
  end
  
end