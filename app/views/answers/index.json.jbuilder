json.array!(@answers) do |answer|
  json.extract! answer, :id, :question_id, :body, :user_id
  json.url answer_url(answer, format: :json)
end
