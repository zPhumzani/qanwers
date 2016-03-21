json.array!(@admin_questions) do |admin_question|
  json.extract! admin_question, :id, :user_id, :category_id, :body, :slug
  json.url admin_question_url(admin_question, format: :json)
end
