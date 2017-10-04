json.array!(@japaneses) do |japanese|
  json.extract! japanese, :id
  json.url japanese_url(japanese, format: :json)
end
