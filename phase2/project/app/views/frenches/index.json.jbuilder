json.array!(@frenches) do |french|
  json.extract! french, :id
  json.url french_url(french, format: :json)
end
