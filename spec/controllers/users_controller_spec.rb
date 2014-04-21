require 'spec_helper'

describe UsersController do
  describe '.feed' do
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
end
