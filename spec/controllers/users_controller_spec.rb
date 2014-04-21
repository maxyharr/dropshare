require 'spec_helper'

describe UsersController do
  before do
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end

    it "sets a session variable to the OmniAuth auth hash" do
      request.env["omniauth.auth"][:uid].should == '1234'
    end
    
    
end
