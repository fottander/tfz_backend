FactoryGirl.define do
  factory :news do
    title 'MyString'
    content 'MyText'
    file { File.new("#{Rails.root}/spec/images/Agile_workflow.png") }
  end
end
