json.array! @riders.each do |rider|
  json.id rider.id
  json.name rider.name
  json.ytlink rider.ytlink
  json.vimeolink rider.vimeolink
end
