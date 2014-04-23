require 'spec_helper'

describe DropFilesController do

  describe "GET 'new'" do
    it "returns http success" do
      visit "/drop_files/new"
      response.should be_success
    end
  end
  
end
