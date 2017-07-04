Given(/^the following users exist$/) do |table|
  table.hashes.each do |hash|
    create(:user, hash)
  end
end

Given(/^I am on the root page$/) do
  visit root_path
end

Then(/^"([^"]*)" should be marked as "([^"]*)"$/) do |email, option|
  user = User.find_by(email: email)
  expect(user.role).to eq option
end
