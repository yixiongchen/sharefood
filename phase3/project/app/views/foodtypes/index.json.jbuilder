json.array!(@foodtypes) do |foodtype|
  json.extract! foodtype, :id, :region, :cuisine
  json.url foodtype_url(foodtype, format: :json)
end
