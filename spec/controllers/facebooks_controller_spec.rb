
require 'spec_helper'

describe FacebooksController do

  mock_graph :get, 'me', 'users/me_private', :access_token => 'access_token' do
    user = FbGraph::User.me('access_token').fetch
    user.name.should == 'Luke Woodruff'
  end

  mock_graph :get, 'me', 'users/me_public', :status => [401, 'Unauthorized'] do
    lambda do
      FbGraph::User.fetch :me
    end.should raise_error FbGraph::Unauthorized
  end


end
