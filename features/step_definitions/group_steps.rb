Then(/^I should see my friends$/) do
  text = 'Max Harris'
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end

end
