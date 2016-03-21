json.array!(@questions) do |question|
  json.extract! question, :id, :title, :url, :slug
  json.url question_url(question, format: :json)
end
