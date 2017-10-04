json.array!(@chineses) do |chinese|
  json.extract! chinese, :id, :name
  json.url chinese_url(chinese, format: :json)
end
