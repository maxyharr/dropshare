Given(/^I am signed in with facebook/) do
  mock_graph :get, 'me', 'users/me_private', :access_token => 'access_token' do
    user = FbGraph::User.me('access_token').fetch
  end
end

When(/^I sign in with facebook$/) do
  visit root_path
  mock_graph :get, 'me', 'users/me_private', :access_token => 'access_token' do
    user = FbGraph::User.me('access_token').fetch
  end
end
