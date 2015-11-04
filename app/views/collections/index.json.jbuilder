json.array!(@collections) do |collection|
  json.extract! collection, :id, :user_id, :name, :description
  json.url collection_url(collection, format: :json)
end
