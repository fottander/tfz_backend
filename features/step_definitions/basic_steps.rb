Then(/^I should see "([^"]*)"$/) do |content|
  expect(page).to have_content content
end

Given(/^I click "([^"]*)"$/) do |button|
  click_link_or_button button
end

Then(/^show me the page$/) do
 save_and_open_page
end
