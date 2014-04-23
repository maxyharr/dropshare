require 'spec_helper'

describe StaticPagesController do

  describe "GET 'index'" do
    it "returns http success" do
      visit root_path
      response.should be_success
    end
  end

  describe "GET 'about'" do
    it "returns http success" do
      visit about_path
      response.should be_success
    end
  end

  describe "GET 'contact'" do
    it "returns http success" do
      visit contact_path
      response.should be_success
    end
  end

  describe "GET 'help'" do
    it "returns http success" do
      visit help_path
      response.should be_success
    end
  end

end
