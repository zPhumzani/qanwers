json.array!(@admin_answers) do |admin_answer|
  json.extract! admin_answer, :id, :question_id, :body, :user_id
  json.url admin_answer_url(admin_answer, format: :json)
end
