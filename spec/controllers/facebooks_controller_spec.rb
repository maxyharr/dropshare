require 'spec_helper'

describe FacebooksController do
  describe '.new' do
    it 'should setup all supported attributes' do
      attributes = {
        :id => '12345',
        :name => "Luke Woodruff",
        :friends => "friend1, someOtherPerson"
      }
      user = FbGraph::User.new(attributes.delete(:id),attributes)
      user.name.should == "Luke Woodruff"
    end
  end
  
  describe '.friends' do 
    it 'should return a users friends' do
      mock_graph :get, 'me/friends', 'users/friends/me_private', :access_token => 'access_token' do
        users = FbGraph::User.new('me', :access_token => 'access_token').friends
        users.each do |user|
          user.should be_instance_of(FbGraph::User)
        end
      end
    end
  end
end
