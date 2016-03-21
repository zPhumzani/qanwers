json.array!(@admin_categories) do |admin_category|
  json.extract! admin_category, :id, :user_id, :name
  json.url admin_category_url(admin_category, format: :json)
end
