json.array!(@courses) do |course|
  json.extract! course, :id, :instructor, :year, :term, :quantity, :description, :title
  json.url course_url(course, format: :json)
end
