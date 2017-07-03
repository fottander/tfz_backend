Given(/^the following users exist$/) do |table|
  table.hashes.each do |hash|
    create(:user, hash)
  end
end

Given(/^I am on the root page$/) do
  visit root_path
end

Given(/^I select "([^"]*)" from "([^"]*)"$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^"([^"]*)" should be marked as "([^"]*)"$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end
