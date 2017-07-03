Given(/^I am on the news page$/) do
  visit news_index_path
end

Then(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, content|
  fill_in field, with: content
end

Then(/^I attach file$/) do
  attach_file('news[file]', "#{Rails.root}/spec/images/Agile_workflow.png", visible: false)
end

Given(/^the following news exist$/) do |table|
  table.hashes.each do |attr|
   create(:news,
          attr.except('file')
            .merge(file: File.new("spec/images/#{attr[:file]}")))
  end
end

Then(/^I should see "([^"]*)" file name "([^"]*)"$/) do |news_title, file_name|
  news = News.find_by(title: news_title)
  within '#news' do
    within ".news-#{news.id}" do
      expect(page).to have_css "img[src*='#{news.file.url}']"
    end
  end
end

Then(/^I should not see "([^"]*)"$/) do |content|
  expect(page).not_to have_content content
end
