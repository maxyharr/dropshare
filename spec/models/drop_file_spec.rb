require 'spec_helper'

describe DropFile do
  before { @drop_file = DropFile.new(name: "Test File", user_id: 1, attachment: "test_file.extension") }
  
  subject { @drop_file }
  
  it { should respond_to(:name) }
  it { should respond_to(:user_id) }
  it { should respond_to(:name) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }
  
  it { should_not respond_to(:foobar) }
  
  describe "when name is not present" do
    before { @drop_file.name = " " }
    it { should_not be_valid }
  end
  
  describe "when user_id is not present" do
    before { @drop_file.user_id = " " }
    it { should_not be_valid }
  end
  
  describe "when attachment is not present" do
    before { @drop_file.attachment = "" }
    it { should_not be_valid }
  end
  
  describe "when name is too long" do
    before { @drop_file.name = "a" * 12345 }
    it { should_not be_valid }
  end
end
