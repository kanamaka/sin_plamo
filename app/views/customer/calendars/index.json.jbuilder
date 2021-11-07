json.array!(@calendars) do |calendar|
  json.extract! calendar, :id, :title, :content, :content_image
  json.start calendar.start_date
  json.end calendar.end_date
end