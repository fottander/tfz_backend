Given(/^the following riders exist$/) do |table|
  table.hashes.each do |hash|
    create(:rider, name: hash[:name], ytlink: hash[:ytlink], vimeolink: hash[:vimeolink] )
  end
end

Given(/^I am on the riders page$/) do
  visit riders_path
end
