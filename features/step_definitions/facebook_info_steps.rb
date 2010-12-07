Given /I am logged in/ do
  visit root_url
  click_link 'Sign in with Facebook'
end

Then /I should see my photo/ do
  page.should have_xpath('//img[@src="https://graph.facebook.com/1234567/picture"]')
end

