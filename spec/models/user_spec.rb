require 'spec_helper'

describe User do
  before { @user = User.new(name: "Test User", email: "test@test.com", uid: "12345", provider: "facebook", created_at: "2014-04-20 18:23:40", updated_at: "2014-04-22 22:36:22", oauth_token: "10987654321ABCDEFG", oauth_expires_at: "2014-04-23 00:00:00") }
  
  subject { @user }
  
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:uid) }
  it { should respond_to(:provider) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }
  it { should respond_to(:oauth_token) }
  it { should respond_to(:oauth_expires_at) }
  
  it { should_not respond_to(:foobar) }
  
  it { should be_valid }
  
  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end
  
  describe "when uid is not present" do
    before { @user.uid = " " }
    it { should_not be_valid }
  end
  
  describe "when provider is not present" do
    before { @user.provider = "" }
    it { should_not be_valid }
  end
  
  describe "when oauth_token is not present" do
    before { @user.oauth_token = "" }
    it { should_not be_valid }
  end
  
  describe "when oauth_expires_at is not present" do
    before { @user.oauth_expires_at = "" }
    it { should_not be_valid }
  end
  
  describe "when name is too long" do
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
  end
  
  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end
  
  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end
  
  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end
    
    it { should_not be_valid }
  end
  
  describe "email address with mixed case" do
    let(:mixed_case_email) { "Foo@ExAMPle.CoM" }
      
    it "should be saved as all lower-case" do
      @user.email = mixed_case_email
      @user.save
      expect(@user.reload.email).to eq mixed_case_email.downcase
    end
  end
  
end