json.array!(@masterpieces) do |masterpiece|
  json.extract! masterpiece, :id, :recipe_id, :user_id, :description
  json.url masterpiece_url(masterpiece, format: :json)
end
