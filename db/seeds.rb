News.delete_all
User.delete_all

News.create(
  title: "Awesome travel insights",
  content: "Let me tell you about my trip to British Columbia",
  file: File.new("#{Rails.root}/spec/images/Agile_workflow.png")
  )

News.create(
  title: "Great skiing in Aspen",
  content: "Let me tell you about my trip to Aspen",
  file: File.new("#{Rails.root}/spec/images/Agile_workflow.png")
  )

News.create(
  title: "Follow John to the best place in Europe",
  content: "Europe is now better than ever",
  file: File.new("#{Rails.root}/spec/images/Agile_workflow.png")
  )

User.create(
  email: "felix@tfz.com",
  password: "12345678",
  )

puts "Created #{News.count} news"
puts "Created #{User.count} user"
