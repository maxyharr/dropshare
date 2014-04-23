require 'spec_helper'

describe DropFilesController do

  describe "GET 'new'" do
    it "returns http success" do
      visit "/drop_files/new"
      response.should be_success
    end
  end

  describe ".create" do
    it "uploads users file" do
      test_drop_file = DropFile.new(name: "Test File", user_id: 1, attachment: "test_file.extension")
      test_drop_file.save
      test_drop_file.name.should == "Test File"
    end
  end
end
