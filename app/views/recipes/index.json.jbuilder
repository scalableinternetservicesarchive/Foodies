json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :user_id, :title, :description, :cook_time, :steps
  json.url recipe_url(recipe, format: :json)
end
