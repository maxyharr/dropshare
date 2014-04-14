Given(/^I am signed in with facebook/) do
  visit root_path
  click_link("sign_in")
end

When(/^I sign in with facebook$/) do
  visit root_path
  click_link("sign_in")
end