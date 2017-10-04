json.array!(@vegetarians) do |vegetarian|
  json.extract! vegetarian, :id
  json.url vegetarian_url(vegetarian, format: :json)
end
