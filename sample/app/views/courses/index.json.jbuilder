json.array!(@courses) do |course|
  json.extract! course, :id, :name, :desc
  json.url course_url(course, format: :json)
end
