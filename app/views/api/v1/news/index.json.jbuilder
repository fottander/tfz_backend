json.array! @news.each do |news|
  json.id news.id
  json.title news.title
  json.content news.content
  json.all_tags news.all_tags
  json.file news.file
end
