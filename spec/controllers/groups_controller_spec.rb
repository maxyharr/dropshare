require 'spec_helper'

describe GroupsController do
  describe ".create" do
    it "creates group and gets its name" do 
      group_name = "test group"
      members = ["123", "321"]
      testGroup = Group.new(:name => group_name, :members => members)
      testGroup.name.should == "test group"
    end
  end

  describe ".destroy" do 
    it "deletes test group" do

    end
  end
end
